select
stg_base.*,
stg_join.*,
stg_join2.*
from {{ ref('stg_oeh_oel') }} stg_base
join {{ ref('stg_hz_ca_p') }} stg_join
on stg_base.oeh_sold_to_org_id = stg_join.hz_ca_cust_account_id
left join {{ ref('stg_msib_mp') }} stg_join2
on stg_base.oel_inventory_item_id = stg_join2.msib_inventory_item_id