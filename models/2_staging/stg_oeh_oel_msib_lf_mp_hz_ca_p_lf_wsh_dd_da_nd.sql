SELECT
    stg_base.*,
    stg_join1.*
FROM
    {{ ref('stg_oeh_oel_msib_lf_mp_hz_ca_p') }}
    stg_base
    LEFT JOIN {{ ref('stg_wsh_dd_da_nd') }}
    stg_join1
    ON stg_base.oel_line_id = stg_join1.wsh_dd_source_line_id
