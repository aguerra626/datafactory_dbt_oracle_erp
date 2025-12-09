SELECT
    pa_expenditure_org_id AS bd_pa_expenditure_org_id,
    department_id AS bd_department_id,
    department_code AS bd_department_code,
    organization_id AS bd_organization_id,
    last_update_date AS bd_last_update_date,
    last_updated_by AS bd_last_updated_by,
    creation_date AS bd_creation_date,
    created_by AS bd_created_by,
    last_update_login AS bd_last_update_login,
    description AS bd_description,
    department_class_code AS bd_department_class_code
FROM
    {{ source(
        'bom',
        'bom_departments'
    ) }}
WHERE
    organization_id = 1213
