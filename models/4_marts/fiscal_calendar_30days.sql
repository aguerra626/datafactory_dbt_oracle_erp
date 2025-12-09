SELECT
trunc(base.bcal_calendar_date) AS "Fiscal Date",
base.fiscal_month AS "Fiscal Month",
base.fiscal_week AS "Fiscal Week",
base.fiscal_year AS "Fiscal Year"
from {{ ref('int_fiscal_calendar_30days') }} base