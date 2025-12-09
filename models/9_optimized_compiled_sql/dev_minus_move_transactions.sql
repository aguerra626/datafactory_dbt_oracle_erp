select
trunc(wmt.transaction_date) transaction_date,
we.wip_entity_name,
wmt.fm_operation_seq_num,
wmt.to_operation_seq_num,
sum(wmt.transaction_quantity),
wdj.start_quantity,
wdj.quantity_completed,
case when wdj.start_quantity - wdj.quantity_completed = 0 then 'Y' else 'N' end is_wip_complete
from 
apps.wip_entities we
join apps.wip_discrete_jobs wdj
on we.wip_entity_id = wdj.wip_entity_id
and we.organization_id = wdj.organization_id
and wdj.status_type = 3 -- Released
and wdj.class_code = 'Production'
join apps.wip_move_transactions wmt
on we.wip_entity_id = wmt.wip_entity_id
where we.organization_id = 1213
--AND transaction_date >= SYSDATE - 14
and wip_entity_name like '5662132'
group by 
we.wip_entity_name,
wmt.fm_operation_seq_num,
wmt.to_operation_seq_num,
trunc(wmt.transaction_date),
wdj.start_quantity,
wdj.quantity_completed

order by wip_entity_name