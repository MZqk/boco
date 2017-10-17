create table tmp_cellweidu as
select int_id,name from TCC_EUTRANCELL
where SCAN_START_TIME =to_date('2017-06-01 00:00:00', 'yyyy-mm-dd hh24:mi:ss');

create table tmp_cellweidu01 as
select int_id,name from TCC_EUTRANCELL
where SCAN_START_TIME = to_date('2017-07-01 00:00:00', 'yyyy-mm-dd hh24:mi:ss');

Create index index_int on tmp_cellweidu (int_id);
Create index index_int01 on tmp_cellweidu01 (int_id);

create table tmp_cellweidu02 as select *  from tmp_cellweidu01
where  not exists (select  1 from tmp_cellweidu a where a.int_id=tmp_cellweidu01.int_id);

select TCC_EUTRANCELL.NAME AS C1,
       TCC_EUTRANCELL.enodebid AS C2,
       TCC_EUTRANCELL.Cell_Identity AS C3,
       REGION_CITY.REGION_NAME AS C4,
       REGION_CITY.CITY_NAME AS C5,
       ROUND(TCC_TCO_PRO_EUTRANCELL.LONGITUDE, 6) AS C6,
       ROUND(TCC_TCO_PRO_EUTRANCELL.LATITUDE, 6) AS C7,
       (CASE TCC_EUTRANCELL.cell_type
         when 1 then
          'pico'
         when 0 then
          'femto'
         when 2 then
          'macro'
         else
          ''
       end) AS C8,
       (CASE TCC_TCO_PRO_EUTRANCELL.cover_type
         when 1 then
          ' “ƒ⁄'
         when 0 then
          ' “Õ‚'
         else
          ''
       end) AS C9,
       TCC_TCO_PRO_EUTRANCELL.SCENE_NAME_local AS C10,
       TCC_TCO_PRO_EUTRANCELL.SCENE_NAME AS C11,
       ROUND(TCC_TCO_PRO_EUTRANCELL.ANT_HEIGHT, 6) AS C12,
       TCC_TCO_PRO_EUTRANCELL.WORK_FRQBAND AS C13,
       TCC_TCO_PRO_EUTRANCELL.BEARING AS C14,
       TCC_TCO_PRO_EUTRANCELL.RETTILTVALUE AS C15
  from TCC_EUTRANCELL
  LEFT OUTER JOIN TCC_TCO_PRO_EUTRANCELL ON (TCC_TCO_PRO_EUTRANCELL.SCAN_START_TIME =
                                            to_date('2017-07-01 00:00:00', 'yyyy-mm-dd hh24:mi:ss') AND
                                            TRUNC(TO_DATE(TCC_EUTRANCELL.SCAN_START_TIME)) =
                                            TCC_TCO_PRO_EUTRANCELL.SCAN_START_TIME AND
                                            TCC_EUTRANCELL.INT_ID =
                                            TCC_TCO_PRO_EUTRANCELL.INT_ID)
  LEFT OUTER JOIN REGION_CITY ON (TCC_EUTRANCELL.CITY_ID =
                                 REGION_CITY.CITY_ID)
  left outer join tmp_cellweidu02 on (TCC_EUTRANCELL.name =
                                     tmp_cellweidu02.name and
                                     TCC_EUTRANCELL.Int_Id =
                                     tmp_cellweidu02.int_id)
 where TCC_EUTRANCELL.SCAN_START_TIME = to_date('2017-07-01 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
   and TCC_EUTRANCELL.int_id = tmp_cellweidu02.int_id;

drop table tmp_cellweidu;
drop table tmp_cellweidu01;
drop table tmp_cellweidu02;