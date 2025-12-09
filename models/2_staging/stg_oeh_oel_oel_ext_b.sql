SELECT
    stg_base.*,
    src_oel_ext_b.*
FROM
    {{ ref('stg_oeh_oel') }}
    stg_base
    JOIN {{ ref('src_oe_order_lines_all_ext_b') }}
    src_oel_ext_b
    ON stg_base.oel_line_id = src_oel_ext_b.oel_ext_b_line_id
