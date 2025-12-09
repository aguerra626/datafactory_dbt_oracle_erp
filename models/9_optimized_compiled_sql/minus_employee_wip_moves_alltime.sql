select 
cast(FROM_TZ(CAST(wmt.transaction_date AS TIMESTAMP),'America/New_York') 
        AT TIME ZONE 'America/Chicago' as date )
            AS "Transaction Date CST",
cast(to_char(cast(FROM_TZ(CAST(wmt.transaction_date AS TIMESTAMP),'America/New_York') 
        AT TIME ZONE 'America/Chicago' as date), 'DD-MON-YY HH12:MI:SS AM') as timestamp) 
            AS "Transaction Datetime CST", 
mp.description AS "Planner",
msib.segment1 AS "Part Number",
msib.description AS "Part Description",
REPLACE(fu.user_name, '.', ' ') AS "Transacted By",
wmt.transaction_quantity AS "Transaction Qty",
to_char(wmt.fm_operation_seq_num) AS "Fm Op Seq Num",
fmwop.description AS "Fm Op Desc",
fmbd.department_code AS "Fm Department",
to_char(wmt.to_operation_seq_num) AS "To Op Seq Num",
towop.description AS "To Op Desc",
tobd.department_code AS "To Department",
we.wip_entity_name AS "Job Number"

from apps.wip_entities we 
join apps.wip_discrete_jobs wdj 
on we.wip_entity_id = wdj.wip_entity_id
and we.organization_id = wdj.organization_id
join apps.wip_move_transactions wmt 
on we.wip_entity_id = wmt.wip_entity_id
and we.organization_id = wmt.organization_id
join apps.wip_operations fmwop
on wmt.wip_entity_id = fmwop.wip_entity_id
and wmt.fm_operation_seq_num = fmwop.operation_seq_num
and wmt.organization_id = fmwop.organization_id
join apps.bom_departments fmbd
on wmt.fm_department_id = fmbd.department_id
join apps.wip_operations towop
on wmt.wip_entity_id = towop.wip_entity_id
and wmt.to_operation_seq_num = towop.operation_seq_num
and wmt.organization_id = towop.organization_id
join apps.bom_departments tobd
on wmt.to_department_id = tobd.department_id
join apps.mtl_system_items_b msib
on wmt.primary_item_id = msib.inventory_item_id
and wmt.organization_id = msib.organization_id
join apps.mtl_planners mp
on msib.planner_code = mp.planner_code
and msib.organization_id = mp.organization_id
join apps.fnd_user fu
on wmt.created_by = fu.user_id
where we.organization_id = 1213