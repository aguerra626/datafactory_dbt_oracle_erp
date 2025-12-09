SELECT
stg_base.*,
join1.bd_fm_department_code,
join1.bd_fm_description
FROM {{ ref('stg_qa_dd_lf_pch_lf_rr__lf_stg_we_wdj__lf_stg_msib_lf_mp') }} stg_base
LEFT JOIN {{ ref('src_bom_departments_from') }} join1
ON stg_base.rr_department_id = join1.bd_fm_department_id