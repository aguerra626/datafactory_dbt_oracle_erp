  SELECT
    costs.organization_id,
    costs.item,
    costs.description,
    costs.job,
    costs.last_update_date,
    costs.date_comp,
    costs.date_close,
    costs.status,
    costs.type,
    costs.wip_class,
    costs.program,
    costs.cur_material_var,
    costs.cur_moh_var,
    costs.cur_resource_var,
    costs.cur_osp_var,
    costs.cur_overhead_var,
    costs.cur_shop_cost_var,
    costs.material_in,
    costs.moh_in,
    costs.resource_in,
    costs.osp_in,
    costs.overhead_in,
    costs.shop_cost_in,
    costs.material_out,
    costs.moh_out,
    costs.resource_out, costs.osp_out,
    costs.overhead_out,
    costs.shop_cost_out,
    costs.mtl_var_rlvd,
    costs.mtl_ovhd_var_rlvd,
    costs.res_var_rlvd,
    costs.osp_var_rlvd,
    costs.ovhd_var_rlvd,
    costs.shop_cost_var_rlvd,
    costs.material_var_orig,
    costs.moh_var_orig,
    costs.resource_var_orig,
    costs.osp_var_orig,
    costs.overhead_var_orig,
    costs.shop_cost_var_orig,
    costs.quantity_completed,
    costs.quantity_scrapped,
    prog.org,
    prog.planner_code,
    NVL(prog.last_name,' ') last_name,
    prog.shop,
    prog.shop_program,
	costs.scheduled_completion_date,
	costs.date_released, 
	costs.due_date 
