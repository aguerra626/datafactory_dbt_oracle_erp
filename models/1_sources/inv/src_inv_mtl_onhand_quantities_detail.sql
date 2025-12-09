SELECT
  inventory_item_id AS moqd_inventory_item_id,
  organization_id AS moqd_organization_id,
  date_received AS moqd_date_received,
  last_update_date AS moqd_last_update_date,
  last_updated_by AS moqd_last_updated_by,
  creation_date AS moqd_creation_date,
  created_by AS moqd_created_by,
  last_update_login AS moqd_last_update_login,
  locator_id as moqd_locator_id,
  primary_transaction_quantity AS moqd_primary_transaction_quantity,
  subinventory_code AS moqd_subinventory_code,
  create_transaction_id AS moqd_create_transaction_id,
  update_transaction_id AS moqd_update_transaction_id,
  orig_date_received AS moqd_orig_date_received,
  cost_group_id AS moqd_cost_group_id,
  containerized_flag AS moqd_containerized_flag,
  onhand_quantities_id AS moqd_onhand_quantities_id,
  organization_type AS moqd_organization_type,
  owning_organization_id AS moqd_owning_organization_id,
  owning_tp_type AS moqd_owning_tp_type,
  planning_organization_id AS moqd_planning_organization_id,
  planning_tp_type AS moqd_planning_tp_type,
  transaction_uom_code AS moqd_transaction_uom_code,
  transaction_quantity AS moqd_transaction_quantity,
  is_consigned AS moqd_is_consigned
FROM
  {{ source(
    'inv',
    'mtl_onhand_quantities_detail'
  ) }}
WHERE
  organization_id = 1213
