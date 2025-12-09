with base as (
    select * from {{ ref('mrp_monthly_build') }}
    union all
    select * from {{ ref('mrp_monthly_delivery') }}
)
select sysdate updated_at, base.* from base