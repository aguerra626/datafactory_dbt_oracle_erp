select
stg_base.*,
join1.*
from {{ ref('stg_we_wdj') }} stg_base
join {{ ref('stg_wpb') }} join1 
on stg_base.we_wip_entity_id = join1.wpb_wip_entity_id 
