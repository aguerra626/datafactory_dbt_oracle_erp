SELECT
    plan_id AS qlu2_plan_id,
    char_id AS qlu2_char_id,
    short_code AS qlu2_short_code,
    last_update_date AS qlu2_last_update_date,
    last_updated_by AS qlu2_last_updated_by,
    creation_date AS qlu2_creation_date,
    created_by AS qlu2_created_by,
    last_update_login AS qlu2_last_update_login,
    description AS qlu2_description,
    short_code_id AS qlu2_short_code_id,
    zd_edition_name AS qlu2_zd_edition_name
FROM
    {{ source(
        'qa',
        'qa_plan_char_value_lookups'
    ) }}
