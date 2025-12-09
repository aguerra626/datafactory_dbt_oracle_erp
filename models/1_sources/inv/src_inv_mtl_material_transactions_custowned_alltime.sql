select 
transaction_quantity as custowned_transaction_quantity,
transaction_date as custowned_transaction_date,
organization_id as custowned_organization_id,
transaction_source_id AS custowned_transaction_source_id,
transaction_id AS custowned_transaction_id,
transaction_type_id as custowned_transaction_type_id,
locator_id AS custowned_locator_id,
subinventory_code as custowned_subinventory_code,
inventory_item_id as custowned_inventory_item_id,
transaction_reference as custowned_transaction_reference,
reason_id AS custowned_reason_id,
lu.lu_mtl_tt_transaction_type_name,
lu.lu_mtl_tt_description,
lu_mtl_tr_reason_id,
lu_mtl_tr_reason_name,
lu_mtl_tr_description
from {{ source('inv', 'mtl_material_transactions') }} 
left join {{ ref('lu_mtl_transaction_types') }} lu
on transaction_type_id = lu.lu_mtl_tt_transaction_type_id
left join {{ ref('lu_mtl_transaction_reasons') }}
on reason_id = lu_mtl_tr_reason_id
where organization_id = 1213 and subinventory_code like 'CUSTOWNED'