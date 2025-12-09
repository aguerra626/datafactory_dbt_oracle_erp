SELECT
    pa_expenditure_org_id AS bd_to_pa_expenditure_org_id,
    department_id AS bd_to_department_id,
    department_code AS bd_to_department_code,
    organization_id AS bd_to_organization_id,
    last_update_date AS bd_to_last_update_date,
    last_updated_by AS bd_to_last_updated_by,
    creation_date AS bd_to_creation_date,
    created_by AS bd_to_created_by,
    last_update_login AS bd_to_last_update_login,
    description AS bd_to_description,
    department_class_code AS bd_to_department_class_code
FROM
    {{ source(
        'bom',
        'bom_departments'
    ) }}
WHERE
    organization_id = 1213
