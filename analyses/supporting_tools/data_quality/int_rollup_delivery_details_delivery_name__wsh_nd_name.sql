select 
wsh_nd_name,
count(wsh_dd_delivery_detail_id) wsh_dd_delivery_detail_id_rowcounts,
count(wsh_dd_source_line_id) wsh_dd_source_line_id_rowcounts
from {{ ref('stg_wsh_dd_da_nd') }} int_base
group by wsh_nd_name
order by wsh_dd_delivery_detail_id_rowcounts desc