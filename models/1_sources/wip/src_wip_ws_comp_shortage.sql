SELECT
  organization_id,
  wip_entity_id,
  operation_seq_num,
  inventory_item_id,
  department_id,
  primary_uom_code,
  date_required,
  required_qty,
  quantity_issued,
  quantity_open,
  wip_supply_type,
  supply_subinvenotry,
  supply_locator_id,
  onhand_qty,
  proj_avail_qty,
  shortage_qty,
  last_update_date,
  last_updated_by,
  creation_date,
  created_by,
  last_update_login,
  request_id,
  program_application_id,
  program_id,
  object_version_number,
  program_run_date
FROM
  {{ source(
    'wip',
    'wip_ws_comp_shortage'
  ) }}
WHERE
  organization_id = 1213
