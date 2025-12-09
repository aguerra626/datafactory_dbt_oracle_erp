SELECT
    attribute14 AS bref_attribute14,
    original_system_reference AS bref_original_system_reference,
    component_reference_designator AS bref_component_reference_designator,
    last_update_date AS bref_last_update_date,
    last_updated_by AS bref_last_updated_by,
    creation_date AS bref_creation_date,
    created_by AS bref_created_by,
    last_update_login AS bref_last_update_login,
    ref_designator_comment AS bref_ref_designator_comment,
    change_notice AS bref_change_notice,
    acd_type as bref_acd_type,
    component_sequence_id AS bref_component_sequence_id,
    request_id AS bref_request_id,
    program_application_id AS bref_program_application_id,
    program_id AS bref_program_id,
    program_update_date AS bref_program_update_date
FROM
    {{ source(
        'bom',
        'bom_reference_designators'
    ) }}
