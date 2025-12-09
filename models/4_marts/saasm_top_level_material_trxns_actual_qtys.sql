SELECT
  base.mil_segment1 locator,
  base.msib_segment1 part_number,
  base.custowned_transaction_quantity quantity,
  CAST(  to_char(CAST(base.transacted_at_cst AS DATE), 'DD-MON-YY') AS DATE) vmi_date_cst,
  to_char (  base.custowned_transaction_id) element_id,
  'VMI TRXNS ACTUALS' feature,
  base.custowned_transaction_reference ref_text,
  'NA' party_name,
  NULL delivery_no,
  'NA' flow_status,
  NULL sk1,
  NULL sk2,
  lu_mtl_tr_reason_name reason_code
FROM
  {{ ref('int_saasm_custowned_material_transactions') }}
  base
