-- declare grain: one row per part number per job number per op seq num
with base as (
select 
coalesce(rejects.rr_item_id__rr_wip_entity_id__rr_from_op_seq_num_sk,reroutes.rr_item_id__rr_wip_entity_id__rr_from_op_seq_num_sk) AS "rr_item_id__rr_wip_entity_id__rr_from_op_seq_num_sk",
coalesce(rejects.rr_item_id,reroutes.rr_item_id) AS "rr_item_id",
coalesce(rejects.rr_wip_entity_id,reroutes.rr_wip_entity_id) AS "rr_wip_entity_id",
coalesce(rejects.rr_from_op_seq_num,reroutes.rr_from_op_seq_num) AS "Op Seq Num",
coalesce(rejects.wop_fm_description,reroutes.wop_fm_description) AS "Op Desc",
coalesce(rejects.mso_segment1,reroutes.mso_segment1) AS "Sales Order",
coalesce(rejects.oel_line_number,reroutes.oel_line_number) AS "Line Number",
coalesce(rejects.oel_shipment_number,reroutes.oel_shipment_number) AS "Shipment Number",
nvl(rejects.count_serial_number,0) as "Rejects",
nvl(reroutes.count_serial_number,0) as "Reroutes"
from {{ ref('int_wip_quality_summary_quality_rejects_and_sales_orders') }} rejects
full outer join {{ ref('int_wip_quality_summary_quality_reroutes_and_sales_orders') }} reroutes
on rejects.rr_item_id__rr_wip_entity_id__rr_from_op_seq_num_sk = reroutes.rr_item_id__rr_wip_entity_id__rr_from_op_seq_num_sk
)
select
standard_hash(base."rr_item_id"||base."rr_wip_entity_id"||base."Op Seq Num", 'MD5') as wip_quality_summary_quality_sk,
base.*
from base
