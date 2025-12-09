SELECT
    stg_we_wdj_wmt.*,
    src_msib_mp.*

FROM
    {{ ref('stg_we_wdj_wmt365days') }}
    stg_we_wdj_wmt
    JOIN {{ ref('stg_msib_mp') }} src_msib_mp
    ON stg_we_wdj_wmt.wdj_primary_item_id = src_msib_mp.msib_inventory_item_id
    and stg_we_wdj_wmt.wdj_organization_id = src_msib_mp.msib_organization_id
