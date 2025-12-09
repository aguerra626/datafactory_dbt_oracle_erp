-- dimension grain: one row per calendar date
{# with base as (
    select *
    from {{ ref('int_fiscal_calendar_365days') }}
) #}
-- From High Cardinality to Low Cardinality.
-- From Surrogate Keys to Business/Natural Keys to Major descriptive attributes to Date Attributes to Flags/Booleans
select 
standard_hash(to_number(to_char(base.bcal_calendar_date,'YYYYMMDD')),'MD5') fiscal_and_calendar_dates_sk,
to_number(to_char(base.bcal_calendar_date,'YYYYMMDD')) bcal_calendar_date_id,
base.bcal_calendar_date "Calendar Date",
base.fiscal_month "Fiscal Month",
base.fiscal_year "Fiscal Year",
base.bcal_seq_num "Work Dates Index",
base.index_monthly "Day Fiscal Month Index",
base.day_abbreviated "Day of Calendar Date",
to_char(base.bcal_calendar_date,'Mon') "Month of Calendar Date",
base.oracle_monday_of_week "Monday of the current week",
base.next_monday "Following Monday of current day",
base.fiscal_date_placeholder
from {{ ref('int_fiscal_calendar_365days') }} base
