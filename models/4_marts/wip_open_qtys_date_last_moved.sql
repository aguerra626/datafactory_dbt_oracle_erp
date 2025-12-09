select 
base.mp_description AS "Planner",
base.msib_segment1 AS "Part Number",
base.wdj_scheduled_start_date AS "Job Scheduled Start Date",
base.wdj_scheduled_completion_date AS "Job Scheduled Completion Date",
base.msib_description AS "Part Number Desc",
base.wip_job_status AS "WIP Job Status",
base.we_wip_entity_name AS "Job Number",
base.wop_fm_quantity_in_queue AS "Fm Op Qty in Queue",
base.wop_fm_quantity_waiting_to_move AS "Fm Op To Move Qty",
base.wop_fm_scheduled_quantity AS "Fm Op Scheduled Qty",
base.wop_fm_quantity_completed AS "Fm Op Qty Completed",
base.wdj_class_code AS "wdj_class_code",
base.wop_fm_operation_seq_num || '- ' || base.wop_fm_description AS "Fm Op Step",
base.wop_fm_operation_seq_num AS "From Op Seq Num",
base.wop_fm_description AS "From Op Desc",
base.sales_order AS "Sales Order",
base.oel_line_number AS "Line Number",
base.wop_fm_date_last_moved AS "Last Touch Date",

from
{{ ref('int_horizontal_wip') }} base
where base.op_qty_open > 0