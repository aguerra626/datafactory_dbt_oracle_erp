SELECT
    plan_id AS qpc_plan_id,
    char_id AS qpc_char_id,
    last_update_date AS qpc_last_update_date,
    last_updated_by AS qpc_last_updated_by,
    result_column_name AS qpc_result_column_name,
    prompt_sequence AS qpc_prompt_sequence,
    prompt AS qpc_prompt,
    creation_date AS qpc_creation_date,
    created_by AS qpc_created_by,
    last_update_login AS qpc_last_update_login,
    enabled_flag AS qpc_enabled_flag,
    mandatory_flag AS qpc_mandatory_flag,
    default_value AS qpc_default_value,
    default_value_id AS qpc_default_value_id,
    values_exist_flag AS qpc_values_exist_flag,
    displayed_flag AS qpc_displayed_flag,
    attribute_category AS qpc_attribute_category,
    decimal_precision AS qpc_decimal_precision,
    read_only_flag AS qpc_read_only_flag,
    ss_poplist_flag AS qpc_ss_poplist_flag,
    information_flag AS qpc_information_flag,
    device_flag AS qpc_device_flag,
    override_flag AS qpc_override_flag,
    zd_edition_name AS qpc_zd_edition_name
FROM
    {{ source(
        'qa',
        'qa_plan_chars'
    ) }}
WHERE
    plan_id IN (
        5166,
        5175, 
        5178,
        5179,
        5191,
        143
    )
{# defect details, nonsn results recording, receiving inspection, results recording, stamp control, CODE_LOOKUP_PROCESS #}
ORDER BY plan_id ASC, qpc_result_column_name ASC
