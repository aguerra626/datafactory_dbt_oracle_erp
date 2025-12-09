SELECT
    stg_base.we_wip_entity_name,
    stg_base.wmt_transaction_quantity,
    to_date(trunc(stg_base.wmt_transaction_date)) wmt_transaction_date,
    stg_base.wdj_primary_item_id
FROM
    {{ ref('stg_we_wdj_fm_wop_wmt45days') }}
    stg_base
    JOIN {{ ref('src_inv_mtl_secondary_inventories') }}
    src_msub
    ON src_msub.msub_secondary_inventory_name = stg_base.wdj_completion_subinventory
    AND src_msub.msub_organization_id = stg_base.wdj_organization_id
WHERE
    stg_base.wdj_organization_id = 1213 
    AND (stg_base.wop_fm_attribute5 = 'Y') -- credit op step
    AND stg_base.wmt_to_intraoperation_step_type IN (1,3) -- queue, to move types
    AND src_msub.msub_availability_type=1 -- nettable type
