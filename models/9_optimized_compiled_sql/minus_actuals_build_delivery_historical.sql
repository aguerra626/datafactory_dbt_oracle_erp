select 
'actual build' as feature, 
x.transaction_date as "Transacted Date",
x.primary_item_id,
sum(x.transaction_quantity) as "Qtys"
from (
SELECT
trunc(wmt.transaction_date) as transaction_date,
wdj.primary_item_id,
sum(wmt.transaction_quantity) as transaction_quantity,
we.wip_entity_name

FROM
    apps.wip_entities we
    JOIN apps.wip_discrete_jobs wdj
    ON we.wip_entity_id = wdj.wip_entity_id
    AND we.organization_id = wdj.organization_id
    JOIN apps.wip_operations wop
    ON wdj.wip_entity_id = wop.wip_entity_id
    AND wdj.organization_id = wop.organization_id
    and wop.attribute5 ='Y' -- credit op step
    JOIN apps.wip_move_transactions wmt
    ON wop.wip_entity_id = wmt.wip_entity_id
    AND wop.operation_seq_num = wmt.fm_operation_seq_num
    AND wop.organization_id = wmt.organization_id
    JOIN apps.mtl_secondary_inventories msub
    ON wdj.completion_subinventory = msub.secondary_inventory_name
    AND wdj.organization_id = msub.organization_id

where we.organization_id = 1213 
and wmt.to_intraoperation_step_type in (1,3) -- queue, to move types
and msub.availability_type = 1 -- nettable type
and trunc(wmt.transaction_date) >= sysdate - 365


group by we.wip_entity_name, trunc(wmt.transaction_date), wdj.primary_item_id
) x
group by x.transaction_date, x.primary_item_id

UNION ALL

select 
'actual delivery' as feature,
x.transaction_date as "Transacted Date",
x.primary_item_id,
sum(x.transaction_quantity) AS "Qtys"
from (
select 
trunc(mt.transaction_date) transaction_date,
wdj.primary_item_id,
sum(mt.transaction_quantity) transaction_quantity,
we.wip_entity_name
FROM
    apps.wip_entities we
    JOIN apps.wip_discrete_jobs wdj
    ON we.wip_entity_id = wdj.wip_entity_id
    AND we.organization_id = wdj.organization_id
    JOIN apps.mtl_material_transactions mt
    ON we.wip_entity_id = mt.transaction_source_id
    AND we.organization_id = mt.organization_id
    AND mt.transaction_type_id = 44 -- Complete assemblies from WIP to stores
    
WHERE we.organization_id = 1213 
    and transaction_date >= sysdate - 365
group by we.wip_entity_name, trunc(mt.transaction_date), wdj.primary_item_id
) x
group by x.transaction_date, x.primary_item_id