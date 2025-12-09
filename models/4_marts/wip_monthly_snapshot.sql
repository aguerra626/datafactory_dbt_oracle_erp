SELECT
base.mp_description AS "Planner",
base.msib_segment1 AS "Part Number",
base.wdj_primary_item_id AS "wdj_primary_item_id",
base.msib_description AS "Part Number Desc",
base.wip_job_status AS "WIP Job Status",
base.we_wip_entity_name AS "Job Number",
base.we_wip_entity_id AS "we_wip_entity_id",
base.wop_fm_operation_seq_num AS "From Op Seq Num",
base.wop_fm_description AS "From Op Desc",
base.bd_fm_department_code AS "From Department Code",
base.wdj_scheduled_start_date AS "Job Scheduled Start Date",
base.wdj_scheduled_completion_date AS "Job Scheduled Completion Date",
base.sales_order AS "Sales Order",
base.oel_line_number AS "Line Number",
base.sales_order_type AS "Sales Order Type",
base.wop_fm_scheduled_quantity AS "Fm Op Scheduled Qty",
base.wop_fm_quantity_completed AS "Fm Op Qty Completed",
base.wop_fm_quantity_rejected AS "Fm Op Qty Rejected",
base.wop_fm_quantity_scrapped AS "Fm Op Qty Scrapped",
base.wop_fm_quantity_in_queue AS "Fm Op Qty in Queue",
base.wop_fm_quantity_waiting_to_move AS "Fm Op Qty Waiting to Move",
base.stg_wop_we_wdj_surrogate_key AS "stg_wop_we_wdk_surrogate_key",
base.wdj_class_code AS "wdj_class_code",
( base.wop_fm_scheduled_quantity - base.wop_fm_quantity_completed 
- base.wop_fm_quantity_rejected - base.wop_fm_quantity_scrapped ) AS "Fm Op Qty Open",
sysdate AS "updated_at"

FROM {{ ref('int_horizontal_wip_released_unreleased') }} base
