SELECT
    stg_base.*,
    src_wta.* 

FROM
    {{ ref('stg_we_wdj_wt') }}
    stg_base
    LEFT JOIN {{ ref('src_wip_transaction_accounts') }}
    src_wta
    ON stg_base.wt_transaction_id = src_wta.wta_transaction_id