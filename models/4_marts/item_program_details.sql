select 
base.mcst_category_set_name,
base.mcst_description,
base.mc_segment1 AS "Program",
base.mc_segment2,
base.msib_inventory_item_id,
base.msib_segment1 AS "Part Number",
base.msib_end_assembly_pegging_flag AS "End Assy Pegging Flag",
base.msib_inventory_item_status_code AS "Item Status",
base.msib_planning_make_buy_code AS "Make Buy Code",
base.msib_full_lead_time AS "Full Lead Time",
base.mp_planner_code AS "Planner Code",
base.mp_description  AS "Planner"

FROM {{ ref('int_item_program_details') }} base
