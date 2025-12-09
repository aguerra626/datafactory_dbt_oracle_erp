SELECT
    stg_base.*,
    stg_join1.*
FROM
    {{ ref('stg_oeh_oel_msib_lf_mp') }}
    stg_base
    JOIN {{ ref('stg_hz_ca_p') }}
    stg_join1
    ON stg_base.oeh_sold_to_org_id = stg_join1.hz_ca_cust_account_id
