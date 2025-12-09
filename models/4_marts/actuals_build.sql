SELECT
    'actual build' AS Feature,
    base.wmt_transaction_date AS "Transacted Date",
    base.wdj_primary_item_id,
    sum(base.wmt_transaction_quantity) AS "Qtys"
FROM
    {{ ref('int_actuals_build') }}
    base
GROUP BY
    base.wmt_transaction_date,
    base.wdj_primary_item_id

