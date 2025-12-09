SELECT
    int_base.*
FROM
    {{ ref('stg_oeh_oel_msib_lf_mp_hz_ca_p_oel_ext_b') }}
    int_base
WHERE
    int_base.oel_ext_b_vmi_item_no LIKE '%966%'
    and int_base.oel_ext_b_is_vmi != 'N'
    and int_base.oeh_flow_status_code != 'CANCELLED'
    and int_base.oel_flow_status_code != 'CANCELLED'
    and int_base.oel_line_category_code != 'RETURN'