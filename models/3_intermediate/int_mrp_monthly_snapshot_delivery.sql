SELECT
int_base.rec_organization_id,
int_base.rec_inventory_item_id,
int_base.rec_transaction_id,
int_base.rec_compile_designator,
trunc(int_base.rec_new_schedule_date) rec_new_schedule_date,
trunc(int_base.rec_old_schedule_date) rec_old_schedule_date,
trunc(int_base.rec_new_wip_start_date) rec_new_wip_start_date,
int_base.rec_old_wip_start_date,
int_base.rec_disposition_id,
int_base.rec_disposition_status_type,
int_base.rec_order_type,
int_base.rec_schedule_compression_days,
int_base.rec_new_order_quantity,
int_base.rec_old_order_quantity,
int_base.rec_purch_line_num,
int_base.rec_last_update_date,
int_base.fiscal_month
FROM {{ ref('stg_mrp_fiscal_delivery') }} int_base
WHERE
int_base.rec_order_type = 5 AND
int_base.fiscal_month =
(
    select x.fiscal_month FROM {{ ref('int_fiscal_calendar_current_month') }} x
)




