SELECT
  inventory_item_id wro_inventory_item_id,
  organization_id wro_organization_id,
  wip_entity_id wro_wip_entity_id,
  operation_seq_num wro_operation_seq_num,
  last_update_date wro_last_update_date,
  last_updated_by wro_last_updated_by,
  creation_date wro_creation_date,
  created_by wro_created_by,
  department_id wro_department_id,
  wip_supply_type wro_wip_supply_type,
  date_required wro_date_required,
  required_quantity wro_required_quantity,
  quantity_issued wro_quantity_issued,
  quantity_per_assembly wro_quantity_per_assembly,
  supply_subinventory wro_supply_subinventory,
  supply_locator_id wro_supply_locator_id,
  mrp_net_flag wro_mrp_net_flag,
  mps_required_quantity wro_mps_required_quantity,
  mps_date_required wro_mps_date_required,
  quantity_allocated wro_quantity_allocated,
  quantity_backordered wro_quantity_backordered,
  quantity_relieved wro_quantity_relieved,
  released_quantity wro_released_quantity,
  suggested_vendor_name wro_suggested_vendor_name,
  vendor_id wro_vendor_id,
  primary_component_id wro_primary_component_id,
  component_sequence_id wro_component_sequence_id,
  component_yield_factor wro_component_yield_factor
FROM
  {{ source(
    'wip',
    'wip_requirement_operations'
  ) }}
WHERE
  organization_id = 1213