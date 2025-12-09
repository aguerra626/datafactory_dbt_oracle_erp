SELECT
    stg_we_wdj_msib.*,
    src_mt44.*

FROM
    {{ ref('stg_we_wdj_msib') }} stg_we_wdj_msib
    JOIN {{ ref('src_inv_mtl_material_transactions_type44') }} src_mt44
    ON stg_we_wdj_msib.we_wip_entity_id = src_mt44.mt44_transaction_source_id
    and stg_we_wdj_msib.we_organization_id = src_mt44.mt44_organization_id
