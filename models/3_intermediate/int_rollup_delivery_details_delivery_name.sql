select 
int_base.wsh_nd_name,
int_base.wsh_nd_status_code,
int_base.wsh_dd_source_line_id,
max(int_base.wsh_dd_delivery_detail_id) max_wsh_dd_delivery_detail_id,
count(int_base.wsh_dd_delivery_detail_id) rowcounts_wsh_dd_delivery_detail_id
from {{ ref('stg_wsh_dd_da_nd') }} int_base
group by wsh_nd_name,wsh_nd_status_code, wsh_dd_source_line_id
order by rowcounts_wsh_dd_delivery_detail_id desc,wsh_dd_source_line_id desc