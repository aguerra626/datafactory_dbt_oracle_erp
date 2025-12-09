SELECT 
stg_base.*,
FROM_TZ(CAST(stg_base.wmt_transaction_date AS TIMESTAMP),'America/New_York') 
        AT TIME ZONE 'America/Chicago' 
            AS transacted_at_cst
FROM
{{ ref('src_wip_move_transactions_365days') }} stg_base