--ÖØÃû
create table tmp_rename as 
select name,count(*)a from eutrancell
group by name
having count(*)>1;

select object_rdn,name,zh_name,omc_id,omc_id,cgi from eutrancell where name in (select name from tmp_rename);

select * from tmp_rename;

drop table tmp_rename;
