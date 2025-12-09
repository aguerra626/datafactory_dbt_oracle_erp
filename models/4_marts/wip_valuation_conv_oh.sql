SELECT
base.we_wip_entity_name,
base.wt_operation_seq_num,
base.we_primary_item_id,
base.wdj_class_code,
base.meaning_wdj_status_type,
base.wt_transaction_quantity,
base.wt_usage_rate_or_amount,
round(base.wt_transaction_quantity / base.wt_usage_rate_or_amount,2) unit_qtys,
base.meaning_wt_transaction_type,
base.meaning_wta_cst_accounting_line_type,
base.wt_lu_br_resource_code,
base.wt_lu_br_description,
base.wt_transaction_uom,
base.wta_transaction_date,
base.wta_base_transaction_value,
base.wta_primary_quantity,
base.wta_basis_type,
base.wta_rate_or_amount,
join1."Calendar Date",
join1."Fiscal Month",
join1."Fiscal Year",
join1."Work Dates Index"
FROM {{ ref('int_wip_valuation_conversion_overhead') }} base
JOIN {{ ref('dim_fiscal_and_calendar_dates') }} join1
  on base.wt_transaction_date >= join1."Calendar Date"
  and base.wt_transaction_date < join1."Calendar Date" + 1
-- according to chatgpt, this range predicate is best practice for enterprise data warehousing