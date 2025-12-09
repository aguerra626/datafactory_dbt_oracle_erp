SELECT
stg_base.*,
join1.fu_description
FROM {{ ref('stg_qa_dd_lf_pch_lf_rr__lf_stg_we_wdj__lf_stg_msib_lf_mp__lf_bd_lf_s') }} stg_base
LEFT JOIN {{ ref('src_fnd_user') }} join1
ON stg_base.dd_qa_created_by = join1.fu_user_id