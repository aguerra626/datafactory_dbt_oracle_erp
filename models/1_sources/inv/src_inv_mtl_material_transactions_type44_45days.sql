select 
transaction_quantity as mt44_transaction_quantity,
transaction_date as mt44_transaction_date,
organization_id as mt44_organization_id,
transaction_source_id AS mt44_transaction_source_id,
transaction_id AS mt44_transaction_id,
transaction_type_id as mt44_transaction_type_id
from {{ source('inv', 'mtl_material_transactions') }}
where organization_id = 1213 and transaction_date >= sysdate - 45
and transaction_type_id = 44 -- Complete assemblies from WIP to stores
