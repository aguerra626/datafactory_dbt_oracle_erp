SELECT wt_primary_item_id, wt_usage_rate_or_amount
FROM {{ ref('src_wip_transactions') }} src_wt
LEFT JOIN {{ ref('src_wip_transaction_accounts') }} src_wta
ON src_wt.wt_transaction_id = src_wta.wta_transaction_id
WHERE 
wt_organization_id = 1213
and src_wta.wta_lu_br_resource_code = 'ConvOH'
and src_wta.meaning_wta_cst_accounting_line_type = 'WIP valuation'