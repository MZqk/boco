--共有参数

select omc_id,time_stamp,count(*) from enodeb group by omc_id,time_stamp
union all
select omc_id,time_stamp,count(*) from eutrancell group by omc_id,time_stamp
union all
select omc_id,time_stamp,count(*) from eutrancell_para1 group by omc_id,time_stamp
union all
select omc_id,time_stamp,count(*) from eutrancell_para2 group by omc_id,time_stamp
union all
select omc_id,time_stamp,count(*) from eutranrelationtdd  group by omc_id,time_stamp
union all
select omc_id,time_stamp,count(*) from utranrelationtdd  group by omc_id,time_stamp
union all
select omc_id,time_stamp,count(*) from gsmrelationtdd  group by omc_id,time_stamp
union all
select omc_id,time_stamp,count(*) from managedelement  group by omc_id,time_stamp
union all
select omc_id,time_stamp,count(*) from cell group by omc_id,time_stamp;

--总数在80000以上
select count(*) from cell;
--时间更新都为当天
select update_stamp,omc_id,count(*) from cell group by update_stamp,omc_id;
--诺基亚、中兴更新时间为当天，华为为前一天晚上
select time_stamp,omc_id,count(*) from cell group by time_stamp,omc_id;
--null需为0
select count(*) from cell  where city_id is null;
