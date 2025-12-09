SELECT
stg_base.*,
join1.s_vendor_name
FROM {{ ref('stg_qa_dd_lf_pch_lf_rr__lf_stg_we_wdj__lf_stg_msib_lf_mp__lf_bd') }} stg_base
LEFT JOIN {{ ref('src_ap_suppliers') }} join1
ON stg_base.dd_vendor_id = join1.s_vendor_id