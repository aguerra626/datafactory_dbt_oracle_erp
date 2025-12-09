SELECT
    last_updated_by AS lu_br_last_updated_by,
    creation_date AS lu_br_creation_date,
    created_by AS lu_br_created_by,
    last_update_login AS lu_br_last_update_login,
    description AS lu_br_description,
    cost_element_id AS lu_br_cost_element_id,
    purchase_item_id AS lu_br_purchase_item_id,
    cost_code_type AS lu_br_cost_code_type,
    functional_currency_flag AS lu_br_functional_currency_flag,
    unit_of_measure AS lu_br_unit_of_measure,
    resource_type AS lu_br_resource_type,
    autocharge_type AS lu_br_autocharge_type,
    standard_rate_flag AS lu_br_standard_rate_flag,
    default_basis_type AS lu_br_default_basis_type,
    absorption_account AS lu_br_absorption_account,
    allow_costs_flag AS lu_br_allow_costs_flag,
    rate_variance_account AS lu_br_rate_variance_account,
    expenditure_type AS lu_br_expenditure_type,
    batchable AS lu_br_batchable,
    resource_id AS lu_br_resource_id,
    resource_code AS lu_br_resource_code,
    organization_id AS lu_br_organization_id,
    last_update_date AS lu_br_last_update_date
FROM
    {{ source(
        'bom',
        'bom_resources'
    ) }}
WHERE
    organization_id = 1213