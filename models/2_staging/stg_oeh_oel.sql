select
src_oeh.*,
src_oel.*,
standard_hash(src_oeh.oeh_header_id||src_oel.oel_line_id, 'MD5') as stg_oeh_oel_sk,
standard_hash(src_oeh.oeh_order_number||'.' ||src_oel.oel_line_number, 'MD5') as stg_oeh_oel_sk2
from {{ ref('src_oe_order_headers_all') }} src_oeh
join {{ ref('src_oe_order_lines_all') }} src_oel
on src_oeh.oeh_header_id = src_oel.oel_header_id