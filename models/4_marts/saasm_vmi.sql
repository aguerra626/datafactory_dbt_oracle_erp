select * from {{ ref('saasm_top_level_material_trxns_actual_qtys') }}
union all
select * from {{ ref('saasm_for_top_level_sales_planned_qtys') }}
union all 
select * from {{ ref('saasm_from_vmi_sales_planned_qtys') }}
union all 
select * from {{ ref('seed_saasm_from_sap_values') }}