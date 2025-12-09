select 
stg_base.*,
stg_join1.fiscal_month
FROM {{ ref('src_mrp_recommendations') }} stg_base
join {{ ref('stg_bom_cal_fiscal_30days') }} stg_join1
on TRUNC(stg_base.rec_new_wip_start_date) = TRUNC(stg_join1.bcal_calendar_date)