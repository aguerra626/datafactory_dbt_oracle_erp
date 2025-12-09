SELECT
    subinventory_code AS mil_subinventory_code,
    inventory_item_id AS mil_inventory_item_id,
    availability_type AS mil_availability_type,
    inventory_atp_code AS mil_inventory_atp_code,
    reservable_type AS mil_reservable_type,
    inventory_location_id AS mil_inventory_location_id,
    organization_id AS mil_organization_id,
    last_update_date AS mil_last_update_date,
    last_updated_by AS mil_last_updated_by,
    creation_date AS mil_creation_date,
    created_by AS mil_created_by,
    last_update_login AS mil_last_update_login,
    inventory_location_type AS mil_inventory_location_type,
    segment1 AS mil_segment1,
    segment19 AS mil_segment19,
    segment20 AS mil_segment20,
    summary_flag AS mil_summary_flag,
    enabled_flag AS mil_enabled_flag,
    project_id AS mil_project_id,
    task_id AS mil_task_id,
    physical_location_id AS mil_physical_location_id,
    status_id AS mil_status_id,
    location_current_units AS mil_location_current_units,
    empty_flag AS mil_empty_flag,
    mixed_items_flag AS mil_mixed_items_flag
FROM
    {{ source('inv', 'mtl_item_locations') }}
WHERE
    organization_id = 1213
