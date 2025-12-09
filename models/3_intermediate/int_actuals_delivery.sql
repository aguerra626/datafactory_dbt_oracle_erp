SELECT
    'actual delivery' AS feature,
    int_delivery.mt44_transaction_date,
    int_delivery.wdj_primary_item_id,
    sum(int_delivery.mt44_transaction_quantity) AS mt44_transaction_quantity,
    int_delivery.we_wip_entity_name
FROM {{ ref('int_wip_assembly_completions') }} int_delivery
GROUP BY
    int_delivery.we_wip_entity_name,
    int_delivery.mt44_transaction_date,
    int_delivery.wdj_primary_item_id

