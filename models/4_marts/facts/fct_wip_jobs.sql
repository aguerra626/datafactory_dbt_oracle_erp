-- fact grain: one row per wip entity id per organization id
select
-- surrogate key
standard_hash(base.we_wip_entity_id || base.we_organization_id, 'MD5') wip_job_sk,
-- business/natural keys
base.we_wip_entity_id, 
base.we_organization_id,
-- facts
base.wdj_start_quantity AS "Job Start Qty",
base.wdj_quantity_completed AS "Job Completed Qty",
base.wdj_quantity_scrapped AS "Job Scrapped Qty",
base.wdj_net_quantity AS "Job Remaining Qty",
join1.job_actual_completed_qtys
from {{ ref('stg_we_wdj') }} base
left join {{ ref('int_wip_job_actuals') }} join1
on base.we_wip_entity_id = join1.we_wip_entity_id
and base.we_organization_id = join1.we_organization_id