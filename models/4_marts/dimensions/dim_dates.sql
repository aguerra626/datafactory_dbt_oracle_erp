select
trunc(base.bcal_calendar_date) AS "Calendar Date",
to_char(trunc(base.bcal_calendar_date,'YYYYMMDD')) AS "calendar_date_daily_sk",
to_char(trunc(base.bcal_calendar_date,'YYYYMM')) AS "calendar_date_monthly_sk",
to_char(trunc(base.bcal_calendar_date,'YYYY')) AS "calendar_date_yearly_sk",
base.fiscal_month AS "Fiscal Month",
base.fiscal_week AS "Fiscal Week",
base.fiscal_year AS "Fiscal Year",
base.bcal_seq_num
from {{ ref('int_fiscal_calendar_365days') }} base