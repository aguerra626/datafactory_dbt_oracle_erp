-- Fact Table column ordering: Fact Table SK -> Dim Table SK -> Fact Values
select
moqd_inventory_item_id,
moqd_subinventory_code,
moqd_organization_id,
sum_moqd_primary_transaction_quantity AS "OHQ Per Part Number in Subinventory"
from {{ ref('int_on_hand_qty_per_part_number_per_subinventory') }} base
