SELECT
trunc(base.bcal_calendar_date) AS "Fiscal Date",
base.fiscal_month AS "Fiscal Month",
base.fiscal_week AS "Fiscal Week",
base.fiscal_year AS "Fiscal Year"
from {{ ref('int_fiscal_calendar_365days') }} base
where base.fiscal_year = 
(
    select x.fiscal_year from {{ ref('int_fiscal_calendar_current_year') }} x
)
order by "Fiscal Date"