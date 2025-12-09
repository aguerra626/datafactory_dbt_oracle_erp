-- declare grain: one row per job
select
int_base.we_wip_entity_id,
int_base.we_wip_entity_name,
int_base.wmt_primary_item_id,
min(trunc(int_base.wmt_transaction_date)) wmt_min_transaction_date,
standard_hash(int_base.we_wip_entity_id 
        || min(to_number(to_char(trunc(int_base.wmt_transaction_date),'YYYYMMDD'))), 'MD5') move_trxns_wip_job_start_sk
from {{ ref('stg_we_wdj_wmt365days') }} int_base
where int_base.wdj_class_code IN ('CONVERSION','NONSTD-PRJ','Production','REWORK','TECH MKTG') -- exclude NSS- repair jobs
group by we_wip_entity_id,
we_wip_entity_name,
wmt_primary_item_id