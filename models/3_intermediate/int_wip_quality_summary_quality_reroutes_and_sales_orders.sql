--declare grain: one row per sales order per part number per job per op seq num
SELECT 
int_base.rr_item_id__rr_wip_entity_id__rr_from_op_seq_num_sk,
int_base.rr_item_id__rr_wip_entity_id__rr_from_op_seq_num__op_desc_sk,
int_base.feature,
int_base.rr_item_id,
int_base.rr_wip_entity_id,
int_base.rr_from_op_seq_num,
int_base.wop_fm_description,
int_base.count_serial_number,
join1.mso_segment1,
join1.oel_line_number,
join1.oel_shipment_number
FROM {{ ref('stg_wip_quality_summary_quality_reroutes') }} int_base
left join {{ ref('int_wip_reservations_on_sales_orders') }} join1
on int_base.rr_wip_entity_id = join1.mr_supply_source_header_id