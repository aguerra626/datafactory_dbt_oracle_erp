select
    transaction_type_id as lu_oe_transaction_type_id,
    language as lu_oe_language,
    source_lang as lu_oe_source_lang,
    name as lu_oe_name,
    description as lu_oe_description,
    creation_date as lu_oe_creation_date,
    created_by as lu_oe_created_by,
    last_update_date as lu_oe_last_update_date,
    last_updated_by as lu_oe_last_updated_by,
    last_update_login as lu_oe_last_update_login
from
    apps.oe_transaction_types_tl
