select
wsh_nd_name,
count(wsh_dd_delivery_detail_id) over (partition by wsh_nd_name) wsh_dd_delivery_detail_id_rowcounts,
count(wsh_dd_source_line_id) over (partition by wsh_nd_name) wsh_dd_source_line_id_rowcounts
from {{ ref('stg_wsh_dd_da_nd') }} int_base
order by wsh_dd_delivery_detail_id_rowcounts desc