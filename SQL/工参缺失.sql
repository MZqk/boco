
/*GSM工参缺失*/
create table tmp_sunhui1 nologging as
SELECT TCC_CELL.INT_ID AS INT_ID,
TCC_CELL.SCAN_START_TIME AS SCAN_START_TIME ,300 AS NE_TYPE, 1 AS SUM_LEVEL,
TCC_CELL.TRX_NUMBER_1800 AS C1,TCC_CELL.TRX_NUMBER_900 AS C2,
(CASE TCC_CELL_PARA_4C3Z.AMR_SUPPORT when 1 then '是' when 0 then '否' else '' end) AS C3,
TCC_CELL.BCC AS C4,TCC_CELL.BCCH_FEQ AS C5,TCC_CELL.CGI AS C6,
TCC_CELL.CI AS C7,TCC_CELL.STATIC_GPRS_NBR AS C8,
(CASE TCC_CELL_PARA_4C3Z.DL_CONTROL_SUPPORT when 1 then '是' when 0 then '否' else '否' end) AS C9,(CASE TCC_CELL_PARA_4C3Z.IRC_SUPPORT when 1 then '是' when 0 then '否' else '' end) AS C10,TCC_CELL.LAC AS C11,
(CASE TCC_CELL_PARA_4C3Z.CCCH_SUPPORT when 1 then '是' when 0 then '否' else '' end) AS C12,TCC_CELL.NCC AS C13,TCC_CELL.STATIC_PDCH_NBR AS C14,
TCC_CELL.SDCCH_NUM AS C15,TCC_CELL.TCH_FRQ_LIST AS C16,TCC_CELL.TCH_NUM AS C17,
TCC_CELL_PARA_4C3Z.EDGE_TRX AS C18,(CASE TCC_CELL_PARA_4C3Z.UNION_PAGING_SUPPORT when 1 then '是' when 0 then '否' else '' end) AS C19,
TCC_CELL.ADJ_NUM AS C20,NVL(TCC_CELL.ADJ_TD_NUM,0) AS C21,(CASE TCC_CELL.VENDOR_ID when 0 then '阿尔卡特' when 1 then '爱立信' when 3 then '摩托罗拉' when 4 then '诺基亚' when 5 then '北电' when 6 then '西门子' when 7 then '中兴' when 8 then '华为' else '' end) AS C22,
TCC_CELL.BSC_NAME AS C23,TCC_CELL.BTS_NAME AS C24,TCC_CELL.MSC_NAME AS C25,
(CASE TCC_CELL.SYS_TYPE when 0 then '800M' when 1 then '900M' when 2 then '1800M' when 3 then '1900M' when 4 then '900/1800M'  else '' end) AS C26,TCC_CELL.IMAP_HOPTYPE AS C27,TCC_CELL.NAME AS C28,TCC_CELL.ZH_NAME AS C29,TCC_CELL.TRX_NUMBER AS C30,CASE TCC_TCO_PRO_CELL.IsEGPRS when 0 then '否' when 1 then '是' else '' end AS C31,
TCC_TCO_PRO_CELL.CCCH_NUM AS C32,TCC_TCO_PRO_CELL.DYNAMIC_GPRS_NBR AS C33,REGION_CITY.REGION_NAME AS C34,ROUND(TCC_TCO_PRO_CELL.POWER,6) AS C35,TCC_TCO_PRO_CELL.INDOOR_SUPPORT AS C36,ROUND(TCC_TCO_PRO_CELL.LONGITUDE,6) AS C37,ROUND(TCC_TCO_PRO_CELL.LATITUDE,6) AS C38,
CASE TCC_TCO_PRO_CELL.in_TD_coverage when 0 then '不在TD覆盖区内' when 1 then '在TD覆盖区内'  else '' end AS C39,
TCC_TCO_PRO_CELL.DT_GRID AS C40,ROUND(TCC_TCO_PRO_CELL.ANT_HEIGHT,6) AS C41,TCC_TCO_PRO_CELL.DT_REGION_TYPE AS C42,
ROUND(ROUND(TCC_TCO_PRO_CELL.DOWNTILT,0),6) AS C43,ROUND(TCC_TCO_PRO_CELL.DIR,6) AS C44,REGION_CITY.CITY_NAME AS C45
FROM  TCC_CELL
left join TCC_CELL_PARA_4C3Z 
on TCC_CELL_PARA_4C3Z.int_id=TCC_CELL.int_id
left join REGION_CITY on TCC_CELL.CITY_ID = REGION_CITY.CITY_ID
left join  TCC_TCO_PRO_CELL
on TCC_TCO_PRO_CELL.int_id=TCC_CELL.int_id
where 1=1 AND TCC_CELL.SCAN_START_TIME IN TRUNC(sysdate,'DD') 
AND TCC_CELL_PARA_4C3Z.SCAN_START_TIME IN TRUNC(sysdate,'DD') 
AND TCC_TCO_PRO_CELL.SCAN_START_TIME IN TRUNC(sysdate,'DD');
create table tmp_sunhui2 nologging as
select c34 REGION_NAME,count(int_id) as C_num,                                     
sum(case when 
C1 
  is null or 
C1   
 ='' then 1 else 0 end) as
C1 , 
sum(case when 
C2 
  is null or 
C2   
 ='' then 1 else 0 end) as
