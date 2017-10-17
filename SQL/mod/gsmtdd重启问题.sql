create table aaaa nologging as
select  int_id,count(*) num from gsmrelationtdd
group by int_id
having count(*)>1;

delete from gsmrelationtdd where int_id in (select int_id from aaaa);

drop table aaaa;
