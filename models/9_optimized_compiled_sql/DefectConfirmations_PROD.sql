/*
DATA MODEL:

EMPLOYEE NAME 1
DATE          2
JOB NAME      3
FM OP #       4
PART NUMBER   5
SERIAL NUMBER 6
TRANSACTION TYPE 7
QTY           8
*/

SELECT
FND_USER.USER_NAME              AS "FULL NAME" -- 1
  , TO_DATE(WMT.TRANSACTION_DATE , 'DD-MON-YY')       AS "TRANSACTION DATE" -- 2
  , WE.WIP_ENTITY_NAME          AS "WIP ENTITY NAME" -- 3
  , WMT.FM_OPERATION_SEQ_NUM    AS "FM OP SEQ NUM" -- 4
  , MS.SEGMENT1                 AS "PART NUMBER" -- 5  
  , NULL                        AS "SERIAL NUMBER" -- 6
  , 'CONFIRMATIONS'             AS "TRANSACTION TYPE" -- 7
  , WMT.TRANSACTION_QUANTITY    AS "TRANSACTION QTY" -- 8
  , lu.meaning                  AS "Job Type"
  --, WMT.TRANSACTION_ID --Applying TO_CHAR slows down performance
FROM
    WIP.WIP_MOVE_TRANSACTIONS WMT
    JOIN WIP.WIP_OPERATIONS FMWOP
        ON WMT.WIP_ENTITY_ID = FMWOP.WIP_ENTITY_ID 
            AND WMT.FM_OPERATION_SEQ_NUM = FMWOP.OPERATION_SEQ_NUM
            AND WMT.ORGANIZATION_ID = FMWOP.ORGANIZATION_ID
    JOIN WIP.WIP_OPERATIONS TOWOP
        ON WMT.WIP_ENTITY_ID = TOWOP.WIP_ENTITY_ID 
            AND WMT.FM_OPERATION_SEQ_NUM = TOWOP.OPERATION_SEQ_NUM
            AND WMT.ORGANIZATION_ID = TOWOP.ORGANIZATION_ID
    JOIN APPS.BOM_DEPARTMENTS FMD
        ON WMT.FM_DEPARTMENT_ID = FMD.DEPARTMENT_ID
    JOIN APPS.BOM_DEPARTMENTS TOD
        ON WMT.TO_DEPARTMENT_ID = TOD.DEPARTMENT_ID
    JOIN WIP.WIP_ENTITIES WE 
        ON WMT.WIP_ENTITY_ID = WE.WIP_ENTITY_ID
    JOIN WIP.WIP_DISCRETE_JOBS wdj
        ON we.wip_entity_id = wdj.wip_entity_id
        and we.organization_id = wdj.organization_id
    JOIN INV.MTL_SYSTEM_ITEMS_B MS
        ON WMT.PRIMARY_ITEM_ID = MS.INVENTORY_ITEM_ID
        AND WMT.ORGANIZATION_ID = MS.ORGANIZATION_ID
    LEFT JOIN APPS.FND_USER 
        ON FND_USER.USER_ID = WMT.CREATED_BY
    LEFT JOIN apps.fnd_lookup_values lu
        ON wdj.job_type = lookup_code
        AND lu.lookup_type = 'WIP_ENTITIES'  
WHERE
    WMT.ORGANIZATION_ID = 1213
    AND WMT.TRANSACTION_DATE >= sysdate - 400
    AND WMT.SCRAP_ACCOUNT_ID IS NULL -- Remove Scrap Qtys
    
UNION ALL

SELECT
--  TO_CHAR(QR.CHARACTER1)                         DEF_DETAIL_ID -- 1
QR.CHARACTER3                         INSPECTOR          -- 1
, TO_DATE(QR.qa_creation_date , 'DD-MON-YY') CREATION_DATE -- 2
, WE.WIP_ENTITY_NAME                    JOB              -- 3
, QR.FROM_OP_SEQ_NUM                    FROM_OP_SEQ_NUMBER -- 4
, MSIK.SEGMENT1                         ITEM             -- 5
, QR.CHARACTER10                        CR_SERIAL_NUMBER -- 6
, 'DEFECTS'                             TRANSACTION_TYPE -- 7
, qr.quantity                quantity                    -- 8
, lu.meaning                  AS "Job Type"
FROM
  QA_RESULTS                    QR
, QA_PLANS                      QP
, WIP_ENTITIES                  we
, WIP.WIP_DISCRETE_JOBS         wdj
, apps.fnd_lookup_values lu
, MTL_SYSTEM_ITEMS_B            MSIK
, QA_RESULTS                    QRESULT
, QA_PLANS                      QRESULTP
, BOM_DEPARTMENTS               BD
, FND_USER                      FU
, qa.qa_pc_results_relationship   pch

