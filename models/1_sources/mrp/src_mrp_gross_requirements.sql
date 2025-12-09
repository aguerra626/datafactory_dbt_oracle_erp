SELECT
    demand_id AS mgr_demand_id,
    last_update_date AS mgr_last_update_date,
    last_updated_by AS mgr_last_updated_by,
    creation_date AS mgr_creation_date,
    created_by AS mgr_created_by,
    last_update_login AS mgr_last_update_login,
    inventory_item_id AS mgr_inventory_item_id,
    organization_id AS mgr_organization_id,
    compile_designator AS mgr_compile_designator,
    using_assembly_item_id AS mgr_using_assembly_item_id,
    using_assembly_demand_date AS mgr_using_assembly_demand_date,
    using_requirements_quantity AS mgr_using_requirements_quantity,
    assembly_demand_comp_date AS mgr_assembly_demand_comp_date,
    demand_type AS mgr_demand_type,
    origination_type AS mgr_origination_type,
    disposition_id AS mgr_disposition_id,
    daily_demand_rate AS mgr_daily_demand_rate,
    request_id AS mgr_request_id,
    reserve_quantity AS mgr_reserve_quantity,
    program_id AS mgr_program_id,
    program_update_date AS mgr_program_update_date,
    source_organization_id AS mgr_source_organization_id,
    reservation_id AS mgr_reservation_id,
    updated AS mgr_updated,
    status AS mgr_status,
    applied AS mgr_applied,
    demand_class AS mgr_demand_class,
    firm_quantity AS mgr_firm_quantity,
    firm_date AS mgr_firm_date,
    old_demand_quantity AS mgr_old_demand_quantity,
    demand_schedule_name AS mgr_demand_schedule_name,
    old_demand_date AS mgr_old_demand_date,
    project_id AS mgr_project_id,
    task_id AS mgr_task_id,
    planning_group AS mgr_planning_group,
    end_item_unit_number AS mgr_end_item_unit_number,
    lending_project_id AS mgr_lending_project_id,
    lending_task_id AS mgr_lending_task_id,
    program_application_id AS mgr_program_application_id
FROM
    {{ source(
        'mrp',
        'mrp_gross_requirements'
    ) }}
WHERE
    organization_id = 1213
    AND compile_designator = 'MRP_NSS'
