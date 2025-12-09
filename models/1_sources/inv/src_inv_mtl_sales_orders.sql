SELECT
    sales_order_id AS mso_sales_order_id,
    last_update_date AS mso_last_update_date,
    last_updated_by AS mso_last_updated_by,
    segment1 AS mso_segment1,
    segment2 AS mso_segment2,
    segment3 AS mso_segment3,
    summary_flag AS mso_summary_flag,
    enabled_flag AS mso_enabled_flag
FROM
    {{ source('inv', 'mtl_sales_orders') }}
