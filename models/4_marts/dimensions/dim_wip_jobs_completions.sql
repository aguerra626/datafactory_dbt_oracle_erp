-- dimension grain: one row per wip entity id per organization id
{# with base as (
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
), job_completion_max as (
    select max(mt44_transaction_date) max_mt44_transaction_date, we_wip_entity_id
    from {{ ref('int_wip_assembly_completions') }}
    group by we_wip_entity_id
)  #}


select
-- surrogate key
standard_hash(base.we_wip_entity_id || base.we_organization_id, 'MD5') wip_job_sk,
-- business/natural keys
base.we_wip_entity_id, 
base.we_organization_id,

-- descriptive columns that describe the fact table grain declaration.
-- main dimensional attribute
base.we_wip_entity_name "Job Number",

-- when attributes (dates)

base.wdj_date_released,
base.wdj_scheduled_start_date,
base.wdj_scheduled_completion_date,
job_start.wmt_min_transaction_date "Actual Job Start",
job_completion_max.max_mt44_transaction_date "Latest Completion Date",

-- supporting lookup attributes
base.wdj_class_code,
base.meaning_we_entity_type,
base.meaning_wdj_job_type,
base.meaning_wdj_status_type,
base.meaning_wdj_wip_supply_type

from {{ ref('stg_we_wdj') }} base 
left join (select wmt_min_transaction_date, we_wip_entity_id from {{ ref('int_move_trxns_wip_job_start') }}) job_start 
    on base.we_wip_entity_id = job_start.we_wip_entity_id
left join ( select max(mt44_transaction_date) max_mt44_transaction_date, we_wip_entity_id from {{ ref('int_wip_assembly_completions') }} group by we_wip_entity_id) job_completion_max 
    on job_start.we_wip_entity_id = job_completion_max.we_wip_entity_id
