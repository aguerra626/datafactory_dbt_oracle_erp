SELECT 
-- business keys
rr.department_id as rr_department_id, --1
dd.wip_entity_id as dd_wip_entity_id, --2
DD.FROM_OP_SEQ_NUM as "Defect Caught at Op",--"DD FROM OP SEQ", --3
DD.CHARACTER1 "Defect Detail ID", --4
FU.USER_NAME "DD CREATED BY", --5
TRUNC (DD.CREATION_DATE) "DD CREATION DATE", --6
DD.CHARACTER2 "DD INSPECTED", --7
DD.CHARACTER3 "DD INSPECTED BY", --8
we.wip_entity_name "Defect Caught at WIP JOB", -- DD WIP JOB --9
DD.Quantity as DD_Quantity, -- 10
MSI.SEGMENT1 "ASSEMBLY NUMBER", --11
MSI.DESCRIPTION "ASSEM DESCRIPTION", --12
DD.CHARACTER10 "DD SERIAL NUMBER", --13
SUBSTR (DD.CHARACTER18, 1, 1) "DEF FIRST CHAR", --14
DD.CHARACTER18 "DEFECT CODE", --15
DD.CHARACTER19 "DEFECT CODE DESC", --16
DD.CHARACTER24 "DT CAUSED BY", --17
DD.CHARACTER25 "DT CAUSED BY DESCRIPTION", --18
DD.CHARACTER13 "AFFECTED ASSEMBLY MATERIAL", --19
DD.CHARACTER14 "AFFECTED ASSY SN", --20
DD.CHARACTER23 "PROBLEM DESCRIPTION", --21
DD.COMMENT1 "PROBLEM DESCRIPTION LONG", --22
DD.CHARACTER21 "COMPONENT", --23
BCOMP.OPERATION_SEQ_NUM "BOM Default Component Placed At",--"COMP OP NUMBER", --24
CASE
  -- Returns numeric value after / from (Subassembly, 2nd / 130)
  WHEN BCOMP.OPERATION_SEQ_NUM = 1 THEN TO_NUMBER(REGEXP_SUBSTR(DD.CHARACTER24,'/\s*([0-9]+)',1,1,NULL,1))
  -- REGEXP_SUBSTR(source_string, pattern, start position, take 1st match, match_param, return 1st matching group)
  ELSE BCOMP.OPERATION_SEQ_NUM
END "Component Placed At", --25
dd.character20 "REF DESG", --26
RRW.WIP_ENTITY_NAME "Defect should of been caught at WIP Job", --27
RRW.primary_item_id "rr_primary_item_id", --28
RR.from_op_seq_num "Defect should of been caught at Op",--"OP NUM", --29
RR.CHARACTER3 "WIP INSP RESULT", --30
RR.CHARACTER51 "INSPECTED BY", --31
TO_DATE (RR.CHARACTER52, 'YYYY/MM/DD') "INSPECTION DATE" --32
FROM QA_RESULTS                 DD
JOIN WIP_ENTITIES               WE
  ON DD.WIP_ENTITY_ID = WE.WIP_ENTITY_ID
JOIN QA_PLANS                   QP
  ON QP.PLAN_ID = DD.PLAN_ID
  AND QP.NAME = 'DEFECT DETAILS NSS'
JOIN MTL_PARAMETERS             MP
  ON MP.ORGANIZATION_ID = QP.ORGANIZATION_ID
  AND MP.ORGANIZATION_CODE = 'NSS'
JOIN MTL_SYSTEM_ITEMS_B         MSI
  ON DD.ITEM_ID = MSI.INVENTORY_ITEM_ID
  AND DD.ORGANIZATION_ID = MSI.ORGANIZATION_ID
JOIN MTL_SYSTEM_ITEMS_B         MSIAA
  ON DD.CHARACTER13 = MSIAA.SEGMENT1
  AND DD.ORGANIZATION_ID = MSIAA.ORGANIZATION_ID
JOIN MTL_SYSTEM_ITEMS_B         MSIAC
  ON DD.CHARACTER21 = MSIAC.SEGMENT1
  AND DD.ORGANIZATION_ID = MSIAC.ORGANIZATION_ID
