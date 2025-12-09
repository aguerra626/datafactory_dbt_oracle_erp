select
src_mil.*,
src_mt_custowned_alltime.*
from {{ ref('src_inv_mtl_item_locations') }} src_mil
join {{ ref('src_inv_mtl_material_transactions_custowned_alltime') }} src_mt_custowned_alltime
on src_mil.mil_inventory_location_id = src_mt_custowned_alltime.custowned_locator_id