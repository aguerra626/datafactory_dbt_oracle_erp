select 
sn.serial_number
, sn.serial_status_code
, sn.wip_entity_name
, sn.item_number
, sn.item_description
, sn.creation_date
, sn.last_update_date
, sn.*
from apps.bae_context303_serial_numbers sn
where 1=1 
and sn.serial_number in
(
    '4YFNG2',
    '4YD1PY',
    '4YFHC8',
    '4TC25R',
    '4YF5N4',
    '4YDFYT',
    '4YDR1X',
    '4YDR4V',
    '4YDNKL',
    '4YDKYT',
    '4TCDMT',
    '4YFK3Y',
    '4YF7K8',
    '4YDGR0'
)