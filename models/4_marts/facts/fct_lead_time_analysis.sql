with dim_wip_jobs as (
    select 
        we_wip_entity_id,
        we_wip_entity_name
    from {{ ref('stg_we_wdj') }} 
),
job_start as (
    select
        we_wip_entity_id,
        wmt_min_transaction_date
    from {{ ref('int_move_trxns_wip_job_start') }}
),
job_completion as (
    select 
        we_wip_entity_id,
        mt44_transaction_date
    from {{ ref('int_wip_assembly_completions') }}
)

select
    jobs.we_wip_entity_name as "Job Number",
    job_start.wmt_min_transaction_date as "Job Start Date",
    job_completion.mt44_transaction_date as "Job Completion Date",
    jobs.we_wip_entity_id,
    standard_hash(jobs.we_wip_entity_id || to_number(to_char(trunc(job_start.wmt_min_transaction_date),'YYYYMMDD')) || to_number(to_char(trunc(job_completion.mt44_transaction_date),'YYYYMMDD')) , 'MD5') lead_time_analysis_sk
from dim_wip_jobs jobs
join job_start on jobs.we_wip_entity_id = job_start.we_wip_entity_id
join job_completion on jobs.we_wip_entity_id = job_completion.we_wip_entity_id