FROM
    (
        SELECT
            we.organization_id,
            msi.segment1         item,
            msi.description      description,
            msi.planner_code,
            we.wip_entity_name   job
                                       --,to_char(WDJ.LAST_UPDATE_DATE, 'yy-MON-dd') DATE_LAST_MOVED
            ,
            trunc(wdj.last_update_date) last_update_date,        --added
            trunc(wdj.date_completed) date_comp,
            trunc(wdj.date_closed) date_close,
            trunc(wdj.date_released) date_released, 
            trunc(wdj.due_date) due_date, 
            DECODE(wdj.status_type, '1', 'UNREL', '3', 'REL', '4', 'CMPT', '5', 'CMPT_No_Chg', '7', 'CNCLD', '12', 'CLSD', '14', 'PEND_CLOSE', '15', 'FAILED_CLOSE', 'OTHER-'  || wdj.status_type) status, -- decode  changed from ' ' to 'Other'
            DECODE(wdj.job_type, '1', 'STD', '3', 'NONSTD', ' ') type,
            wdj.class_code       wip_class,
            mcb.segment1         program,
            wdj.quantity_completed,
            wdj.quantity_scrapped,   
			wdj.scheduled_completion_date scheduled_completion_date			,
            --variance not yet cleared
            SUM(nvl(wpb.pl_material_in, 0) -(nvl(wpb.tl_material_out, 0) + nvl(wpb.pl_material_out, 0) + nvl(wpb.tl_material_var,
            0) + nvl(wpb.pl_material_var, 0)
            --'_var' columns are the amounts that were relieved
            )) cur_material_var,
            SUM(nvl(wpb.pl_material_overhead_in, 0) -(nvl(wpb.tl_material_overhead_out, 0) + nvl(wpb.pl_material_overhead_out, 0)
            + nvl(wpb.tl_material_overhead_var, 0) + nvl(wpb.pl_material_overhead_var, 0))) cur_moh_var,
            SUM(nvl(wpb.tl_resource_in, 0) + nvl(wpb.pl_resource_in, 0) -(nvl(wpb.tl_resource_out, 0) + nvl(wpb.pl_resource_out, 0
            ) + nvl(wpb.tl_resource_var, 0) + nvl(wpb.pl_resource_var, 0))) cur_resource_var,
            SUM(nvl(wpb.tl_outside_processing_in, 0) + nvl(wpb.pl_outside_processing_in, 0) -(nvl(wpb.tl_outside_processing_out, 0
            ) + nvl(wpb.pl_outside_processing_out, 0) + nvl(wpb.tl_outside_processing_var, 0) + nvl(wpb.pl_outside_processing_var
            , 0))) cur_osp_var,
            SUM(nvl(wpb.tl_overhead_in, 0) + nvl(wpb.pl_overhead_in, 0) -(nvl(wpb.tl_overhead_out, 0) + nvl(wpb.pl_overhead_out, 0
            ) + nvl(wpb.tl_overhead_var, 0) + nvl(wpb.pl_overhead_var, 0))) cur_overhead_var,
            
            ( SUM(nvl(wpb.pl_material_in, 0) -(nvl(wpb.tl_material_out, 0) + nvl(wpb.pl_material_out, 0) + nvl(wpb.tl_material_var
            , 0) + nvl(wpb.pl_material_var, 0))) + SUM(nvl(wpb.pl_material_overhead_in, 0) -(nvl(wpb.tl_material_overhead_out, 0)
            + nvl(wpb.pl_material_overhead_out, 0) + nvl(wpb.tl_material_overhead_var, 0) + nvl(wpb.pl_material_overhead_var, 0))
            ) + SUM(nvl(wpb.tl_resource_in, 0) + nvl(wpb.pl_resource_in, 0) -(nvl(wpb.tl_resource_out, 0) + nvl(wpb.pl_resource_out
            , 0) + nvl(wpb.tl_resource_var, 0) + nvl(wpb.pl_resource_var, 0))) + SUM(nvl(wpb.tl_outside_processing_in, 0) + nvl(wpb
            .pl_outside_processing_in, 0) -(nvl(wpb.tl_outside_processing_out, 0) + nvl(wpb.pl_outside_processing_out, 0) + nvl(wpb
            .tl_outside_processing_var, 0) + nvl(wpb.pl_outside_processing_var, 0))) + SUM(nvl(wpb.tl_overhead_in, 0) + nvl(wpb.pl_overhead_in
            , 0) -(nvl(wpb.tl_overhead_out, 0) + nvl(wpb.pl_overhead_out, 0) + nvl(wpb.tl_overhead_var, 0) + nvl(wpb.pl_overhead_var
            , 0))) ) cur_shop_cost_var,
            --Costs In - total charges to job (including costs not liquidated ie. variance)
            SUM(nvl(wpb.pl_material_in, 0)) material_in,
            SUM(nvl(wpb.pl_material_overhead_in, 0)) moh_in,
            SUM(nvl(wpb.tl_resource_in, 0) + nvl(wpb.pl_resource_in, 0)) resource_in,
            SUM(nvl(wpb.tl_outside_processing_in, 0) + nvl(wpb.pl_outside_processing_in, 0)) osp_in,
            SUM(nvl(wpb.tl_overhead_in, 0) + nvl(wpb.pl_overhead_in, 0)) overhead_in,
            ( SUM(nvl(wpb.pl_material_in, 0)) + SUM(nvl(wpb.pl_material_overhead_in, 0)) + SUM(nvl(wpb.tl_resource_in, 0) + nvl(wpb
            .pl_resource_in, 0)) + SUM(nvl(wpb.tl_outside_processing_in, 0) + nvl(wpb.pl_outside_processing_in, 0)) + SUM(nvl(wpb
            .tl_overhead_in, 0) + nvl(wpb.pl_overhead_in, 0)) ) shop_cost_in,                 
            --Costs Out - cost liquidated upon job completion
            SUM(nvl(wpb.tl_material_out, 0) + nvl(wpb.pl_material_out, 0)) material_out,
            SUM(nvl(wpb.tl_material_overhead_out, 0) + nvl(wpb.pl_material_overhead_out, 0)) moh_out,
            SUM(nvl(wpb.tl_resource_out, 0) + nvl(wpb.pl_resource_out, 0)) resource_out,
            SUM(nvl(wpb.tl_outside_processing_out, 0) + nvl(wpb.pl_outside_processing_out, 0)) osp_out,
            SUM(nvl(wpb.tl_overhead_out, 0) + nvl(wpb.pl_overhead_out, 0)) overhead_out,
            ( SUM(nvl(wpb.tl_material_out, 0) + nvl(wpb.pl_material_out, 0)) + SUM(nvl(wpb.tl_material_overhead_out, 0) + nvl(wpb
            .pl_material_overhead_out, 0)) + SUM(nvl(wpb.tl_resource_out, 0) + nvl(wpb.pl_resource_out, 0)) + SUM(nvl(wpb.tl_outside_processing_out
            , 0) + nvl(wpb.pl_outside_processing_out, 0)) + SUM(nvl(wpb.tl_overhead_out, 0) + nvl(wpb.pl_overhead_out, 0)) ) shop_cost_out          ,                 
            --Original variance
            SUM(nvl(wpb.pl_material_in, 0) -(nvl(wpb.tl_material_out, 0) + nvl(wpb.pl_material_out, 0))) material_var_orig,
            SUM(nvl(wpb.pl_material_overhead_in, 0) -(nvl(wpb.tl_material_overhead_out, 0) + nvl(wpb.pl_material_overhead_out, 0)
            )) moh_var_orig,
            SUM(nvl(wpb.tl_resource_in, 0) + nvl(wpb.pl_resource_in, 0) -(nvl(wpb.tl_resource_out, 0) + nvl(wpb.pl_resource_out, 0
            ))) resource_var_orig,
            SUM(nvl(wpb.tl_outside_processing_in, 0) + nvl(wpb.pl_outside_processing_in, 0) -(nvl(wpb.tl_outside_processing_out, 0
            ) + nvl(wpb.pl_outside_processing_out, 0))) osp_var_orig,
            SUM(nvl(wpb.tl_overhead_in, 0) + nvl(wpb.pl_overhead_in, 0) -(nvl(wpb.tl_overhead_out, 0) + nvl(wpb.pl_overhead_out, 0
            ))) overhead_var_orig,
            ( SUM(nvl(wpb.pl_material_in, 0) -(nvl(wpb.tl_material_out, 0) + nvl(wpb.pl_material_out, 0))) + SUM(nvl(wpb.pl_material_overhead_in
            , 0) -(nvl(wpb.tl_material_overhead_out, 0) + nvl(wpb.pl_material_overhead_out, 0))) + SUM(nvl(wpb.tl_resource_in, 0)
            + nvl(wpb.pl_resource_in, 0) -(nvl(wpb.tl_resource_out, 0) + nvl(wpb.pl_resource_out, 0))) + SUM(nvl(wpb.tl_outside_processing_in
            , 0) + nvl(wpb.pl_outside_processing_in, 0) -(nvl(wpb.tl_outside_processing_out, 0) + nvl(wpb.pl_outside_processing_out
            , 0))) + SUM(nvl(wpb.tl_overhead_in, 0) + nvl(wpb.pl_overhead_in, 0) -(nvl(wpb.tl_overhead_out, 0) + nvl(wpb.pl_overhead_out
            , 0))) ) shop_cost_var_orig,                 
            --Variance relieved
            SUM(nvl(wpb.tl_material_var, 0) + nvl(wpb.pl_material_var, 0)) mtl_var_rlvd,
            SUM(nvl(wpb.tl_material_overhead_var, 0) + nvl(wpb.pl_material_overhead_var, 0)) mtl_ovhd_var_rlvd,
            SUM(nvl(wpb.tl_resource_var, 0) + nvl(wpb.pl_resource_var, 0)) res_var_rlvd,
            SUM(nvl(wpb.tl_outside_processing_var, 0) + nvl(wpb.pl_outside_processing_var, 0)) osp_var_rlvd,
            SUM(nvl(wpb.tl_overhead_var, 0) + nvl(wpb.pl_overhead_var, 0)) ovhd_var_rlvd,
            ( SUM(+ nvl(wpb.tl_material_var, 0) + nvl(wpb.pl_material_var, 0)) + SUM(+ nvl(wpb.tl_material_overhead_var, 0) + nvl
            (wpb.pl_material_overhead_var, 0)) ) + SUM(+ nvl(wpb.tl_resource_var, 0) + nvl(wpb.pl_resource_var, 0)) + SUM(+ nvl(wpb
            .tl_outside_processing_var, 0) + nvl(wpb.pl_outside_processing_var, 0)) + SUM(+ nvl(wpb.tl_overhead_var, 0) + nvl(wpb
            .pl_overhead_var, 0)) shop_cost_var_rlvd
        FROM
            wip_entities          we,
            wip_discrete_jobs     wdj,
            mtl_system_items_b    msi,
            wip_period_balances   wpb,
            mtl_item_categories   mic,
            mtl_categories_b      mcb
        WHERE
            we.wip_entity_id = wdj.wip_entity_id
            AND we.wip_entity_id = wpb.wip_entity_id
            AND we.primary_item_id = msi.inventory_item_id
            AND we.organization_id = msi.organization_id
            AND we.organization_id IN ( 1213,1273)
            AND msi.inventory_item_id = mic.inventory_item_id (+)
            AND msi.organization_id = mic.organization_id (+)
            AND mic.category_set_id (+) = '43'
            AND mic.category_id = mcb.category_id (+)
      --      AND trunc(wdj.date_completed) >= '01-JAN-2022'
      AND (  ( trunc(wdj.date_completed)  >=  :PAR_DATE_COMPLETED_START  or :PAR_DATE_COMPLETED_START IS NULL)
            and 
           ( trunc(wdj.date_completed)  <=  :PAR_DATE_COMPLETED_END or  :PAR_DATE_COMPLETED_END IS NULL)
           )
		AND (  ( trunc(wdj.date_closed)  >=  :PAR_DATE_CLOSED_START  or :PAR_DATE_CLOSED_END IS NULL)
            and 
           ( trunc(wdj.date_closed)  <=  :PAR_DATE_CLOSED_END or  :PAR_DATE_CLOSED_END IS NULL)
           )		   
        --AND TRUNC (wdj.last_update_date) between '20-DEC-2006' and '21-DEC-2006'
  --      AND trunc(wdj.last_update_date)  between :PAR_DATE_LAST_UPD_START and :PAR_DATE_LAST_UPD_END
          --and trunc(wdj.DATE_CLOSED) between '21-APR-2008' and '26-APR-2008'
           AND ( wdj.class_code   IN(:PAR_WIP_CLASS) or '<ALL>' IN  (:PAR_WIP_CLASS) ) --   wip_class,
        AND ( mcb.segment1    IN(:PAR_PROGRAM) or '<ALL>' IN  (:PAR_PROGRAM) ) --   program,
		AND (
		DECODE(wdj.status_type, '1', 'UNREL', '3', 'REL', '4', 'CMPT', '5', 'CMPT_No_Chg', '7', 'CNCLD', '12', 'CLSD', '14', 'PEND_CLOSE', '15', 'FAILED_CLOSE', 'OTHER')  IN (:PAR_STATUS) or '<ALL>' IN (:PAR_STATUS)
		)
        GROUP BY
            we.organization_id,
            msi.segment1,
            msi.description,
            msi.planner_code,
            we.wip_entity_name,
            trunc(wdj.last_update_date),
            trunc(wdj.date_completed),
            trunc(wdj.date_closed),
            trunc(wdj.date_released), 
            trunc(wdj.due_date), 
          DECODE(wdj.status_type, '1', 'UNREL', '3', 'REL', '4', 'CMPT', '5', 'CMPT_No_Chg', '7', 'CNCLD', '12', 'CLSD', '14', 'PEND_CLOSE', '15', 'FAILED_CLOSE', 'OTHER-'  || wdj.status_type) , -- decode  changed from ' ' to 'Other'
            DECODE(wdj.job_type, '1', 'STD', '3', 'NONSTD', ' ') ,
            wdj.class_code,
            mcb.segment1,
            wdj.quantity_completed,
            wdj.quantity_scrapped,
			wdj.scheduled_completion_date
    ) costs,
    (
        SELECT
            mp.organization_code   org,
            pl.organization_id     org_id,
            pl.planner_code,
            pl.electronic_mail_address,
            pl.description,
            p.last_name,
            pl.attribute1          program,
            pl.attribute2          shop,
            pl.attribute3          shop_program
        FROM
            mtl_planners       pl,
            mtl_parameters     mp,
            per_all_people_f   p
        WHERE
            mp.organization_id = pl.organization_id
             --and pl.organization_id IN ('168', '169', '172', '651')
            AND pl.employee_id = p.person_id (+)
          AND   (  p.last_name like upper(:PAR_LAST_NAME) or :PAR_LAST_NAME ='%')
         GROUP BY
            mp.organization_code,
            pl.organization_id,
            pl.planner_code,
            pl.electronic_mail_address,
            pl.description,
            p.last_name,
            pl.attribute1,
            pl.attribute2,
            pl.attribute3
    ) prog
WHERE
    costs.planner_code = prog.planner_code (+)
    AND costs.organization_id = prog.org_id (+)
       --and prog.shop = 'MISSION CONTROLS'
    AND   (  prog.last_name like upper(:PAR_LAST_NAME) or :PAR_LAST_NAME ='%')
ORDER BY
    job