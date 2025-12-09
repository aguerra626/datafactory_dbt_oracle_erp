SELECT
int_base.mp_description,
int_base.msib_segment1,
int_base.wdj_primary_item_id,
int_base.msib_description,
lu1.meaning wip_job_status,
int_base.we_wip_entity_name,
int_base.we_wip_entity_id,
int_base.wop_fm_operation_seq_num,
int_base.wop_fm_description,
int_base.bd_fm_department_code,
int_base.wdj_scheduled_start_date,
int_base.wdj_scheduled_completion_date,
int_base.mso_segment1 sales_order,
int_base.oel_line_number,
int_base.mso_segment2 sales_order_type,
int_base.wop_fm_scheduled_quantity,
int_base.wop_fm_quantity_completed,
int_base.wop_fm_quantity_rejected,
int_base.wop_fm_quantity_scrapped,
int_base.wop_fm_quantity_in_queue,
int_base.wop_fm_quantity_waiting_to_move,
int_base.stg_wop_we_wdj_surrogate_key,
int_base.wdj_class_code,
int_base.wop_fm_date_last_moved,
( int_base.wop_fm_scheduled_quantity - int_base.wop_fm_quantity_completed 
- int_base.wop_fm_quantity_rejected - int_base.wop_fm_quantity_scrapped ) op_qty_open

FROM {{ ref('stg_wop_we_wdj_msib_mp_bd_lf_mr_lf_mso_lf_oel') }} int_base
JOIN {{ ref('src_fnd_lookup_values') }} lu1
    ON int_base.wdj_status_type = lu1.lookup_code
    AND lu1.lookup_type = 'WIP_JOB_STATUS'