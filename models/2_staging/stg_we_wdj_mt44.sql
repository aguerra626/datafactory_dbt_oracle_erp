SELECT
    stg_base.*,
    src_mt44.*

FROM
    {{ ref('stg_we_wdj') }} stg_base
    JOIN {{ ref('src_inv_mtl_material_transactions_type44') }} src_mt44
    ON stg_base.we_wip_entity_id = src_mt44.mt44_transaction_source_id
    and stg_base.we_organization_id = src_mt44.mt44_organization_id
