/********************************************************************************
 * MIDAS Report  	: NSS Inventory Value Report 
 * Report Type 		: SSRS
 * SSRS Data Set   	: Data_For_Report
 * Database    		: USCEBSDG
 * Modification History:
 *-------------------------------------------------------------------------------
 *  ACR#/CR#   Date        By                       Remarks
 *-------------------------------------------------------------------------------
 *  1.0      06-JUL-2022   Bhupendra			SQL received from Jaya Talluru      
 *  1.1      13-SEP-2022   Bhupendra			 SQL received from Bob Ledwith  
 *  1.2      22-SEP-2022   Bhupendra			 SQL received from Bob Ledwith to add planner_code, planner
 *  1.3      26-SEP-2022   Bhupendra			Bob Ledwith changes inventory_item_id added
 *  1.4      26-JAN-2024    Ed Tye              added OSP_MRO to report and TOTAL_STD calculation
 *  1.5      23-APR-2024    Ed Tye              added parameter for cost type
 *  1.6      20-AUG-2024   Bhupendra         Bob Ledwith requested to add portfolio 
 *  1.7      04-DEC-2024    Ed Tye              chged std_update_date to use BOM_CST_ITEM_COSTS, with mod query from BL
 *-------------------------------------------------------------------------------
  Parameter	Value
PAR_THRU_DATE
	Through Date
		Transaction Date less than parameter or NULL 01-MAR-2022
PAR_ON_HAND_ONLY On Hand Only	
  'On-Hand Non Zero'  On Hand Qty  <> Zero             
  'On-Hand Zero Qty Only' ->  On Hand Qty = 0
  'All'
PAR_SUBINVENTORY	%
  ******************************************************************************/
