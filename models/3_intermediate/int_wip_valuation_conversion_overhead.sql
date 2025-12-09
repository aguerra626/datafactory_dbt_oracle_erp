SELECT *
FROM {{ ref('stg_we_wdj_wt_lf_wta') }} int_base
WHERE wt_lu_br_resource_code = 'ConvOH'
and meaning_wta_cst_accounting_line_type = 'WIP valuation'
