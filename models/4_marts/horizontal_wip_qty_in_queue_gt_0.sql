select 
base.mp_description AS "Planner",
base.msib_segment1 AS "Part Number",
base.wdj_scheduled_start_date AS "Job Scheduled Start Date",
base.wdj_scheduled_completion_date AS "Job Scheduled Completion Date",
base.we_wip_entity_name AS "Job Number",
base.msib_description AS "Part Number Desc",
base.wop_fm_quantity_in_queue AS "Fm Op Qty in Queue",
base.wdj_class_code AS "wdj_class_code",
base.wop_fm_operation_seq_num AS "From Op Seq Num",
base.wop_fm_description AS "From Op Desc",
base.meaning_wdj_status_type AS "Job Status"
from {{ ref('int_horizontal_wip') }} base
where base.wop_fm_quantity_in_queue > 0