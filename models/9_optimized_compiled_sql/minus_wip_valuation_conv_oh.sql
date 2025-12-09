-- declare grain: One row per item per job per transaction
SELECT
  we.primary_item_id,
  we.wip_entity_name,
  wt.operation_seq_num,
  round(wt.transaction_quantity,4) transaction_quantity,
  round(wt.usage_rate_or_amount,4) unit_cost,
  round(wt.transaction_quantity / wt.usage_rate_or_amount,2) unit_qtys,
  wt.transaction_date,
  br.resource_code,
  br.description,
  wdj.class_code,
  fiscal.entered_period_name as "Fiscal Month",
  fiscal.period_year as "Fiscal Year",
  case
  -- fiscal 2024
  when fiscal.entered_period_name = 'Jan24' then to_date('2024-01-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Feb24' then to_date('2024-02-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Mar24' then to_date('2024-03-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Apr24' then to_date('2024-04-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'May24' then to_date('2024-05-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Jun24' then to_date('2024-06-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Jul24' then to_date('2024-07-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Aug24' then to_date('2024-08-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Sep24' then to_date('2024-09-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Oct24' then to_date('2024-10-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Nov24' then to_date('2024-11-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Dec24' then to_date('2024-12-01','YYYY-MM-DD')
  -- fiscal 2025
  when fiscal.entered_period_name = 'Jan25' then to_date('2025-01-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Feb25' then to_date('2025-02-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Mar25' then to_date('2025-03-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Apr25' then to_date('2025-04-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'May25' then to_date('2025-05-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Jun25' then to_date('2025-06-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Jul25' then to_date('2025-07-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Aug25' then to_date('2025-08-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Sep25' then to_date('2025-09-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Oct25' then to_date('2025-10-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Nov25' then to_date('2025-11-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Dec25' then to_date('2025-12-01','YYYY-MM-DD')
  -- fiscal 2026
  when fiscal.entered_period_name = 'Jan26' then to_date('2026-01-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Feb26' then to_date('2026-02-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Mar26' then to_date('2026-03-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Apr26' then to_date('2026-04-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'May26' then to_date('2026-05-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Jun26' then to_date('2026-06-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Jul26' then to_date('2026-07-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Aug26' then to_date('2026-08-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Sep26' then to_date('2026-09-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Oct26' then to_date('2026-10-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Nov26' then to_date('2026-11-01','YYYY-MM-DD')
  when fiscal.entered_period_name = 'Dec26' then to_date('2026-12-01','YYYY-MM-DD')
else null
end AS tableau_date_format_change_to_custom_mmm_yy,
  wt.transaction_id
FROM apps.wip_entities we 
JOIN apps.wip_discrete_jobs wdj
  on we.wip_entity_id = wdj.wip_entity_id
  and we.organization_id = wdj.organization_id
JOIN apps.wip_transactions wt 
  on we.wip_entity_id = wt.wip_entity_id 

JOIN 
(
apps.bom_calendar_dates bcal
JOIN apps.gl_periods fiscal
  ON bcal.calendar_date BETWEEN fiscal.start_date AND fiscal.end_date
  AND calendar_code = 'NSS' AND fiscal.period_set_name = 'BAE_FW'
)
  on wt.transaction_date >= bcal.calendar_date and wt.transaction_date < bcal.calendar_date + 1 

LEFT JOIN apps.wip_transaction_accounts wta
  on wt.transaction_id = wta.transaction_id
LEFT JOIN apps.fnd_lookup_values lu
  on wta.accounting_line_type = lu.lookup_code
  and lookup_type = 'CST_ACCOUNTING_LINE_TYPE'
LEFT JOIN apps.bom_resources br
  on wta.resource_id = br.resource_id

WHERE 
we.organization_id = 1213
and br.resource_code = 'ConvOH'
and lu.meaning = 'WIP valuation'
--and wt.transaction_date >= TRUNC(sysdate /*- 365*/, 'YYYY') -- truncates to the first day of the year: 01-JAN-YYYY
and wt.transaction_date >= TRUNC(sysdate - 365, 'YYYY') -- truncates to the first day of the year: 01-JAN-YYYY