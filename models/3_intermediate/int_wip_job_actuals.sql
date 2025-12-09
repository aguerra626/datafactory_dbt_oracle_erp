select 
standard_hash(stg_base.we_wip_entity_id || stg_base.we_organization_id, 'MD5') wip_job_sk,
stg_base.we_organization_id,
stg_base.we_wip_entity_id,
stg_base.we_wip_entity_name,
stg_base.wdj_primary_item_id,
min(stg_base.mt44_transaction_date) earliest_completion_date,
max(stg_base.mt44_transaction_date) latest_completion_date,
sum(stg_base.mt44_transaction_quantity) job_actual_completed_qtys
from {{ ref('int_wip_assembly_completions') }} stg_base
where 1=1
group by
stg_base.we_organization_id,
we_wip_entity_id,
we_wip_entity_name,
wdj_primary_item_id