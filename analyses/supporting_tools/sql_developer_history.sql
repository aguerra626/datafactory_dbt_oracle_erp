select * from sys.all_tables where lower(table_name) like 'bae_context301_%';

select * from bae.bae_context301_config_header;

select * from apps.mtl_item_status_tl;

select msib.inventory_item_status_code, mis.description, count(*) 
from apps.mtl_system_items_b msib join apps.mtl_item_status_tl mis
on msib.inventory_item_status_code = mis.inventory_item_status_code
where organization_id = 1213
group by msib.inventory_item_status_code, mis.description
order by 2 desc;