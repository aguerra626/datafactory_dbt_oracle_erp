with cte1 as (
    select
    base.wmt_primary_item_id,
    --median(base.workingdays_actual_lead_time_inclusive) as median_lead_time,
    (base."Qty Completed" * base.workingdays_actual_lead_time_inclusive) qty_multiply_actual_lt_numerator, 
    sum(base."Qty Completed") over (partition by base.wmt_primary_item_id, base."Fiscal Month") sum_qty_per_item_month_denominator,
    base."Qty Completed",
    base.workingdays_actual_lead_time_inclusive,
    base."Fiscal Month"
    from {{ ref('lead_times_analysis_final') }} base
    order by
    base.wmt_primary_item_id,
    base."Fiscal Month"
)

select 
cte1.wmt_primary_item_id,
sum(qty_multiply_actual_lt_numerator),
min(sum_qty_per_item_month_denominator), -- every value is the same in the partition. Use min() to grab only 1 value
round(sum(qty_multiply_actual_lt_numerator)/min(sum_qty_per_item_month_denominator),2) as weight_avg_lead_time,
cte1."Fiscal Month"
from cte1
group by 
cte1.wmt_primary_item_id,
cte1."Fiscal Month"
order by
cte1.wmt_primary_item_id,
cte1."Fiscal Month"