C2 , 
sum(case when 
C3 
  is null or 
C3   
 ='' then 1 else 0 end) as
C3 , 
sum(case when 
C4 
  is null or 
C4   
 ='' then 1 else 0 end) as
C4 , 
sum(case when 
C5 
  is null or 
C5   
 ='' then 1 else 0 end) as
C5 , 
sum(case when 
C6 
  is null or 
C6   
 ='' then 1 else 0 end) as
C6 , 
sum(case when 
C7 
  is null or 
C7   
 ='' then 1 else 0 end) as
C7 , 
sum(case when 
C8 
  is null or 
C8   
 ='' then 1 else 0 end) as
C8 , 
sum(case when 
C9 
  is null or 
C9   
 ='' then 1 else 0 end) as
C9 , 
sum(case when 
C10
  is null or 
C10  
 ='' then 1 else 0 end) as
C10, 
sum(case when 
C11
  is null or 
C11  
 ='' then 1 else 0 end) as
C11, 
sum(case when 
C12
  is null or 
C12  
 ='' then 1 else 0 end) as
C12, 
sum(case when 
C13
  is null or 
C13  
 ='' then 1 else 0 end) as
C13, 
sum(case when 
C14
  is null or 
C14  
 ='' then 1 else 0 end) as
C14, 
sum(case when 
C15
  is null or 
C15  
 ='' then 1 else 0 end) as
C15, 
sum(case when 
C16
  is null or 
C16  
 ='' then 1 else 0 end) as
C16, 
sum(case when 
C17
  is null or 
C17  
 ='' then 1 else 0 end) as
C17, 
sum(case when 
C18
  is null or 
C18  
 ='' then 1 else 0 end) as
C18, 
sum(case when 
C19
  is null or 
C19  
 ='' then 1 else 0 end) as
C19, 
sum(case when 
C20
  is null or 
C20  
 ='' then 1 else 0 end) as
C20, 
sum(case when 
C21
  is null or 
C21  
 ='' then 1 else 0 end) as
C21, 
sum(case when 
C22
  is null or 
C22  
 ='' then 1 else 0 end) as
C22, 
sum(case when 
C23
  is null or 
C23  
 ='' then 1 else 0 end) as
C23, 
sum(case when 
C24
  is null or 
C24  
 ='' then 1 else 0 end) as
C24, 
sum(case when 
C25
  is null or 
C25  
 ='' then 1 else 0 end) as
C25, 
sum(case when 
C26
  is null or 
C26  
 ='' then 1 else 0 end) as
C26, 
sum(case when 
C27
  is null or 
C27  
 ='' then 1 else 0 end) as
C27, 
sum(case when 
C28
  is null or 
C28  
 ='' then 1 else 0 end) as
C28, 
sum(case when 
C29
  is null or 
C29  
 ='' then 1 else 0 end) as
C29, 
sum(case when 
C30
  is null or 
C30  
 ='' then 1 else 0 end) as
C30, 
sum(case when 
C31
  is null or 
C31  
 ='' then 1 else 0 end) as
C31, 
sum(case when 
C32
  is null or 
C32  
 ='' then 1 else 0 end) as
C32, 
sum(case when 
C33
  is null or 
C33  
 ='' then 1 else 0 end) as
C33, 
sum(case when 
C34
  is null or 
C34  
 ='' then 1 else 0 end) as
C34, 
sum(case when 
C35
  is null or 
C35  
 ='' then 1 else 0 end) as
C35, 
sum(case when 
C36
  is null or 
C36  
 ='' then 1 else 0 end) as
C36, 
sum(case when 
C37
  is null or 
C37  
 ='' then 1 else 0 end) as
C37, 
sum(case when 
C38
  is null or 
C38  
 ='' then 1 else 0 end) as
C38, 
sum(case when 
C39
  is null or 
C39  
 ='' then 1 else 0 end) as
C39, 
sum(case when 
C40
  is null or 
C40  
 ='' then 1 else 0 end) as
C40, 
sum(case when 
C41
  is null or 
C41  
 ='' then 1 else 0 end) as
C41, 
sum(case when 
C42
  is null or 
C42  
 ='' then 1 else 0 end) as
C42, 
sum(case when 
C43
  is null or 
C43  
 ='' then 1 else 0 end) as
C43, 
sum(case when 
C44
  is null or 
C44  
 ='' then 1 else 0 end) as
C44, 
sum(case when 
C45
  is null or 
C45     ='' then 1 else 0 end) as
C45  
from tmp_sunhui1
group by c34;
select a.REGION_NAME,a.C_num,a.C1,a.C2,a.C3,a.C4,a.C5,a.C6,a.C7,a.C8,a.C9,a.C10,a.C11,a.C12,a.C13,a.C14,a.C15,a.C16,a.C17,a.C18,a.C19,a.C20,a.C21,a.C22,a.C23,a.C24,a.C25,a.C26,
a.C27,a.C28,a.C29,a.C30,a.C31,a.C32,a.C33,a.C34,a.C35,a.C36,a.C37,a.C38,a.C39,a.C40,a.C41,a.C42,a.C43,a.C44,a.C45
from tmp_sunhui2 a 
left join region_order b on a.region_name=b.region_name
order by nvl(b.ordernum,13);
drop table tmp_sunhui1;
drop table tmp_sunhui2;



