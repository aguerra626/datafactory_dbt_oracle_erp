SELECT
  actual_completion_date AS wop_fm_actual_completion_date,
  check_skill AS wop_fm_check_skill,
  wip_entity_id AS wop_fm_wip_entity_id,
  operation_seq_num AS wop_fm_operation_seq_num,
  organization_id AS wop_fm_organization_id,
  last_update_date AS wop_fm_last_update_date,
  last_updated_by AS wop_fm_last_updated_by,
  creation_date AS wop_fm_creation_date,
  created_by AS wop_fm_created_by,
  last_update_login AS wop_fm_last_update_login,
  request_id AS wop_fm_request_id,
  program_application_id AS wop_fm_program_application_id,
  program_id AS wop_fm_program_id,
  program_update_date AS wop_fm_program_update_date,
  operation_sequence_id AS wop_fm_operation_sequence_id,
  department_id AS wop_fm_department_id,
  description AS wop_fm_description,
  scheduled_quantity AS wop_fm_scheduled_quantity,
  quantity_in_queue AS wop_fm_quantity_in_queue,
  quantity_running AS wop_fm_quantity_running,
  quantity_waiting_to_move AS wop_fm_quantity_waiting_to_move,
  quantity_rejected AS wop_fm_quantity_rejected,
  quantity_scrapped AS wop_fm_quantity_scrapped,
  quantity_completed AS wop_fm_quantity_completed,
  first_unit_start_date AS wop_fm_first_unit_start_date,
  first_unit_completion_date AS wop_fm_first_unit_completion_date,
  last_unit_start_date AS wop_fm_last_unit_start_date,
  last_unit_completion_date AS wop_fm_last_unit_completion_date,
  previous_operation_seq_num AS wop_fm_previous_operation_seq_num,
  next_operation_seq_num AS wop_fm_next_operation_seq_num,
  count_point_type AS wop_fm_count_point_type,
  backflush_flag AS wop_fm_backflush_flag,
  minimum_transfer_quantity AS wop_fm_minimum_transfer_quantity,
  date_last_moved AS wop_fm_date_last_moved,
  attribute5 AS wop_fm_attribute5,
  cumulative_scrap_quantity AS wop_fm_cumulative_scrap_quantity
FROM
  {{ source(
    'wip',
    'wip_operations'
  ) }}
WHERE
  organization_id = 1213
  AND first_unit_start_date >= sysdate - 365