SELECT
  wip_entity_id AS wop_to_wip_entity_id,
  operation_seq_num AS wop_to_operation_seq_num,
  organization_id AS wop_to_organization_id,
  operation_sequence_id AS wop_to_operation_sequence_id,
  standard_operation_id AS wop_to_standard_operation_id,
  department_id AS wop_to_department_id,
  description AS wop_to_description,
  scheduled_quantity AS wop_to_scheduled_quantity,
  quantity_in_queue AS wop_to_quantity_in_queue,
  quantity_running AS wop_to_quantity_running,
  quantity_waiting_to_move AS wop_to_quantity_waiting_to_move,
  quantity_rejected AS wop_to_quantity_rejected,
  quantity_scrapped AS wop_to_quantity_scrapped,
  quantity_completed AS wop_to_quantity_completed,
  first_unit_start_date AS wop_to_first_unit_start_date,
  first_unit_completion_date AS wop_to_first_unit_completion_date,
  last_unit_start_date AS wop_to_last_unit_start_date,
  last_unit_completion_date AS wop_to_last_unit_completion_date,
  previous_operation_seq_num AS wop_to_previous_operation_seq_num,
  next_operation_seq_num AS wop_to_next_operation_seq_num,
  date_last_moved AS wop_to_date_last_moved,
  previous_operation_seq_id AS wop_to_previous_operation_seq_id,
  long_description AS wop_to_long_description,
  cumulative_scrap_quantity AS wop_to_cumulative_scrap_quantity,
  actual_start_date AS wop_to_actual_start_date,
  actual_completion_date AS wop_to_actual_completion_date,
  attribute5 AS wop_to_attribute5,
  program_application_id AS wop_to_program_application_id
FROM
  {{ source(
    'wip',
    'wip_operations'
  ) }}
WHERE
  organization_id = 1213
  and first_unit_start_date >= sysdate - 365
