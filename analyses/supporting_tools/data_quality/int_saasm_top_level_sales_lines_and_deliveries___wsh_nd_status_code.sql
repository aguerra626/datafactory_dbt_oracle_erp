select 
src_base.wsh_nd_status_code,
max(src_base.wsh_nd_name) as max_wsh_nd_name,
count(*) rowcounts
from {{ ref('int_saasm_top_level_sales_lines_and_deliveries') }} src_base
where 1=1
group by src_base.wsh_nd_status_code
order by rowcounts desc