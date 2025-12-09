SELECT
    src_wsh_dd.*,
    src_wsh_da.*,
    src_wsh_nd.*
FROM
    {{ ref('src_wsh_delivery_details') }}
    src_wsh_dd
    JOIN {{ ref('src_wsh_delivery_assignments') }}
    src_wsh_da
    ON src_wsh_dd.wsh_dd_delivery_detail_id = src_wsh_da.wsh_da_delivery_detail_id
    JOIN {{ ref('src_wsh_new_deliveries') }}
    src_wsh_nd
    ON src_wsh_da.wsh_da_delivery_id = src_wsh_nd.wsh_nd_delivery_id
