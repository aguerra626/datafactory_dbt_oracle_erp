--one row per wip job per assy
select 
we_wip_entity_id,
we_wip_entity_name,
wdj_primary_item_id,
job_actual_completed_qtys,
"Part Number"
from {{ ref('int_wip_job_actuals') }}
join {{ ref('dim_item_master') }}
on wdj_primary_item_id = msib_inventory_item_id
and we_organization_id = msib_organization_id