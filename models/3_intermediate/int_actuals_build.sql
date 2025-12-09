SELECT
    'actual build' AS Feature,
    int_base.wmt_transaction_date,
    int_base.wdj_primary_item_id,
    sum(int_base.wmt_transaction_quantity) wmt_transaction_quantity,
    int_base.we_wip_entity_name
FROM
    {{ ref('int_wip_nettable_credit_op_step_for_queue_to_move_types') }}
    int_base
GROUP BY
    int_base.we_wip_entity_name,
    int_base.wmt_transaction_date,
    int_base.wdj_primary_item_id

