select PUTINTO_TIME from tco_pro_site_phy
where PUTINTO_TIME is not null
select * from tco_pro_site_phy

create table tmp_zqk0613 ( name2g varchar(128),TIME2g date)
select * from tmp_zqk0613 for update

select a.zh_NAME,b.name2g,a.Putinto_Time,b.time2g from tco_pro_site_phy a,tmp_zqk0613 b
where a.zh_name=b.name2g
and a.zh_name like '%熊家港%'

select zh_name from tco_pro_site_phy
where zh_name like '%同田上峰%'

update tco_pro_site_phy
set PUTINTO_TIME = (select time2g
from tmp_zqk0613
where name2g = name
and name2g not in
(select name2g, count(*)
from tmp_zqk0613
group by name2g
having count(*) > 1))
where name in (select name2g from tmp_zqk0613)
and name not in (select name, count(*)
from tco_pro_site_phy
group by name
having count(*) > 0)

update tco_pro_site_phy a
set a.PUTINTO_TIME = (select b.time2g from tmp_zqk0613 b where a.zh_name = b.name2g)
where a.zh_name not in (
select b.name2g,count(*)
from tmp_zqk0613 b
group by b.name2g
having count(*) > 1  
)
