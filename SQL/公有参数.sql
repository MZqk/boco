--���в���

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

--������80000����
select count(*) from cell;
--ʱ����¶�Ϊ����
select update_stamp,omc_id,count(*) from cell group by update_stamp,omc_id;
--ŵ���ǡ����˸���ʱ��Ϊ���죬��ΪΪǰһ������
select time_stamp,omc_id,count(*) from cell group by time_stamp,omc_id;
--null��Ϊ0
select count(*) from cell  where city_id is null;
