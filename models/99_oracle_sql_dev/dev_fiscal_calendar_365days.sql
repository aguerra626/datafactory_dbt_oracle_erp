WITH dbt__cte__src_bom_calendar_dates_365days__ AS (
    SELECT
        calendar_date AS bcal_calendar_date,
        next_date AS bcal_next_date,
        seq_num AS bcal_seq_num,
        next_seq_num AS bcal_next_seq_num,
        CASE
            WHEN seq_num IS NULL THEN next_date
            ELSE calendar_date
        END AS bcal_working_dates
    FROM
        apps.bom_calendar_dates
    WHERE
        calendar_code = 'NSS'
        AND calendar_date BETWEEN SYSDATE -365
        AND SYSDATE + 365
),
dbt__cte__src_gl_periods_365days__ AS (
    SELECT
        start_date AS fiscal_start_date,
        end_date AS fiscal_end_date,
        entered_period_name AS fiscal_month,
        period_year AS fiscal_year,
        'Week ' || period_num AS fiscal_week,
        quarter_num AS fiscal_quarter
    FROM
        apps.gl_periods
    WHERE
        period_set_name = 'BAE_FW'
        AND start_date BETWEEN SYSDATE -365
        AND SYSDATE + 365
),
dbt__cte__stg_bom_cal_fiscal_365days__ AS (
    SELECT
        src_bcal.*,
        src_fiscal.*
    FROM
        dbt__cte__src_bom_calendar_dates_365days__ src_bcal
        JOIN dbt__cte__src_gl_periods_365days__ src_fiscal
        ON src_bcal.bcal_calendar_date BETWEEN src_fiscal.fiscal_start_date
        AND src_fiscal.fiscal_end_date
),
dbt__cte__int_fiscal_calendar_365days__ AS (
    SELECT
        int_base.*,
        to_char(
            int_base.bcal_calendar_date,
            'Dy'
        ) day_abbreviated,
        TRUNC(
            int_base.bcal_calendar_date,
            'IW'
        ) oracle_monday_of_week,
        NEXT_DAY(
            int_base.bcal_calendar_date,
            'MONDAY'
        ) next_monday,
        ROW_NUMBER() over (
            PARTITION BY int_base.fiscal_year,
            int_base.fiscal_month
            ORDER BY
                TRUNC(
                    int_base.bcal_calendar_date
                )
        ) index_monthly,
        standard_hash(
            int_base.bcal_calendar_date || int_base.fiscal_month,
            'MD5'
        ) AS sk_fiscal_calendar
    FROM
        dbt__cte__stg_bom_cal_fiscal_365days__ int_base
)
SELECT
    TRUNC(
        base.bcal_calendar_date
    ) AS "Fiscal Date",
    base.fiscal_month AS "Fiscal Month",
    base.fiscal_week AS "Fiscal Week",
    base.fiscal_year AS "Fiscal Year",
    base.day_abbreviated,
    base.oracle_monday_of_week,
    base.next_monday,
    base.index_monthly,
    CASE
        WHEN index_monthly = 1
        AND day_abbreviated = 'Sat' THEN base.next_monday
        ELSE TRUNC(
            base.bcal_calendar_date
        )
    END fiscal_date_rollover_sat,
    CASE
        WHEN index_monthly = 2
        AND day_abbreviated = 'Sun' THEN base.next_monday
        ELSE TRUNC(
            base.bcal_calendar_date
        )
    END fiscal_date_rollover_sun,
    CASE
        WHEN index_monthly = 1
        AND day_abbreviated = 'Sat'
        OR index_monthly = 2
        AND day_abbreviated = 'Sun' THEN base.next_monday
        ELSE TRUNC(
            base.bcal_calendar_date
        )
    END fiscal_date_rollover_sat_sun
FROM
    dbt__cte__int_fiscal_calendar_365days__ base
