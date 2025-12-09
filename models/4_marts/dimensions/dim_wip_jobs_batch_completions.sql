-- dimension grain: one row per wip entity id per batch actual completion date per organization id
with base as (
    select 
      we_wip_entity_id, 
      we_organization_id,
      we_wip_entity_name,
      wdj_date_released,
      wdj_scheduled_start_date,
      wdj_scheduled_completion_date,
      wdj_class_code,
      meaning_we_entity_type,
      meaning_wdj_job_type,
      meaning_wdj_status_type,
      meaning_wdj_wip_supply_type
    from {{ ref('stg_we_wdj') }}
), job_start as (
    select wmt_min_transaction_date, we_wip_entity_id
    from {{ ref('int_move_trxns_wip_job_start') }}
), job_batch_completion as (
    select mt44_transaction_date, we_wip_entity_id
    from {{ ref('int_wip_assembly_completions') }}
) 

select
-- surrogate key
standard_hash(base.we_wip_entity_id || to_number(to_char(trunc(job_batch_completion.mt44_transaction_date),'YYYYMMDD')) || base.we_organization_id, 'MD5') wip_jobs_batch_completions_sk,
-- business/natural keys
base.we_wip_entity_id, 
base.we_organization_id,
-- for validation only. Not using to join into dim_date since this dim model should be independent from other dim models. Following strict star schema design.
to_number(to_char(trunc(job_batch_completion.mt44_transaction_date),'YYYYMMDD')) batch_actual_completion_date_id,

-- descriptive columns that describe the fact table grain declaration.
-- major (what) dimensional attribute. High Cardinality
base.we_wip_entity_name "Job Number",

-- (when) Dates attributes 
job_start.wmt_min_transaction_date "Actual Job Start",
job_batch_completion.mt44_transaction_date "Batch Actual Completion Date",
base.wdj_date_released,
base.wdj_scheduled_start_date,
base.wdj_scheduled_completion_date,

-- why wip entity id exists, how wip entity id exists. Lower Cardinality 
base.wdj_class_code,
base.meaning_we_entity_type,
base.meaning_wdj_job_type,
base.meaning_wdj_status_type,
base.meaning_wdj_wip_supply_type

from base 
join job_start on base.we_wip_entity_id = job_start.we_wip_entity_id
join job_batch_completion on job_start.we_wip_entity_id = job_batch_completion.we_wip_entity_id
