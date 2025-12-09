SELECT
stg_base.*,
join1.*
FROM {{ ref('stg_qa_dd_pch_lf_rr__stg_we_wdj') }} stg_base
LEFT JOIN {{ ref('stg_msib_lf_mp') }} join1
ON stg_base.dd_item_id = join1.msib_inventory_item_id