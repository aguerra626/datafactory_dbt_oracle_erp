-- Column ordering for fact tables: Fact Table SK, Dim Tables SKs
-- still incomplete. how do i finish designing this fact table? do i use CTE and ref?

select 
1 fct_wip_job_batch_completions_sk,
wip_jobs_batch_completions_sk,
fiscal_and_calendar_dates_sk,
item_master_sk,
mt44_transaction_quantity
from base
