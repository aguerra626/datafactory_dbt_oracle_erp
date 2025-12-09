WITH brd1 AS (
    SELECT
--    brd1.rowid row_id,
        brd1.component_reference_designator,
        bic2.component_sequence_id
/*    brd1.last_update_date,
    brd1.last_updated_by,
    brd1.creation_date,
    brd1.created_by,
    brd1.last_update_login,
    brd1.ref_designator_comment,
    bic1.implementation_date, 
 
    brd1.acd_type,
    brd1.change_notice,
    brd1.attribute_category,
    brd1.attribute1,
    brd1.attribute2,
    brd1.attribute3,
    brd1.attribute4,
    brd1.attribute5,
    brd1.attribute6,
    brd1.attribute7,
    brd1.attribute8,
    brd1.attribute9,
    brd1.attribute10,
    brd1.attribute11,
    brd1.attribute12,
    brd1.attribute13,
    brd1.attribute14,
    brd1.attribute15,
    brd1.request_id,
    brd1.program_application_id,
    brd1.program_id,
    brd1.program_update_date
    -*/
    FROM
        bom_reference_designators   brd1,
        bom_components_b     bic1,
        bom_components_b     bic2
    WHERE
        brd1.component_sequence_id = bic1.component_sequence_id
        AND nvl(brd1.acd_type, 1) <> 3
        AND bic2.bill_sequence_id = bic1.bill_sequence_id
        AND DECODE(bic2.implementation_date, NULL, bic2.old_component_sequence_id, bic2.component_sequence_id) = DECODE(bic1.implementation_date
        , NULL, bic1.old_component_sequence_id, bic1.component_sequence_id)
    AND bic1.effectivity_date = (
            SELECT
                MAX(bic3.effectivity_date)
            FROM
                bom_reference_designators   brd2,
                bom_components_b     bic3
            WHERE
                bic3.component_sequence_id = brd2.component_sequence_id
                AND DECODE(bic3.implementation_date, NULL, bic3.old_component_sequence_id, bic3.component_sequence_id) = DECODE(bic1
                .implementation_date, NULL, bic1.old_component_sequence_id, bic1.component_sequence_id)
                AND bic3.bill_sequence_id = bic2.bill_sequence_id
                AND brd2.component_reference_designator = brd1.component_reference_designator
                AND bic3.effectivity_date <= bic2.effectivity_date
        )
)
SELECT distinct
    bsb.assembly_item_id,
    bsb.organization_id,
    msib.segment1           assembly_item_number,
    msib.description        assembly_item_description,
     bsb.bill_sequence_id,
    bic.operation_seq_num   routing_op_sequence,
    bic.component_sequence_id,
    bic.component_item_id,
    bic.item_num            item_num,
    msibc.segment1          component_item_number,
    msibc.description       component_item_description,
    msibc.full_lead_time    component_lead_time,
    CIC.ITEM_COST STANDARD_COSTS,
    brd1.component_reference_designator,
    bcb.operation_seq_num,
    bcb.component_quantity,
    bos.operation_description, --'=======',bcb.*,
      (
        SELECT  
     -- t1.inventory_item_id,
     -- t1.organization_id,
            t1.revision
        FROM
            (
                SELECT
                    inventory_item_id,
                    organization_id,
                    mira.revision,
            --  effectivity_date,
                    RANK() OVER(
                        PARTITION BY inventory_item_id, organization_id
                        ORDER BY
                            inventory_item_id, organization_id, effectivity_date DESC
                    ) row_location
                FROM
                    mtl_item_revisions_b mira
                WHERE
                    1 = 1
                    AND mira.inventory_item_id = bsb.assembly_item_id -- 12430172
                    AND mira.organization_id = bsb.organization_id -- 1213
            ) t1
        WHERE
            row_location = 1)   assembly_revision
FROM
    bom_structures_b           bsb,
    mtl_system_items_b         msib,
    bom_components_b           bic,

    mtl_system_items_b         msibc,
    brd1, --bom_reference_designators 
    bom_operational_routings   bor,
    bom_operation_sequences    bos,
    bom_components_b   bcb,  ----- Added for BOM quantity 10/27/2020 --
    BOM.CST_ITEM_COSTS CIC
WHERE
    nvl(bsb.effectivity_control, 1) <= 3
    AND bsb.organization_id = 1213
    AND bsb.assembly_item_id = msib.inventory_item_id
    AND bsb.organization_id = msib.organization_id
    and bcb.effectivity_date <= sysdate and (bcb.disable_date >= sysdate or bcb.disable_date is null)
    AND bsb.bill_sequence_id = bic.bill_sequence_id
    AND bic.component_item_id = msibc.inventory_item_id --component 
    AND bsb.organization_id = msibc.organization_id
    AND nvl(bic.eco_for_production, 2) = 2
    AND brd1.component_sequence_id = bic.component_sequence_id --11/2/22 Removed  + to show items with component designators
    AND bic.effectivity_date <= SYSDATE --GET 10/27/22
    AND bic.disable_date IS NULL --GET 10/27/22
    and bic.implementation_date <=sysdate --GET 1/31/23 - dont include unimplemented ecos
    ---- routing table commenction to get operation_description --
    AND bos.routing_sequence_id(+) = bor.routing_sequence_id
    AND bos.effectivity_date(+) <= SYSDATE
    AND bos.disable_date(+) IS NULL
    AND bos.operation_seq_num(+) = bic.operation_seq_num --100
    AND bor.assembly_item_id(+) = bsb.assembly_item_id  -- 12395669 
   AND bor.organization_id(+) = bsb.organization_id
    -------------------------------
    --AND msib.segment1 LIKE '966-2700-004'--upper((:PAR_ASSEMBLY_ITEM_NUMBER))  --- '966-6586-004+MP' --    Assembly Mat No  assembly_item_number,
    --AND msibc.segment1 LIKE upper(:PAR_COMP_ITEM_NUMBER) --=  '184-0517-494' --Com Mat No 913-3084-544' --
    --and (bic.operation_seq_num = :PAR_OP_SEQ or :PAR_OP_SEQ is null)  -- 10/27/22
    --AND (bic.item_num = :PAR_ITEM_NUM or :PAR_ITEM_NUM is null) -- 10/27/22
    --- Added for BOM quantity 10/27/2020 --
    AND bsb.bill_sequence_id = bcb.bill_sequence_id
    AND bcb.component_item_id = msibc.inventory_item_id
    AND  bcb.operation_seq_num = bic.operation_seq_num
 AND  (  NVL(bcb.component_quantity,0) > 0) --11/02/2022
--    AND  (  bcb.component_quantity >= :PAR_COMP_QTY or :PAR_COMP_QTY IS NULL)  -- 10/27/22
    --- End of addition for BOM quantity 10/27/2020 --
    --AND ROWNUM <3000
    AND msibc.INVENTORY_ITEM_ID = CIC.INVENTORY_ITEM_ID
    AND msibc.ORGANIZATION_ID = CIC.ORGANIZATION_ID
    AND CIC.COST_TYPE_ID = 1 -- Frozen Standard Costs
ORDER BY
    bsb.assembly_item_id,
    routing_op_sequence,
    component_item_number,
    bic.item_num,
    component_reference_designator