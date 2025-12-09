SELECT
    inventory_item_id AS mdh_inventory_item_id,
    organization_id AS mdh_organization_id,
    period_start_date AS mdh_period_start_date,
    period_type AS mdh_period_type,
    last_update_date AS mdh_last_update_date,
    last_updated_by AS mdh_last_updated_by,
    creation_date AS mdh_creation_date,
    created_by AS mdh_created_by,
    last_update_login AS mdh_last_update_login,
    std_wip_usage AS mdh_std_wip_usage,
    closed_flag AS mdh_closed_flag,
    sales_order_demand AS mdh_sales_order_demand,
    miscellaneous_issue AS mdh_miscellaneous_issue,
    interorg_issue AS mdh_interorg_issue,
    request_id AS mdh_request_id,
    program_application_id AS mdh_program_application_id,
    program_id AS mdh_program_id,
    program_update_date AS mdh_program_update_date
FROM
    {{ source('inv', 'mtl_demand_histories') }}
WHERE
    organization_id = 1213
