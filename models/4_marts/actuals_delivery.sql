SELECT
    'actual delivery' AS feature,
    base.mt44_transaction_date AS "Transacted Date",
    base.wdj_primary_item_id,
    sum(base.mt44_transaction_quantity) AS "Qtys"
FROM {{ ref('int_actuals_delivery') }} base
GROUP BY
    base.mt44_transaction_date,
    base.wdj_primary_item_id

