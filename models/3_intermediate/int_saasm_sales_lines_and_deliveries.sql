SELECT
    int_base.*
FROM
    {{ ref('stg_oeh_oel_msib_lf_mp_hz_ca_p_lf_wsh_dd_da_nd') }}
    int_base
WHERE
    int_base.oel_user_item_description LIKE '%966%'
    AND (UPPER(int_base.oel_user_item_description) NOT LIKE '%STORAGE%'
    AND UPPER(int_base.oel_user_item_description) NOT LIKE '%FEE%')
    AND int_base.oeh_flow_status_code != 'CANCELLED'
    AND int_base.oel_flow_status_code != 'CANCELLED'
    AND int_base.oel_line_category_code != 'RETURN'
