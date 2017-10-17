--LTE¹¤²ÎÈ±Ê§Êý
select count(*) from eutrancell 
 left join tco_pro_eutrancell on eutrancell.int_id=tco_pro_eutrancell.int_id
 union all 
 select count(*) from eutrancell 
 left join tco_pro_eutrancell on eutrancell.int_id=tco_pro_eutrancell.int_id
 where tco_pro_eutrancell.EQUIPMENT_MODEL is not null
 union all
 --where tco_pro_eutrancell.EQUIPMENT_TYPE is not null
 --where tco_pro_eutrancell.DISTRIBUTEORINTEGRATE is not null
 select count(*) from eutrancell 
 left join tco_pro_eutrancell on eutrancell.int_id=tco_pro_eutrancell.int_id
 where tco_pro_eutrancell.EUTRAN_ROOM_ID is not null
 union all
 select count(*) from eutrancell 
 left join tco_pro_eutrancell on eutrancell.int_id=tco_pro_eutrancell.int_id
 where tco_pro_eutrancell.ENODEB_ROOM_ID is not null
