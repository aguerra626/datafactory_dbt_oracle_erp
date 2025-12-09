SELECT
    inventory_item_id AS mrp_inventory_item_id,
    organization_id AS mrp_organization_id,
    compile_designator AS mrp_compile_designator,
    wip_entity_id AS mrp_wip_entity_id,
    last_update_date AS mrp_last_update_date,
    last_updated_by AS mrp_last_updated_by,
    creation_date AS mrp_creation_date,
    created_by AS mrp_created_by,
    last_update_login AS mrp_last_update_login,
    wip_entity_name AS mrp_wip_entity_name,
    job_quantity AS mrp_job_quantity,
    quantity_completed AS mrp_quantity_completed,
    quantity_scrapped AS mrp_quantity_scrapped,
    expected_scrap_quantity AS mrp_expected_scrap_quantity,
    schedule_completion_date AS mrp_schedule_completion_date,
    firm_planned_status_type AS mrp_firm_planned_status_type,
    start_date AS mrp_start_date,
    status_code AS mrp_status_code,
    revision AS mrp_revision,
    request_id AS mrp_request_id,
    program_id AS mrp_program_id,
    program_update_date AS mrp_program_update_date,
    wip_job_type AS mrp_wip_job_type,
    demand_class AS mrp_demand_class,
    project_id AS mrp_project_id,
    task_id AS mrp_task_id,
    planning_group AS mrp_planning_group,
    schedule_group_id AS mrp_schedule_group_id,
    build_sequence AS mrp_build_sequence,
    line_id AS mrp_line_id,
    alternate_routing_designator AS mrp_alternate_routing_designator,
    alternate_bom_designator AS mrp_alternate_bom_designator,
    entity_type AS mrp_entity_type,
    end_item_unit_number AS mrp_end_item_unit_number,
    program_application_id AS mrp_program_application_id
FROM
    {{ source(
        'mrp',
        'mrp_item_wip_entities'
    ) }}
WHERE
    organization_id = 1213
    AND compile_designator = 'MRP_NSS'
