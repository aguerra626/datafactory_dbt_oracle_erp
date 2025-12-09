SELECT
    int_base.*,
    stg_join1.*
FROM
    {{ ref('int_saasm_top_level_sales_lines') }}
    int_base
    left join {{ ref('int_rollup_delivery_details_delivery_name') }} stg_join1
    ON int_base.oel_line_id = stg_join1.wsh_dd_source_line_id
