SELECT
    plan_id AS qp_plan_id,
    NAME AS qp_name,
    description AS qp_description,
    organization_id AS qp_organization_id,
    last_update_date AS qp_last_update_date,
    last_updated_by AS qp_last_updated_by,
    creation_date AS qp_creation_date,
    created_by AS qp_created_by,
    last_update_login AS qp_last_update_login,
    plan_type_code AS qp_plan_type_code,
    import_view_name AS qp_import_view_name,
    instructions AS qp_instructions,
    view_name AS qp_view_name,
    effective_from AS qp_effective_from,
    effective_to AS qp_effective_to
FROM
    {{ source(
        'qa',
        'qa_plans'
    ) }}
WHERE organization_id in (1213,165)
ORDER BY plan_id