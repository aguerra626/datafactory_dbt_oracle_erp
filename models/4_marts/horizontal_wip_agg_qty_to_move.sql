select 
base.mp_description AS "Planner",
base.msib_segment1 AS "Part Number",
base.wdj_scheduled_start_date AS "Job Scheduled Start Date",
base.wdj_scheduled_completion_date AS "Job Scheduled Completion Date",
base.we_wip_entity_name AS "Job Number",
base.msib_description AS "Part Number Desc",
sum(base.wop_fm_quantity_waiting_to_move) AS "Fm Op To Move Qty",
base.wdj_class_code AS "wdj_class_code",
base.wop_fm_operation_seq_num || '- ' || base.wop_fm_description AS "Fm Op Step",
base.wop_fm_operation_seq_num AS "From Op Seq Num",
base.wop_fm_description AS "From Op Desc"
from {{ ref('int_horizontal_wip') }} base
group by base.mp_description, base.msib_segment1, base.msib_description,
base.wdj_class_code,base.wop_fm_operation_seq_num,base.wop_fm_description,base.we_wip_entity_name
, base.wdj_scheduled_start_date,base.wdj_scheduled_completion_date
having sum(base.wop_fm_quantity_waiting_to_move)>0