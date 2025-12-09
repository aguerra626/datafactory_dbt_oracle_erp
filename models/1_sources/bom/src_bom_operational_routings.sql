SELECT
    routing_sequence_id AS bor_routing_sequence_id,
    assembly_item_id AS bor_assembly_item_id,
    organization_id AS bor_organization_id,
    last_update_date AS bor_last_update_date,
    last_updated_by AS bor_last_updated_by,
    creation_date AS bor_creation_date,
    created_by AS bor_created_by,
    last_update_login AS bor_last_update_login,
    routing_type AS bor_routing_type,
    common_routing_sequence_id AS bor_common_routing_sequence_id,
    completion_subinventory AS bor_completion_subinventory,
    completion_locator_id AS bor_completion_locator_id,
    request_id AS bor_request_id,
    program_application_id AS bor_program_application_id,
    program_id AS bor_program_id,
    program_update_date AS bor_program_update_date,
    cfm_routing_flag AS bor_cfm_routing_flag,
    mixed_model_map_flag AS bor_mixed_model_map_flag,
    ctp_flag AS bor_ctp_flag,
    original_system_reference AS bor_original_system_reference
FROM
    apps.bom_operational_routings
WHERE
    organization_id = 1213