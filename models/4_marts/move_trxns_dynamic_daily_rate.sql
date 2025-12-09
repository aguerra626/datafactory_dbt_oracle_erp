with base as (
SELECT
    cast(to_char(cast(shift_start_at as date), 'DD-MON-YY') as date) "START DAILY RATE DATE",
    int_move_trxns_dynamic_daily_rate.part_number_group "PART NUMBER GROUP",
    int_move_trxns_dynamic_daily_rate.wop_fm_description "FM OP DESC",
    SUM(
        int_move_trxns_dynamic_daily_rate.nvl_wmt_0_transaction_quantity
    ) "TRANSACTION QUANTITY"
FROM
    {{ ref('int_move_trxns_dynamic_daily_rate') }}
    int_move_trxns_dynamic_daily_rate
WHERE
    1 = 1
GROUP BY
    to_char(cast(int_move_trxns_dynamic_daily_rate.shift_start_at as date), 'DD-MON-YY'),
    int_move_trxns_dynamic_daily_rate.part_number_group,
    int_move_trxns_dynamic_daily_rate.wop_fm_description
)
select * from base