WHERE
qp.name = 'DEFECT DETAILS NSS'
    AND qr.plan_id = qp.plan_id
    AND qp.plan_id = qr.plan_id
    AND qr.wip_entity_id = we.wip_entity_id (+)
    AND qr.item_id = msik.inventory_item_id (+)
    AND qr.organization_id = msik.organization_id (+)
    -- AND qr.vendor_id = pv.vendor_id (+)
    and FU.USER_ID = Qr.QA_CREATED_BY 
    AND ( qr.status IS NULL
          OR qr.status = 2 )
    AND ( pch.child_plan_id = qr.plan_id (+)
          AND pch.child_occurrence = qr.occurrence (+)
          AND pch.child_collection_id = qr.collection_id (+) )
    AND qr.organization_id IN (
            1213,
        1273
    )
    AND qr.qa_creation_date >= sysdate - 400
    -- Added 3/14/23 --
       AND qresultp.name = 'RESULTS RECORDING NSS'
    AND qresultp.plan_id = qresult.plan_id
    AND   pch.parent_plan_id  = qresult.plan_id
    and pch.parent_collection_id   =qresult.collection_id
   AND pch.parent_occurrence = qresult.occurrence
   AND qresult.department_id = bd.department_id
   and we.wip_entity_id = wdj.wip_entity_id
  and we.organization_id = wdj.organization_id
  and wdj.job_type = lookup_code
  AND lu.lookup_type = 'WIP_ENTITIES' 
 --   and  qr.character1      in (8180185,8178727)
UNION ALL
 -- part 2 of union --

 /********************************************************************************
SELECT
  QR.CHARACTER1                         DEF_DETAIL_ID -- 1
, QR.CHARACTER3                         INSPECTOR -- 2
, TO_DATE (QR.qa_creation_date, 'YYYY/MM/DD') CREATION_DATE -- 3
, WE.WIP_ENTITY_NAME                    JOB -- 4
, QR.FROM_OP_SEQ_NUM                    FROM_OP_SEQ_NUMBER -- 5
, MSIK.SEGMENT1                         ITEM -- 6
, QR.CHARACTER10                        CR_SERIAL_NUMBER -- 7
  ******************************************************************************/
SELECT
--TO_CHAR(QR.CHARACTER1) DEF_DETAIL_ID
QR.CHARACTER3 INSPECTOR           -- 1
, TO_DATE(QR.qa_creation_date , 'DD-MON-YY') CREATION_DATE -- 2
, WE.WIP_ENTITY_NAME JOB          -- 3
, QR.FROM_OP_SEQ_NUM FROM_OP_SEQ_NUMBER -- 4
, MSIK.SEGMENT1 ITEM              -- 5
, QR.CHARACTER10 CR_SERIAL_NUMBER -- 6
, 'DEFECTS'                             TRANSACTION_TYPE -- 7
, qr.quantity                quantity -- 8
, lu.meaning                  AS "Job Type"
FROM
  QA_RESULTS QR
, QA_PLANS QP
, WIP_ENTITIES                  we
, WIP.WIP_DISCRETE_JOBS         wdj
, apps.fnd_lookup_values lu
, MTL_SYSTEM_ITEMS_B MSIK
-- , AP_SUPPLIERS PV
,
 --qa.qa_pc_results_relationship   pch
  WIP_DISCRETE_JOBS WJ
, FND_USER FU
WHERE
  QP.NAME = 'DEFECT DETAILS NSS'
  AND QR.PLAN_ID = QP.PLAN_ID
  AND QP.PLAN_ID = QR.PLAN_ID
  AND QR.WIP_ENTITY_ID = WE.WIP_ENTITY_ID (+)
  AND QR.ITEM_ID = MSIK.INVENTORY_ITEM_ID (+)
  AND QR.ORGANIZATION_ID = MSIK.ORGANIZATION_ID (+)
  -- AND QR.VENDOR_ID = PV.VENDOR_ID (+)
  AND WJ.WIP_ENTITY_ID = QR.WIP_ENTITY_ID
  AND FU.USER_ID = QR.QA_CREATED_BY
  AND WJ.SOURCE_CODE IN ('DEPOT_REPAIR') --added to limit data to CRG
  AND (QR.STATUS IS NULL
  OR QR.STATUS = 2)
  AND QR.ORGANIZATION_ID IN (1213, 1273)
  AND QR.QA_CREATION_DATE >= sysdate - 400
  and we.wip_entity_id = wdj.wip_entity_id
  and we.organization_id = wdj.organization_id
  and wdj.job_type = lookup_code
  AND lu.lookup_type = 'WIP_ENTITIES' 
 --   AND we.wip_entity_name = '981150-NSS' -- job