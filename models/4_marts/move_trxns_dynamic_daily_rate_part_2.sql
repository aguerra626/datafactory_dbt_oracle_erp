with base as (
SELECT
    cast(to_char(cast(transacted_at_cst as date), 'DD-MON-YY') as date) "Transacted At (CST)",
    int_move_trxns_dynamic_daily_rate.part_number_group "PART NUMBER GROUP",
    int_move_trxns_dynamic_daily_rate.nvl_wmt_wop_fm_operation_seq_num "Fm Op Num",
    SUM(
        int_move_trxns_dynamic_daily_rate.nvl_wmt_0_transaction_quantity
    ) "TRANSACTION QUANTITY"
FROM
    {{ ref('int_move_trxns_dynamic_daily_rate_part2') }}
    int_move_trxns_dynamic_daily_rate
GROUP BY
    to_char(cast(int_move_trxns_dynamic_daily_rate.transacted_at_cst as date), 'DD-MON-YY'),
    int_move_trxns_dynamic_daily_rate.part_number_group,
    int_move_trxns_dynamic_daily_rate.nvl_wmt_wop_fm_operation_seq_num
)
select * from base