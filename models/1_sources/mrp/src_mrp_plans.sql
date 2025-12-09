SELECT
    organization_id AS mrp_organization_id,
    compile_designator AS mrp_compile_designator,
    curr_schedule_designator AS mrp_curr_schedule_designator,
    curr_operation_schedule_type AS mrp_curr_operation_schedule_type,
    curr_plan_type AS mrp_curr_plan_type,
    curr_overwrite_option AS mrp_curr_overwrite_option,
    curr_append_planned_orders AS mrp_curr_append_planned_orders,
    curr_schedule_type AS mrp_curr_schedule_type,
    curr_cutoff_date AS mrp_curr_cutoff_date,
    curr_part_include_type AS mrp_curr_part_include_type,
    curr_planning_time_fence_flag AS mrp_curr_planning_time_fence_flag,
    curr_demand_time_fence_flag AS mrp_curr_demand_time_fence_flag,
    curr_consider_reservations AS mrp_curr_consider_reservations,
    curr_plan_safety_stock AS mrp_curr_plan_safety_stock,
    curr_consider_wip AS mrp_curr_consider_wip,
    curr_consider_po AS mrp_curr_consider_po,
    curr_snapshot_lock AS mrp_curr_snapshot_lock,
    compile_definition_date AS mrp_compile_definition_date,
    schedule_designator AS mrp_schedule_designator,
    operation_schedule_type AS mrp_operation_schedule_type,
    plan_type AS mrp_plan_type,
    overwrite_option AS mrp_overwrite_option,
    append_planned_orders AS mrp_append_planned_orders,
    schedule_type AS mrp_schedule_type,
    cutoff_date AS mrp_cutoff_date,
    part_include_type AS mrp_part_include_type,
    planning_time_fence_flag AS mrp_planning_time_fence_flag,
    demand_time_fence_flag AS mrp_demand_time_fence_flag,
    consider_reservations AS mrp_consider_reservations,
    plan_safety_stock AS mrp_plan_safety_stock,
    consider_wip AS mrp_consider_wip,
    consider_po AS mrp_consider_po,
    snapshot_lock AS mrp_snapshot_lock,
    explosion_start_date AS mrp_explosion_start_date,
    explosion_completion_date AS mrp_explosion_completion_date,
    data_start_date AS mrp_data_start_date,
    data_completion_date AS mrp_data_completion_date,
    program_application_id AS mrp_program_application_id
FROM
    {{ source(
        'mrp',
        'mrp_plans'
    ) }}
WHERE
    organization_id = 1213
    AND compile_designator = 'MRP_NSS'
