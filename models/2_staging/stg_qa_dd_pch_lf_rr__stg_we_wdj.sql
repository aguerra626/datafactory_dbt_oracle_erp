SELECT
stg_base.*,
join1.we_wip_entity_name,
join1.meaning_we_entity_type,
join1.wdj_source_code,
join1.meaning_wdj_status_type,
join1.wdj_class_code,
join1.meaning_wdj_job_type
FROM {{ ref('stg_qa_dd_pch_lf_rr') }} stg_base
JOIN {{ ref('stg_we_wdj') }} join1
ON stg_base.dd_wip_entity_id = join1.we_wip_entity_id