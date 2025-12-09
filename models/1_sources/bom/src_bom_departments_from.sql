SELECT
    pa_expenditure_org_id AS bd_fm_pa_expenditure_org_id,
    department_id AS bd_fm_department_id,
    department_code AS bd_fm_department_code,
    organization_id AS bd_fm_organization_id,
    last_update_date AS bd_fm_last_update_date,
    last_updated_by AS bd_fm_last_updated_by,
    creation_date AS bd_fm_creation_date,
    created_by AS bd_fm_created_by,
    last_update_login AS bd_fm_last_update_login,
    description AS bd_fm_description,
    department_class_code AS bd_fm_department_class_code
FROM
    {{ source(
        'bom',
        'bom_departments'
    ) }}
WHERE
    organization_id = 1213
