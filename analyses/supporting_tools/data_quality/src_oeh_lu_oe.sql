select 
oeh_order_type_id,
lu_oe_transaction_type_id,
lu_oe_name,
count(*) rowcounts
from {{ ref('src_oe_order_headers_all') }} src_oeh
join {{ ref('lu_oe_transaction_types_tl') }} lu_oe
on src_oeh.oeh_order_type_id = lu_oe.lu_oe_transaction_type_id
where 1=1
group by oeh_order_type_id, lu_oe_transaction_type_id,lu_oe_name
order by rowcounts desc