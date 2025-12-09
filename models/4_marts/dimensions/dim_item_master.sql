-- dimension grain: one row per inventory item id per organization id
-- Column ordering: Surrogate Keys, Business/Natural Keys, major descriptive attribute (highest cardinality), Date Attributes (the when), Hierarchical attributes (lower cardinality)
select
standard_hash(base.msib_inventory_item_id || base.msib_organization_id, 'MD5') item_master_sk,
msib_inventory_item_id,
msib_organization_id,
msib_segment1 AS "Part Number",
msib_description AS "Part Description",
mp_description  AS "Planner",
program_name AS "Program",
is_plus_tl AS "Plus TL Flag",
msib_inventory_item_status_code AS "Item Status",
purchasing_commodity_code AS "Purchasing Commodity Code",
mp_planner_code AS "Planner Code",
msib_full_lead_time AS "Full Lead Time",
msib_planning_make_buy_code AS "Make Buy Code",
msib_end_assembly_pegging_flag AS "End Assy Pegging Flag"
from {{ ref('int_item_program_details') }} base