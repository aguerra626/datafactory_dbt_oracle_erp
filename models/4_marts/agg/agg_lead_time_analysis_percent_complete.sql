with cte1 as (
select
agg.wmt_primary_item_id,
agg."Fiscal Month",
sum(agg."Qty Completed") as "Total Qty Completed",
sum(agg."Qty Completed Over LT") as "Over LT",
sum(agg."Qty Completed Within LT") as "Within LT"
from {{ ref('lead_times_analysis_final') }} agg
group by
agg.wmt_primary_item_id,
agg."Fiscal Month"
)
select 
cte1.wmt_primary_item_id,
cte1."Fiscal Month", 
cast(cte1."Within LT"/cte1."Total Qty Completed" as NUMBER(4,2))  "Percent Complete Within Lead Time",
cte1."Total Qty Completed",
cte1."Within LT"
from cte1
