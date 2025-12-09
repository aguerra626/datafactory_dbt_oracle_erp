SELECT
    category_id AS mc_category_id,
    structure_id AS mc_structure_id,
    description AS mc_description,
    disable_date AS mc_disable_date,
    segment1 AS mc_segment1,
    segment2 AS mc_segment2,
    summary_flag AS mc_summary_flag,
    enabled_flag AS mc_enabled_flag,
    last_update_date AS mc_last_update_date,
    creation_date AS mc_creation_date
FROM
    {{ source(
        'inv',
        'mtl_categories_b'
    ) }}
