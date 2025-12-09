select
we.*
from apps.wip_entities we
join apps.wip_discrete_jobs wdj
on we.wip_entity_id = wdj.wip_entity_id
and we.organization_id = wdj.organization_id
join apps.wip_operations wop
on wop.wip_entity_id = wdj.wip_entity_id
and wop.organization_id = wdj.organization_id
join apps.mtl_systems_items_b msib
on wdj.primary_item_id = msib.inventory_item_id
and wdj.organization_id = msib.organization_id
join apps.mtl_planners mp
on msib.planner_code = mp.planner_code
and msib.organization_id = mp.organization_id
where we.organization_id = 1213

-- study referential integrity in dbt for relationships. Defined joining keys directly