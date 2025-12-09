SELECT
    stg_we_wdj_foj_wmt_foj_fm_wop_fm_bd.*,
    stg_msib_mp.*
FROM
    {{ ref('stg_we_wdj_foj_wmt_foj_fm_wop_fm_bd') }}
    stg_we_wdj_foj_wmt_foj_fm_wop_fm_bd
    JOIN {{ ref('stg_msib_mp') }}
    stg_msib_mp
    ON stg_we_wdj_foj_wmt_foj_fm_wop_fm_bd.wdj_primary_item_id = stg_msib_mp.msib_inventory_item_id
    AND stg_we_wdj_foj_wmt_foj_fm_wop_fm_bd.wdj_organization_id = stg_msib_mp.msib_organization_id