WITH cte_mrp_monthly_build_delivery_current_month AS (
SELECT
rec.organization_id,
rec.inventory_item_id,
rec.transaction_id,
rec.compile_designator,
trunc(rec.new_schedule_date) new_schedule_date,
trunc(rec.old_schedule_date) old_schedule_date,
trunc(rec.new_wip_start_date) new_wip_start_date,
rec.old_wip_start_date,
rec.disposition_id,
rec.disposition_status_type,
rec.order_type,
rec.schedule_compression_days,
rec.new_order_quantity,
rec.old_order_quantity,
rec.purch_line_num,
rec.last_update_date,
fiscal_current_month.*
FROM APPS.MRP_RECOMMENDATIONS rec
JOIN (
    select
    fiscal.entered_period_name AS fiscal_month,
    bcal.calendar_date AS fiscal_date
    from
    apps.bom_calendar_dates bcal
    join apps.gl_periods fiscal
    on bcal.calendar_date BETWEEN fiscal.start_date AND fiscal.end_date
    where
    bcal.calendar_code = 'NSS' and fiscal.period_set_name = 'BAE_FW'
    and fiscal.entered_period_name = (select distinct x.entered_period_name from apps.gl_periods x where sysdate between x.start_date and x.end_date and x.period_set_name = 'BAE_FW')
) fiscal_current_month
ON TRUNC(rec.new_wip_start_date) = TRUNC(fiscal_current_month.fiscal_date)
WHERE rec.organization_id = 1213 and rec.order_type = 5 and rec.compile_designator = 'MRP_NSS'
)
-- SELECT sysdate as updated_at, base.* (sum planned build group by UNION ALL sum planned delivery group by) base
select 
'planned build' as feature,
cte_mrp_monthly_build_delivery_current_month.new_wip_start_date as new_start_date,
cte_mrp_monthly_build_delivery_current_month.inventory_item_id as rec_inventory_item_id,
cte_mrp_monthly_build_delivery_current_month as 