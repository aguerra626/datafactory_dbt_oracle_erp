SELECT
mp.description AS "Planner",
msib.segment1 AS "Part Number",
we.wip_entity_name AS "Job Number",
fmwop.operation_seq_num AS "Op Seq Num",
fmwop.description AS "Op Desc",
mso.segment1 AS "Sales Order",
oel.line_number AS "Line Number",
fmwop.quantity_in_queue AS "Op Qty in Queue",
fmwop.quantity_waiting_to_move AS "Op Qty To Move",
wdj.scheduled_start_date AS "Job Scheduled Start Date",
wdj.class_code AS "Job Class Code",
bd.department_code AS "Department",
wdj.primary_item_id "wdj_primary_item_id",
we.wip_entity_id "we_wip_entity_id",
standard_hash(wdj.wip_entity_id||wdj.organization_id||fmwop.operation_seq_num, 'MD5') as stg_wop_we_wdj_surrogate_key

FROM
  apps.wip_operations fmwop
  JOIN apps.wip_discrete_jobs wdj 
  ON fmwop.wip_entity_id = wdj.wip_entity_id
  AND fmwop.organization_id = wdj.organization_id
  AND wdj.status_type = 3 -- Released
  JOIN apps.wip_entities we 
  ON wdj.wip_entity_id = we.wip_entity_id
  AND wdj.organization_id = we.organization_id
  JOIN apps.mtl_system_items_b msib 
  ON wdj.primary_item_id = msib.inventory_item_id
  AND wdj.organization_id = msib.organization_id
  JOIN apps.mtl_planners mp 
  ON msib.planner_code = mp.planner_code
  AND msib.organization_id = mp.organization_id
  JOIN apps.bom_departments bd 
  ON fmwop.department_id = bd.department_id
  LEFT JOIN apps.mtl_reservations mr
  ON wdj.wip_entity_id = mr.supply_source_header_id
  AND mr.demand_source_type_id in (2, 8) -- Reservations for Sales Orders, Internal Order demand
  AND mr.supply_source_type_id = 5 -- Reservations for WIP Jobs
  LEFT JOIN apps.mtl_sales_orders mso 
  ON mr.demand_source_header_id = mso.sales_order_id
  LEFT JOIN apps.oe_order_lines_all oel
  ON mr.demand_source_line_id = oel.line_id
WHERE
  fmwop.organization_id = 1213
  AND wdj.class_code IN ('CONVERSION','NONSTD-PRJ','Production','REWORK','TECH MKTG','QLTYREWORK') -- exclude NSS- repair jobs
  AND wdj.scheduled_start_date >= sysdate - 720