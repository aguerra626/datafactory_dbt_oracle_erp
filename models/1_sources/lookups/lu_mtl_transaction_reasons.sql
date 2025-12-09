SELECT
    reason_id AS lu_mtl_tr_reason_id,
    reason_name AS lu_mtl_tr_reason_name,
    description AS lu_mtl_tr_description,
    last_update_date AS lu_mtl_tr_last_update_date,
    last_updated_by AS lu_mtl_tr_last_updated_by,
    creation_date AS lu_mtl_tr_creation_date,
    created_by AS lu_mtl_tr_created_by,
    last_update_login AS lu_mtl_tr_last_update_login
FROM
    apps.mtl_transaction_reasons
ORDER BY
    lu_mtl_tr_reason_id ASC