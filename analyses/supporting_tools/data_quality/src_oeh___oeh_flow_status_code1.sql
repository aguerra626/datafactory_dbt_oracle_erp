select 
src_base.oeh_flow_status_code,
count(*) rowcounts
from {{ ref('src_oe_order_headers_all') }} src_base
where 1=1
group by oeh_flow_status_code
order by rowcounts desc