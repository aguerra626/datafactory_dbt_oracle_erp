--declare grain: One row per job per day
select
base.we_wip_entity_name "Job Number",
join1.wmt_primary_item_id wmt_primary_item_id,
join1.wmt_min_transaction_date "Job Start Date",
TO_CHAR(join1.wmt_min_transaction_date,'Day') "Job Start Day",
base.mt44_transaction_date "Completion Date",
TO_CHAR(base.mt44_transaction_date,'Day') "Completion Day",
base.mt44_transaction_date - join1.wmt_min_transaction_date fullweek_actual_lead_time,
join2.msib_full_lead_time "system_lead_time",
base.mt44_transaction_quantity "Qty Completed",
base.wip_assembly_completions_sk
from {{ ref('int_wip_assembly_completions') }} base
join {{ ref('int_move_trxns_wip_job_start') }} join1
on base.we_wip_entity_id = join1.we_wip_entity_id
join {{ ref('src_inv_mtl_system_items_b') }} join2  
on join1.wmt_primary_item_id = join2.msib_inventory_item_id