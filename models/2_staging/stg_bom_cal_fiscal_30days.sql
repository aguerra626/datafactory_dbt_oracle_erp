SELECT
    src_bcal.*,
    src_fiscal.*
FROM
    {{ ref('src_bom_calendar_dates_30days') }}
    src_bcal
    JOIN {{ ref('src_gl_periods') }}
    src_fiscal
    ON src_bcal.bcal_calendar_date BETWEEN src_fiscal.fiscal_start_date
    AND src_fiscal.fiscal_end_date
