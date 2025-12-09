-- define the business process: To track daily confirmations by person in WIP
-- define the granularity of the fact table: One row per day per employee
-- Naming Convension: fct_{subject}_{period}_{slice}
-- {subject}: wip_move_trxns    {period}: day, month, week, fiscal month    {slice}: employee, department, op seq num
SELECT
'wip_move_trxns_day_emp_sk' AS wip_move_trxns_day_emp_sk, --placeholder for future fct table sk
-- since its aggregation fact table, start with date sk
to_char(trunc(base.transacted_at_cst),'YYYYMMDD') AS "transaction_at_day_sk",
-- from major to minor descriptive attributes in order of cardinality
base.wmt_created_by AS "wmt_created_by_sk",
sum(base.wmt_transaction_quantity) AS "Transaction Qtys per Day"
FROM
{{ ref('stg_wmt') }} base
GROUP BY to_char(trunc(base.transacted_at_cst),'YYYYMMDD'), base.wmt_created_by