SELECT
trunc(base.bcal_calendar_date) AS "Fiscal Date",
base.fiscal_month AS "Fiscal Month",
base.fiscal_week AS "Fiscal Week",
base.fiscal_year AS "Fiscal Year",
base.day_abbreviated,
base.oracle_monday_of_week,
base.next_monday,
base.index_monthly,
case when index_monthly = 1 and day_abbreviated = 'Sat' then base.next_monday else trunc(base.bcal_calendar_date) end fiscal_date_rollover_sat,
case when index_monthly = 2 and day_abbreviated = 'Sun' then base.next_monday else trunc(base.bcal_calendar_date) end fiscal_date_rollover_sun,
case when index_monthly = 1 and day_abbreviated = 'Sat' or index_monthly = 2 and day_abbreviated = 'Sun' then base.next_monday else trunc(base.bcal_calendar_date) end fiscal_date_rollover_sat_sun
from {{ ref('int_fiscal_calendar_365days') }} base