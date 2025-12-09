-- Grain Declaration: One row per job per part number per day
select
"Job Number",
wmt_primary_item_id,
"Job Start Date",
"Completion Date",
fullweek_actual_lead_time,
"Qty Completed",
"system_lead_time",
workingdays_actual_lead_time_inclusive,
case when workingdays_actual_lead_time_inclusive>"system_lead_time" then 'Over Lead Time' else 'Within Lead Time' end as "Within Lead Time Flag",
case when workingdays_actual_lead_time_inclusive>"system_lead_time" then "Qty Completed" else 0 end AS "Qty Completed Over LT",
case when workingdays_actual_lead_time_inclusive<="system_lead_time" then "Qty Completed" else 0 end AS "Qty Completed Within LT",
join1."Fiscal Month",
join1.fiscal_date_placeholder,
base.wip_assembly_completions_sk

from {{ ref('lead_times_analysis_workingdays_week') }} base
join {{ ref('dim_fiscal_and_calendar_dates') }} join1
on join1."Calendar Date" = base."Completion Date"