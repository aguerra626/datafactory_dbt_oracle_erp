select
moqd_inventory_item_id,
sum(moqd_primary_transaction_quantity) sum_moqd_primary_transaction_quantity,
moqd_subinventory_code,
moqd_organization_id
from {{ ref('src_inv_mtl_onhand_quantities_detail') }} int_base

group by 
moqd_inventory_item_id,
moqd_subinventory_code,
moqd_organization_id