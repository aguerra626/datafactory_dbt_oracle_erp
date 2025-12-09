WITH dbt__cte__src_bom_calendar_dates_30days__ AS (
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
        AND calendar_date BETWEEN SYSDATE -30
        AND SYSDATE + 30
),
dbt__cte__src_gl_periods__ AS (
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
        AND start_date BETWEEN SYSDATE -30
        AND SYSDATE + 30
),
dbt__cte__stg_bom_cal_fiscal_30days__ AS (
    SELECT
        src_bcal.*,
        src_fiscal.*
    FROM
        dbt__cte__src_bom_calendar_dates_30days__ src_bcal
        JOIN dbt__cte__src_gl_periods__ src_fiscal
        ON src_bcal.bcal_calendar_date BETWEEN src_fiscal.fiscal_start_date
        AND src_fiscal.fiscal_end_date
)
SELECT
    int_base.fiscal_month,
    TRUNC(SYSDATE) AS "update_at"
FROM
    dbt__cte__stg_bom_cal_fiscal_30days__ int_base
WHERE
    TRUNC(SYSDATE) BETWEEN TRUNC(
        int_base.fiscal_start_date
    )
    AND TRUNC(
        int_base.fiscal_end_date
    )
    AND ROWNUM = 1
