SELECT
    TYPE AS wsh_da_type,
    delivery_assignment_id AS wsh_da_delivery_assignment_id,
    delivery_id AS wsh_da_delivery_id,
    delivery_detail_id AS wsh_da_delivery_detail_id,
    creation_date AS wsh_da_creation_date,
    created_by AS wsh_da_created_by,
    last_update_date AS wsh_da_last_update_date,
    last_updated_by AS wsh_da_last_updated_by,
    last_update_login AS wsh_da_last_update_login
FROM
    {{ source('wsh', 'wsh_delivery_assignments') }}