JOIN BOM_STRUCTURES_B           BS
  ON MSIAA.INVENTORY_ITEM_ID = BS.ASSEMBLY_ITEM_ID
  AND MSIAA.ORGANIZATION_ID = BS.ORGANIZATION_ID
JOIN BOM_COMPONENTS_B   BCOMP
  ON MSIAC.INVENTORY_ITEM_ID = BCOMP.COMPONENT_ITEM_ID
  AND BCOMP.BILL_SEQUENCE_ID = BS.BILL_SEQUENCE_ID
JOIN BOM_REFERENCE_DESIGNATORS  BREF
  ON BCOMP.COMPONENT_SEQUENCE_ID = BREF.COMPONENT_SEQUENCE_ID
  AND DD.CHARACTER20 = BREF.COMPONENT_REFERENCE_DESIGNATOR
JOIN QA_RESULTS                 RR
  ON MSIAA.INVENTORY_ITEM_ID = RR.ITEM_ID
  AND MSIAA.ORGANIZATION_ID = RR.ORGANIZATION_ID
  AND DD.CHARACTER14 = RR.CHARACTER1 -- "AFFECTED ASSY SN" = rr_serial_number
JOIN WIP_ENTITIES               RRW
  ON RR.WIP_ENTITY_ID = RRW.WIP_ENTITY_ID
JOIN FND_USER                   FU
  ON DD.QA_CREATED_BY = FU.USER_ID
 WHERE 1=1    
       AND DD.PLAN_ID = 5166
       AND RR.PLAN_ID = 5179                               --RESULTS RECORDING
       AND SUBSTR (DD.CHARACTER18, 1, 1) IN ('W', 'S', 'Q')
       AND (DD.status IS NULL OR DD.status = 2)
       AND BCOMP.OPERATION_SEQ_NUM <= RR.from_op_seq_num
       AND DD.CREATION_DATE >= sysdate - 365
       AND RR.last_update_DATE >= sysdate - 365 -- assumption: keep this for faster runtime 10/01/25
      -- identify the first inspection step (rr.from_op_seq_num) after the component placement
       AND RR.FROM_OP_SEQ_NUM =
           (SELECT MIN (RR2.from_op_seq_num)
              FROM QA_RESULTS RR2
             WHERE     RR2.PLAN_ID = RR.PLAN_ID
                   AND RR2.WIP_ENTITY_ID = RR.WIP_ENTITY_ID
                   AND RR2.ORGANIZATION_ID = RR.ORGANIZATION_ID
                   AND RR2.FROM_OP_SEQ_NUM >= 
                        --BCOMP.OPERATION_SEQ_NUM
                        CASE
                          WHEN BCOMP.OPERATION_SEQ_NUM = 1 THEN TO_NUMBER(REGEXP_SUBSTR(DD.CHARACTER24,'/\s*([0-9]+)',1,1,NULL,1))
                          ELSE BCOMP.OPERATION_SEQ_NUM
                        END
                        )
       AND EXISTS
       -- return only records that have parent child relationship.
               (SELECT 'X'
                  FROM QA_PC_RESULTS_RELATIONSHIP PC
                 WHERE     PC.CHILD_PLAN_ID = DD.PLAN_ID
                       AND PC.CHILD_OCCURRENCE = DD.OCCURRENCE
                       AND PC.CHILD_COLLECTION_ID = DD.COLLECTION_ID)
/*
return records where:
1. the job is same but the dd from op seq num is greater than rr from op seq num
- this is an inspection escape
2. The job is not same. Meaning, its at later job.
- this is an inspection escape since there was an inspection step at the first job but past all the way through to another job
*/
       AND (   (    dd.WIP_ENTITY_ID = RR.WIP_ENTITY_ID
                AND dd.FROM_OP_SEQ_NUM > rr.FROM_OP_SEQ_NUM)
            OR (dd.wip_entity_id != RR.wip_entity_id))
       AND DD.CHARACTER24 NOT IN ('NONM-UNK','NONM-VND','NONM-DSN')