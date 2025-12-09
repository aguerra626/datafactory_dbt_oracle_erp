-- one row per part number per day
select
j1."Part Number",
base.mt44_transaction_date,
base.mt44_transaction_quantity
from {{ ref('int_wip_assembly_completions') }} base
join {{ ref('dim_item_master') }} j1
on base.wdj_primary_item_id = j1.msib_inventory_item_id
and base.we_organization_id = j1.msib_organization_id