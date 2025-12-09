SELECT
    update_seq_num AS msou_update_seq_num,
    last_update_date AS msou_last_update_date,
    last_updated_by AS msou_last_updated_by,
    creation_date AS msou_creation_date,
    created_by AS msou_created_by,
    last_update_login AS msou_last_update_login,
    inventory_item_id AS msou_inventory_item_id,
    sales_order_id AS msou_sales_order_id,
    organization_id AS msou_organization_id,
    new_schedule_date AS msou_new_schedule_date,
    old_schedule_date AS msou_old_schedule_date,
    new_schedule_quantity AS msou_new_schedule_quantity,
    old_schedule_quantity AS msou_old_schedule_quantity,
    current_customer_id AS msou_current_customer_id,
    previous_customer_id AS msou_previous_customer_id,
    current_ship_id AS msou_current_ship_id,
    previous_ship_id AS msou_previous_ship_id,
    current_bill_id AS msou_current_bill_id,
    previous_bill_id AS msou_previous_bill_id,
    current_demand_class AS msou_current_demand_class,
    previous_demand_class AS msou_previous_demand_class,
    current_territory_id AS msou_current_territory_id,
    previous_territory_id AS msou_previous_territory_id,
    line_num AS msou_line_num,
    request_id AS msou_request_id,
    process_status AS msou_process_status,
    current_available_to_mrp AS msou_current_available_to_mrp,
    previous_available_to_mrp AS msou_previous_available_to_mrp,
    completed_quantity AS msou_completed_quantity
FROM
    {{ source('mrp', 'mrp_sales_order_updates') }}
WHERE
    organization_id = 1213
