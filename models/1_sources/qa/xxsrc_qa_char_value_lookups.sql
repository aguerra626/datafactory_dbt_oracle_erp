SELECT
    char_id AS qlu1_char_id,
    short_code AS qlu1_short_code,
    attribute14 AS qlu1_attribute14,
    last_update_date AS qlu1_last_update_date,
    last_updated_by AS qlu1_last_updated_by,
    creation_date AS qlu1_creation_date,
    created_by AS qlu1_created_by,
    last_update_login AS qlu1_last_update_login,
    description AS qlu1_description,
    zd_edition_name AS qlu1_zd_edition_name
FROM
    {{ source(
        'qa',
        'qa_plan_char_value_lookups'
    ) }}
