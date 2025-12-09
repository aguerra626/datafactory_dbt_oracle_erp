SELECT
    transaction_source_type_id tst_transaction_source_type_id,
    transaction_source_type_name tst_transaction_source_type_name,
    description tst_description,
    last_update_date tst_last_update_date,
    last_updated_by tst_last_updated_by,
    creation_date tst_creation_date,
    created_by tst_created_by,
    disable_date tst_disable_date,
    user_defined_flag tst_user_defined_flag,
    validated_flag tst_validated_flag
FROM
    inv.mtl_txn_source_types
order by transaction_source_type_id asc
