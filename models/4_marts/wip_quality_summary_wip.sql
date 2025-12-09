SELECT
    base.mp_description AS "Planner",
    base.msib_segment1 AS "Part Number",
    base.we_wip_entity_name AS "Job Number",
    base.wop_fm_operation_seq_num AS "Op Seq Num",
    base.wop_fm_description AS "Op Desc",
    base.sales_order AS "Sales Order",
    base.oel_line_number AS "Line Number",
    base.wop_fm_quantity_in_queue AS "Op Qty in Queue",
    base.wop_fm_quantity_waiting_to_move AS "Op To Move",
    base.wdj_scheduled_start_date AS "Job Scheduled Start Date",
    base.wdj_class_code AS "Job Class Code",
    base.wdj_primary_item_id "wdj_primary_item_id",
    base.we_wip_entity_id "we_wip_entity_id"
FROM
    {{ ref('int_wip_quality_summary_wip') }} base
