select count(PART_NUMBER_GROUP), msib_segment1 from (

with dbt__cte__src_wip_operations_from__ as (
SELECT
  wip_entity_id AS wop_fm_wip_entity_id,
  operation_seq_num AS wop_fm_operation_seq_num,
  organization_id AS wop_fm_organization_id,
  operation_sequence_id AS wop_fm_operation_sequence_id,
  standard_operation_id AS wop_fm_standard_operation_id,
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
  date_last_moved AS wop_fm_date_last_moved,
  previous_operation_seq_id AS wop_fm_previous_operation_seq_id,
  long_description AS wop_fm_long_description,
  cumulative_scrap_quantity AS wop_fm_cumulative_scrap_quantity,
  actual_start_date AS wop_fm_actual_start_date,
  actual_completion_date AS wop_fm_actual_completion_date,
  attribute5 AS wop_fm_attribute5,
  program_application_id AS wop_fm_program_application_id
FROM
  apps.wip_operations
WHERE
  organization_id = 1213
  and first_unit_start_date between sysdate - 365 and sysdate + 365
  
),  dbt__cte__src_wip_entities__ as (
SELECT
  wip_entity_id AS we_wip_entity_id,
  organization_id AS we_organization_id,
  wip_entity_name AS we_wip_entity_name,
  entity_type AS we_entity_type,
  description AS we_description,
  primary_item_id AS we_primary_item_id,
  program_application_id AS we_program_application_id
FROM
  apps.wip_entities
WHERE
  organization_id = 1213
  and creation_date between sysdate - 365 and sysdate + 365
),  dbt__cte__src_wip_discrete_jobs__ as (
SELECT
  wip_entity_id AS wdj_wip_entity_id,
  organization_id AS wdj_organization_id,
  source_line_id AS wdj_source_line_id,
  source_code AS wdj_source_code,
  description AS wdj_description,
  status_type AS wdj_status_type,
  primary_item_id AS wdj_primary_item_id,
  wip_supply_type AS wdj_wip_supply_type,
  scheduled_start_date AS wdj_scheduled_start_date,
  date_released AS wdj_date_released,
  scheduled_completion_date AS wdj_scheduled_completion_date,
  date_completed AS wdj_date_completed,
  date_closed AS wdj_date_closed,
  start_quantity AS wdj_start_quantity,
  quantity_completed AS wdj_quantity_completed,
  quantity_scrapped AS wdj_quantity_scrapped,
  net_quantity AS wdj_net_quantity,
  bom_revision AS wdj_bom_revision,
  routing_revision AS wdj_routing_revision,
  bom_revision_date AS wdj_bom_revision_date,
  routing_revision_date AS wdj_routing_revision_date,
  end_item_unit_number AS wdj_end_item_unit_number,
  completion_subinventory as wdj_completion_subinventory,
  class_code AS wdj_class_code,
  program_application_id as wdj_program_application_id
FROM
  apps.wip_discrete_jobs
WHERE
  organization_id = 1213
  and scheduled_start_date between sysdate - 365 and sysdate + 365
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
),  dbt__cte__stg_we_wdj_msib__ as (
SELECT
    src_we.*,
    src_wdj.*,
    src_msib_mp.*    

FROM
    dbt__cte__src_wip_entities__
    src_we
    JOIN dbt__cte__src_wip_discrete_jobs__
    src_wdj
    ON src_we.we_wip_entity_id = src_wdj.wdj_wip_entity_id
    AND src_we.we_organization_id = src_wdj.wdj_organization_id
    JOIN dbt__cte__stg_msib_mp__ src_msib_mp
    ON src_wdj.wdj_primary_item_id = src_msib_mp.msib_inventory_item_id
    and src_wdj.wdj_organization_id = src_msib_mp.msib_organization_id
),  dbt__cte__stg_from_wop_we_wdj__ as (
SELECT
    src_fm_wop.*,
    stg_we_wdj_msib.*,
    standard_hash(stg_we_wdj_msib.wdj_wip_entity_id||stg_we_wdj_msib.wdj_organization_id||src_fm_wop.wop_fm_operation_seq_num, 'MD5') as stg_from_wop_we_wdj_surrogate_key
FROM
    dbt__cte__src_wip_operations_from__
    src_fm_wop
    JOIN dbt__cte__stg_we_wdj_msib__
    stg_we_wdj_msib
    ON src_fm_wop.wop_fm_wip_entity_id = stg_we_wdj_msib.wdj_wip_entity_id
    AND src_fm_wop.wop_fm_organization_id = stg_we_wdj_msib.wdj_organization_id
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
),  dbt__cte__stg_from_wop_we_wdj_lf_wmt__ as (
SELECT
    *
FROM
    dbt__cte__stg_from_wop_we_wdj__
    stg_from_wop_we_wdj
    LEFT JOIN dbt__cte__src_wip_move_transactions_365days__
    src_wmt
    ON stg_from_wop_we_wdj.wop_fm_wip_entity_id = src_wmt.wmt_wip_entity_id
    AND stg_from_wop_we_wdj.wop_fm_operation_seq_num = src_wmt.wmt_fm_operation_seq_num
    AND stg_from_wop_we_wdj.wop_fm_organization_id = src_wmt.wmt_organization_id
) SELECT
    FROM_TZ(CAST(NVL(stg_from_wop_we_wdj_lf_wmt.wmt_transaction_date,sysdate) AS TIMESTAMP),'America/New_York') 
        AT TIME ZONE 'America/Chicago' 
            AS transacted_at_cst,
    FROM_TZ(CAST(NVL(stg_from_wop_we_wdj_lf_wmt.wmt_transaction_date,sysdate) AS TIMESTAMP),'America/New_York') 
        AT TIME ZONE '-06:00' 
            AS transacted_at_cst_offset,
    CAST(NVL(stg_from_wop_we_wdj_lf_wmt.wmt_transaction_date,sysdate) AS TIMESTAMP) 
            AS transacted_at_est,
    FROM_TZ(CAST(NVL(stg_from_wop_we_wdj_lf_wmt.wmt_transaction_date,sysdate) AS TIMESTAMP),'America/New_York') 
        AT TIME ZONE 'UTC'
            AS transacted_at_utc,
    FROM_TZ(CAST(NVL(stg_from_wop_we_wdj_lf_wmt.wmt_transaction_date,sysdate) AS TIMESTAMP),'America/New_York') 
        AT TIME ZONE '-04:00' 
            AS shift_start_at,
    CASE
        WHEN stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '987-7173-%' THEN 'NavStorm'
        WHEN stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '822-2347-%' THEN 'NavStorm'
        WHEN stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '983-9834-%' THEN 'NavFire'
        WHEN stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '822-2904-%' THEN 'NavFire'
        WHEN stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '822-1600-137%' THEN 'NavStrike'
        WHEN stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '822-1600-138%' THEN 'NavStrike'
        WHEN stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '822-3078-002%' THEN 'ASR 3.7'
        WHEN stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '822-3396-%' THEN 'NavStrike M'
        WHEN stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '822-1873-%' THEN 'DAGR'
        WHEN stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '822-3527-%' THEN 'DIGAR'
    END AS part_number_group,
    stg_from_wop_we_wdj_lf_wmt.msib_segment1,
    stg_from_wop_we_wdj_lf_wmt.msib_description,
    NVL(stg_from_wop_we_wdj_lf_wmt.wmt_fm_operation_seq_num,stg_from_wop_we_wdj_lf_wmt.wop_fm_operation_seq_num) nvl_wmt_wop_fm_operation_seq_num,
    stg_from_wop_we_wdj_lf_wmt.wop_fm_description,
    NVL(stg_from_wop_we_wdj_lf_wmt.wmt_transaction_quantity,0) nvl_wmt_0_transaction_quantity,
    stg_from_wop_we_wdj_lf_wmt.we_wip_entity_name
FROM
    dbt__cte__stg_from_wop_we_wdj_lf_wmt__
    stg_from_wop_we_wdj_lf_wmt
WHERE
    stg_from_wop_we_wdj_lf_wmt.wdj_organization_id = 1213
    AND NVL(stg_from_wop_we_wdj_lf_wmt.wmt_transaction_date,sysdate) >= SYSDATE - 1
    AND (
        stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '822-1600-137%'
        OR stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '822-1600-138%'
        OR stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '822-3396-%'
        OR stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '822-2904-%'
        OR stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '983-9834-%'
        OR stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '822-2347-%'
        OR stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '987-7173-%'
        OR stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '822-3078-002%'
        OR stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '822-1873-003%'
        OR stg_from_wop_we_wdj_lf_wmt.msib_segment1 LIKE '822-3527-%'
    )
    
    ) qual_test
where qual_test.PART_NUMBER_GROUP= 'NavStrike'
group by msib_segment1
