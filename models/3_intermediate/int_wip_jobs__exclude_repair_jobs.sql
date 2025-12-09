SELECT
int_base.wdj_primary_item_id,
lu1.meaning wip_job_status,
int_base.we_wip_entity_name,
int_base.we_wip_entity_id,
int_base.wdj_scheduled_start_date,
int_base.wdj_scheduled_completion_date,
int_base.wdj_class_code

FROM {{ ref('stg_we_wdj') }} int_base
JOIN {{ ref('src_fnd_lookup_values') }} lu1
    ON int_base.wdj_status_type = lu1.lookup_code
    AND lu1.lookup_type = 'WIP_JOB_STATUS'
WHERE int_base.wdj_class_code IN ('CONVERSION','NONSTD-PRJ','Production','REWORK','TECH MKTG') -- exclude NSS- repair jobs