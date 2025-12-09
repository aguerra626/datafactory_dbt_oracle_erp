SELECT
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd.*,
    stg_msib_mp.*
FROM
    {{ ref('stg_we_wdj_wmt_fm_to_wop_fm_to_bd') }}
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd
    JOIN {{ ref('stg_msib_mp') }}
    stg_msib_mp
    ON stg_we_wdj_wmt_fm_to_wop_fm_to_bd.wmt_primary_item_id = stg_msib_mp.msib_inventory_item_id
    AND stg_we_wdj_wmt_fm_to_wop_fm_to_bd.wmt_organization_id = stg_msib_mp.msib_organization_id