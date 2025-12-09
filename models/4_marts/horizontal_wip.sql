select 
-- dim_item_master
base.mp_description AS "Planner",
base.msib_segment1 AS "Part Number",
base.msib_description AS "Part Number Desc",
-- dim_wip_jobs
base.we_wip_entity_name AS "Job Number",
base.wip_job_status AS "WIP Job Status",
base.wdj_scheduled_start_date AS "Job Scheduled Start Date",
base.wdj_scheduled_completion_date AS "Job Scheduled Completion Date",
base.wdj_class_code AS "wdj_class_code",
-- fct_wip_jobs_operations
base.wop_fm_quantity_in_queue AS "Fm Op Qty in Queue",
base.wop_fm_quantity_waiting_to_move AS "Fm Op To Move Qty",
base.wop_fm_scheduled_quantity AS "Fm Op Scheduled Qty",
base.wop_fm_quantity_completed AS "Fm Op Qty Completed",
-- dim_wip_jobs_operations
base.wop_fm_operation_seq_num AS "From Op Seq Num",
-- dim_wip_jobs_operations_descriptions (source table would be BOM.BOM_OPERATION_SEQUENCES)
base.wop_fm_operation_seq_num || '- ' || base.wop_fm_description AS "Fm Op Step",
base.wop_fm_description AS "From Op Desc",
-- dim_sales_order_lines
base.sales_order AS "Sales Order",
base.oel_line_number AS "SO Line Number",
base.sales_order_type AS "Sales Order Type"
from {{ ref('int_horizontal_wip') }} base