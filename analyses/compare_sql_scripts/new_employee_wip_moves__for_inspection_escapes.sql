with  dbt__cte__lu_we_entity_type__ as (
select lookup_type as lookup_type_we_entity_type, lookup_code as lookup_code_we_entity_type, meaning as meaning_we_entity_type from apps.fnd_lookup_values 
where lookup_type = 'WIP_ENTITY'
),  dbt__cte__src_wip_entities__ as (
SELECT
  wip_entity_id AS we_wip_entity_id,
  organization_id AS we_organization_id,
  wip_entity_name AS we_wip_entity_name,
  entity_type AS we_entity_type,
  lu.meaning_we_entity_type,
  description AS we_description,
  primary_item_id AS we_primary_item_id,
  program_application_id AS we_program_application_id
FROM
  apps.wip_entities
JOIN dbt__cte__lu_we_entity_type__ lu
on entity_type = lu.lookup_code_we_entity_type
WHERE
  organization_id = 1213
  and creation_date >= sysdate - 500
),  dbt__cte__lu_wdj_job_type__ as (
select lookup_type as lookup_type_wdj_job_type, lookup_code as lookup_code_wdj_job_type, meaning as meaning_wdj_job_type from apps.fnd_lookup_values 
where lookup_type = 'WIP_ENTITIES'
),  dbt__cte__lu_wdj_status_type__ as (
select lookup_type as lookup_type_wdj_status_type, lookup_code as lookup_code_wdj_status_type, meaning as meaning_wdj_status_type from apps.fnd_lookup_values
where lookup_type = 'WIP_JOB_STATUS'
),  dbt__cte__lu_wdj_wip_supply_type__ as (
select lookup_type as lookup_type_wdj_wip_supply_type, lookup_code as lookup_code_wdj_wip_supply_type, meaning as meaning_wdj_wip_supply_type from apps.fnd_lookup_values
where lookup_type = 'WIP_SUPPLY'
),  dbt__cte__src_wip_discrete_jobs__ as (
SELECT
  wip_entity_id AS wdj_wip_entity_id,
  organization_id AS wdj_organization_id,
  source_line_id AS wdj_source_line_id,
  source_code AS wdj_source_code,
  job_type AS wdj_job_type,
  lu.meaning_wdj_job_type,
  description AS wdj_description,
  status_type AS wdj_status_type,
  lu2.meaning_wdj_status_type,
  primary_item_id AS wdj_primary_item_id,
  wip_supply_type AS wdj_wip_supply_type,
  lu3.meaning_wdj_wip_supply_type,
  scheduled_start_date AS wdj_scheduled_start_date,
  date_released AS wdj_date_released,
  scheduled_completion_date AS wdj_scheduled_completion_date,
  mps_scheduled_completion_date as wdj_mps_scheduled_completion_date,
  common_bom_sequence_id as wdj_common_bom_sequence_id,
  common_routing_sequence_id as wdj_common_routing_sequence_id,
  date_completed AS wdj_date_completed,
  date_closed AS wdj_date_closed,
  start_quantity AS wdj_start_quantity,
  quantity_completed AS wdj_quantity_completed,
  quantity_scrapped AS wdj_quantity_scrapped,
  net_quantity AS wdj_net_quantity,
  mps_net_quantity as wdj_mps_net_quantity,
  bom_revision AS wdj_bom_revision,
  routing_revision AS wdj_routing_revision,
  bom_revision_date AS wdj_bom_revision_date,
  routing_revision_date AS wdj_routing_revision_date,
  end_item_unit_number AS wdj_end_item_unit_number,
  completion_subinventory as wdj_completion_subinventory,
  completion_locator_id as wdj_completion_locator_id,
  class_code AS wdj_class_code,
  firm_planned_flag AS wdj_firm_planned_flag,
  po_creation_time as wdj_po_creation_time,
  priority as wdj_priority,
  due_date as wdj_due_date,
  program_application_id as wdj_program_application_id
FROM
  apps.wip_discrete_jobs
JOIN dbt__cte__lu_wdj_job_type__ lu
on job_type = lu.lookup_code_wdj_job_type
JOIN dbt__cte__lu_wdj_status_type__ lu2
on status_type = lu2.lookup_code_wdj_status_type
JOIN dbt__cte__lu_wdj_wip_supply_type__ lu3
on wip_supply_type = lu3.lookup_code_wdj_wip_supply_type
WHERE
  organization_id = 1213
  and scheduled_start_date >= sysdate - 365
),  dbt__cte__src_wip_move_transactions_365days__ as (
SELECT
  transaction_id AS wmt_transaction_id,
  last_update_date AS wmt_last_update_date,
  last_updated_by AS wmt_last_updated_by,
  creation_date AS wmt_creation_date,
  created_by AS wmt_created_by,
  last_update_login AS wmt_last_update_login,
  request_id AS wmt_request_id,
  program_application_id AS wmt_program_application_id,
  program_id AS wmt_program_id,
  program_update_date AS wmt_program_update_date,
  group_id AS wmt_group_id,
  source_code AS wmt_source_code,
  source_line_id AS wmt_source_line_id,
  organization_id AS wmt_organization_id,
  wip_entity_id AS wmt_wip_entity_id,
  primary_item_id AS wmt_primary_item_id,
  transaction_date AS wmt_transaction_date,
  acct_period_id AS wmt_acct_period_id,
  fm_operation_seq_num AS wmt_fm_operation_seq_num,
  fm_department_id AS wmt_fm_department_id,
  fm_intraoperation_step_type AS wmt_fm_intraoperation_step_type,
  to_operation_seq_num AS wmt_to_operation_seq_num,
  to_department_id AS wmt_to_department_id,
  to_intraoperation_step_type AS wmt_to_intraoperation_step_type,
  transaction_quantity AS wmt_transaction_quantity,
  transaction_uom AS wmt_transaction_uom,
  primary_quantity AS wmt_primary_quantity,
  primary_uom AS wmt_primary_uom,
  qa_collection_id AS wmt_qa_collection_id,
  job_quantity_snapshot AS wmt_job_quantity_snapshot
FROM
  apps.wip_move_transactions
WHERE
  organization_id = 1213
  AND transaction_date >= SYSDATE - 365
),  dbt__cte__stg_we_wdj_wmt365days__ as (
SELECT
    src_we.*,
    src_wdj.*,
    src_wmt.*

FROM
    dbt__cte__src_wip_entities__
    src_we
    JOIN dbt__cte__src_wip_discrete_jobs__
    src_wdj
    ON src_we.we_wip_entity_id = src_wdj.wdj_wip_entity_id
    AND src_we.we_organization_id = src_wdj.wdj_organization_id
    JOIN dbt__cte__src_wip_move_transactions_365days__
    src_wmt
    ON src_we.we_wip_entity_id = src_wmt.wmt_wip_entity_id
),  dbt__cte__src_wip_operations_from__ as (
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
  apps.wip_operations
WHERE
  organization_id = 1213
  AND first_unit_start_date >= sysdate - 365
),  dbt__cte__src_wip_operations_to__ as (
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
  apps.wip_operations
WHERE
  organization_id = 1213
  and first_unit_start_date >= sysdate - 365
),  dbt__cte__stg_we_wdj_wmt365days_fm_to_wop__ as (
SELECT
    stg_base.*,
    fmwop.*,
    towop.*
FROM
    dbt__cte__stg_we_wdj_wmt365days__
    stg_base
    JOIN dbt__cte__src_wip_operations_from__
    fmwop
    ON stg_base.wmt_wip_entity_id = fmwop.wop_fm_wip_entity_id
    AND stg_base.wmt_fm_operation_seq_num = fmwop.wop_fm_operation_seq_num
    AND stg_base.wmt_organization_id = fmwop.wop_fm_organization_id
    JOIN dbt__cte__src_wip_operations_to__
    towop
    ON stg_base.wmt_wip_entity_id = towop.wop_to_wip_entity_id
    AND stg_base.wmt_to_operation_seq_num = towop.wop_to_operation_seq_num
    AND stg_base.wmt_organization_id = towop.wop_to_organization_id
),  dbt__cte__src_bom_departments_from__ as (
SELECT
    pa_expenditure_org_id AS bd_fm_pa_expenditure_org_id,
    department_id AS bd_fm_department_id,
    department_code AS bd_fm_department_code,
    organization_id AS bd_fm_organization_id,
    last_update_date AS bd_fm_last_update_date,
    last_updated_by AS bd_fm_last_updated_by,
    creation_date AS bd_fm_creation_date,
    created_by AS bd_fm_created_by,
    last_update_login AS bd_fm_last_update_login,
    description AS bd_fm_description,
    department_class_code AS bd_fm_department_class_code
FROM
    apps.bom_departments
WHERE
    organization_id = 1213
),  dbt__cte__src_bom_departments_to__ as (
SELECT
    pa_expenditure_org_id AS bd_to_pa_expenditure_org_id,
    department_id AS bd_to_department_id,
    department_code AS bd_to_department_code,
    organization_id AS bd_to_organization_id,
    last_update_date AS bd_to_last_update_date,
    last_updated_by AS bd_to_last_updated_by,
    creation_date AS bd_to_creation_date,
    created_by AS bd_to_created_by,
    last_update_login AS bd_to_last_update_login,
    description AS bd_to_description,
    department_class_code AS bd_to_department_class_code
FROM
    apps.bom_departments
WHERE
    organization_id = 1213
),  dbt__cte__stg_we_wdj_wmt365days_fm_to_wop_fm_to_bd__ as (
SELECT
    stg_we_wdj_wmt_fm_to_wop.*,
    fmbd.*,
    tobd.*
    
FROM
    dbt__cte__stg_we_wdj_wmt365days_fm_to_wop__
    stg_we_wdj_wmt_fm_to_wop
    JOIN dbt__cte__src_bom_departments_from__
    fmbd
    ON stg_we_wdj_wmt_fm_to_wop.wmt_fm_department_id = fmbd.bd_fm_department_id
    JOIN dbt__cte__src_bom_departments_to__
    tobd
    ON stg_we_wdj_wmt_fm_to_wop.wmt_to_department_id = tobd.bd_to_department_id
),  dbt__cte__src_inv_mtl_system_items_b__ as (
SELECT
  inventory_item_id AS msib_inventory_item_id,
  organization_id AS msib_organization_id,
  description AS msib_description,
  buyer_id AS msib_buyer_id,
  segment1 AS msib_segment1,
  end_assembly_pegging_flag AS msib_end_assembly_pegging_flag,
  inventory_item_status_code AS msib_inventory_item_status_code,
  planner_code AS msib_planner_code,
  planning_make_buy_code AS msib_planning_make_buy_code,
  full_lead_time AS msib_full_lead_time,
  program_application_id as msib_program_application_id
FROM
  apps.mtl_system_items_b
WHERE
  organization_id = 1213
),  dbt__cte__src_inv_mtl_planners__ as (
SELECT
  planner_code as mp_planner_code,
  organization_id as mp_organization_id,
  description as mp_description
FROM
  apps.mtl_planners
WHERE
  organization_id = 1213
),  dbt__cte__stg_msib_mp__ as (
SELECT
  src_msib.*,
  src_mp.*

FROM
    dbt__cte__src_inv_mtl_system_items_b__ src_msib
    JOIN dbt__cte__src_inv_mtl_planners__ src_mp
    on src_msib.msib_planner_code = src_mp.mp_planner_code
    and src_msib.msib_organization_id = src_mp.mp_organization_id
),  dbt__cte__stg_we_wdj_wmt365days_fm_to_wop_fm_to_bd_msib_mp__ as (
SELECT
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd.*,
    stg_msib_mp.*
FROM
    dbt__cte__stg_we_wdj_wmt365days_fm_to_wop_fm_to_bd__
    stg_we_wdj_wmt_fm_to_wop_fm_to_bd
    JOIN dbt__cte__stg_msib_mp__
    stg_msib_mp
    ON stg_we_wdj_wmt_fm_to_wop_fm_to_bd.wmt_primary_item_id = stg_msib_mp.msib_inventory_item_id
    AND stg_we_wdj_wmt_fm_to_wop_fm_to_bd.wmt_organization_id = stg_msib_mp.msib_organization_id
),  dbt__cte__int_employee_wip_moves_365days__ as (
select
int_base.*,
FROM_TZ(CAST(int_base.wmt_transaction_date AS TIMESTAMP),'America/New_York') 
        AT TIME ZONE 'America/Chicago' 
            AS transacted_at_cst,
src_fu.*
from dbt__cte__stg_we_wdj_wmt365days_fm_to_wop_fm_to_bd_msib_mp__ int_base
join apps.fnd_user src_fu
on int_base.wmt_created_by = src_fu.user_id
), base as (
select
    int_base.wmt_transaction_id,
    cast(to_char(cast(int_base.transacted_at_cst as date), 'DD-MON-YY') as date) AS "Transaction Date CST",
    cast(to_char(cast(int_base.transacted_at_cst as timestamp), 'DD-MON-YY HH12:MI:SS AM') as timestamp) AS "Transaction Datetime CST", 
    REPLACE(int_base.user_name, '.', ' ') AS "Employee Name",
    int_base.user_name AS user_name,
    mp_description AS "Planner",
    int_base.msib_segment1 AS "Part Number",
    int_base.msib_description AS "Part Description",
    int_base.we_wip_entity_name AS "Job Number",
    int_base.wmt_fm_operation_seq_num AS "Fm Op Seq Num",
    int_base.wop_fm_description AS "Fm Op Description",
    int_base.wmt_fm_intraoperation_step_type AS "Fm Intraop Step Type",
    int_base.bd_fm_department_code AS "Fm Department",
    int_base.wmt_to_operation_seq_num AS "To Op Seq Num",
    int_base.wop_to_description AS "To Op Description",
    int_base.wmt_to_intraoperation_step_type AS "To Intraop Step Type",
    int_base.bd_to_department_code AS "To Department",
    int_base.transacted_at_cst AS "Transaction Datetimezone CST",
    int_base.wmt_transaction_quantity AS "Transaction Qty",
    ' ' AS blank__ -- tableau text pane blank space placeholder

 
from dbt__cte__int_employee_wip_moves_365days__ int_base
)
select * from base