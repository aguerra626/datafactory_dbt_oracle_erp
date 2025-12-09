select 
src_base.mr_demand_source_type_id,
src_base.mr_supply_source_type_id,
count(*) rowcounts
from {{ ref('src_inv_mtl_reservations') }} src_base
where 1=1
group by 
src_base.mr_demand_source_type_id,
src_base.mr_supply_source_type_id
order by rowcounts desc