select
"Job Number",
wmt_primary_item_id,
"Job Start Date",
"Job Start Day",
"Completion Date",
"Completion Day",
fullweek_actual_lead_time,
"Qty Completed",
"system_lead_time",
count(*) - 1 workingdays_actual_lead_time_exclusive,
count(*) workingdays_actual_lead_time_inclusive,
base.wip_assembly_completions_sk
from {{ ref('lead_times_analysis_full7day_week') }} base
join {{ ref('int_fiscal_calendar_365days') }} join1
on join1.bcal_calendar_date BETWEEN base."Job Start Date" AND base."Completion Date"
where join1.bcal_seq_num is not null -- rm nonworking days and holidays
group by 
"Job Number",
wmt_primary_item_id,
"Job Start Date",
"Job Start Day",
"Completion Date",
"Completion Day",
fullweek_actual_lead_time,
"system_lead_time",
"Qty Completed",
base.wip_assembly_completions_sk