--alter session set current_schema = apps; 
  select t1.*
  from 
  (
  SELECT 
    s.segment1 "item",
	s.description "item desc",
	l.meaning "item type",	--9/13/22
    cst.cost_type "cost type",			--9/13/22
    cst.shrinkage "shrinkage",
    DECODE(s.planning_make_buy_code, 1, 'Make', 'Buy') "make buy",
    s.inventory_item_status_code   "item status",
    q.subinventory_code            "subinventory",
    mcb.segment1                   "program",
     mcb2.segment2 "portfolio", -- 8/22/2024
    s.planner_code "planner code",
    person.planner "Planner",
    SUM(nvl(q.primary_transaction_quantity, 0)) "on hand qty",
    cst.material "material",
    cst.mro "mro",
    cst.conv_oh "conv oh",
    cst.osp "osp",
    cst.osp_mro "osp mro",
    cst.material + cst.mro + cst.conv_oh+ cst.osp + cst.osp_mro "total std",
    round((cst.material + cst.mro + cst.conv_oh + cst.osp + cst.osp_mro) * SUM(nvl(q.primary_transaction_quantity, 0)), 2) "total inv",
    round((cst.material) * SUM(nvl(q.primary_transaction_quantity, 0)), 2) "total mat",
	cst.inventory_item_id ,-- Added 9/25/22
     updates.last_std "Last Std Date" --Added 8/22/2024
FROM
    (
        SELECT
            cst1.inventory_item_id,
            cst1.organization_id,
            cst1.cost_type,
            cst1.shrinkage,
            SUM(cst1.material) material,
            SUM(cst1.mro) mro,
            SUM(cst1.conv_oh) conv_oh,
            SUM(cst1.osp) osp,
            SUM(cst1.osp_mro) osp_mro
        FROM
            (
                SELECT
                    c.inventory_item_id,
                    c.organization_id,
                    DECODE(c.cost_type_id, 1, 'Frozen', 3, 'Pending', 'History') cost_type,
                    round(c.net_yield_or_shrinkage_factor, 4) shrinkage,
                    CASE
                        WHEN c.cost_element_id = 1 THEN
                            c.item_cost
                        ELSE
                            0
                    END material,
                    CASE
                        WHEN c.cost_element_id = 2 THEN
                            c.item_cost
                        ELSE
                            0
                    END mro,
                    CASE
                        WHEN c.cost_element_id = 3 THEN
                            c.item_cost
                        ELSE
                            0
                    END conv_oh,
                    CASE
                        WHEN c.cost_element_id = 4 THEN
                            c.item_cost
                        ELSE
                            0
                    END osp,
                   CASE
                        WHEN c.cost_element_id = 5 THEN
                            c.item_cost
                        ELSE
                            0
                    END osp_mro
                FROM
                    cst_item_cost_details c
                WHERE
                    c.organization_id IN ( 1213,1273)
                    --AND c.cost_type_id in (:parCostTypeID) -- 1 = Frozen, 3 = Pending
            ) cst1
        GROUP BY
            cst1.inventory_item_id,
            cst1.organization_id,
            cst1.cost_type,
            cst1.shrinkage
    ) cst,
    (select
        pp.person_id,
        pp.last_name planner
        from
        per_all_people_f pp
        where
        trunc(sysdate) between pp.effective_start_date and pp.effective_end_date) person,

        ---- Added 8/22/2024, mod 12/5/24 ----
        (SELECT
    sc.inventory_item_id,
    MAX(sc.last_update_date) last_std
    FROM
        bom.cst_item_costs sc --cst_standard_costs sc bt changed to item_cost_details table as this table is not available.
    WHERE                    -- mod 12/4/24 to use BOM_CST_ITEM_COSTS GET, slight mod from Bob Ledwith
        sc.organization_id = 1213
        AND sc.cost_type_id = 1
        and sc.cost_update_id is not null
    GROUP BY
        sc.inventory_item_id

            ) updates,
        ----------------


     mtl_planners pl,
    mtl_system_items_b             s,
	fnd_lookup_values l,				--9/13/22
    mtl_onhand_quantities_detail   q,
    mtl_item_categories            mic,
    mtl_categories_b               mcb,
    mtl_item_categories mic2,
    mtl_categories_b mcb2

WHERE
    cst.organization_id = s.organization_id
-- and s.segment1 = '822-3198-002'
    AND cst.inventory_item_id = s.inventory_item_id
    AND q.organization_id (+) = s.organization_id
    AND q.inventory_item_id (+) = s.inventory_item_id
    --AND nvl(trunc(q.date_received(+)), :PAR_THRU_DATE) <= :PAR_THRU_DATE
    AND s.inventory_item_id = mic.inventory_item_id (+)
    AND s.organization_id = mic.organization_id (+)
    AND mic.category_set_id (+) = '43'
    AND mic.category_id = mcb.category_id (+)
    -------8/22/2024 portfolio related join ----
     and s.inventory_item_id = mic2.inventory_item_id(+)
     and s.organization_id = mic2.organization_id(+)
     and mic2.category_set_id(+) = '44'
     and mic2.category_id = mcb2.category_id(+)
    -------------------------------------------------------------
	and s.item_type = l.lookup_code  --9/13/22
	and l.lookup_type = 'ITEM_TYPE'  --9/13/22
    and s.organization_id = pl.organization_id(+)
    and s.planner_code = pl.planner_code(+)
    and pl.employee_id = person.person_id(+)

    --AND ( q.subinventory_code like upper (:PAR_SUBINVENTORY) or :PAR_SUBINVENTORY ='%')
        ---- Added 8/22/2024 ----  
    and s.inventory_item_id = updates.inventory_item_id(+)
GROUP BY
    s.segment1,
	s.description,
	l.meaning,
    cst.cost_type,
    cst.shrinkage,
    DECODE(s.planning_make_buy_code, 1, 'Make', 'Buy'),
    s.inventory_item_status_code,
    q.subinventory_code,
    s.planner_code,
    person.planner,
    mcb.segment1,
     mcb2.segment2,
    cst.material,
    cst.mro,
    cst.conv_oh,
    cst.osp,
    cst.osp_mro,
	cst.inventory_item_id,
     updates.last_std
    ) t1
    where 1=1
    --And (:PAR_ON_HAND_ONLY = 'On-Hand Non Zero' and on_hand_qty <> 0
    --or 
    --:PAR_ON_HAND_ONLY = 'On-Hand Zero Qty Only' and on_hand_qty =  0
	--or 
	--:PAR_ON_HAND_ONLY  = 'All'
    --) 
    --and t1.item = '005-3002-250'   
ORDER BY
    1,
    2