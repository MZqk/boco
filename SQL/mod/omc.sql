trx	HUAWEI_TRX	1	or_fndb_dbo_BSC6000R11GTRX_info a,or_itfndb_dbo_BSC6000R11NE_info b	b.Fdn =substring(a.Fdn,1,length(b.Fdn)) and a.ACTSTATUS='ACTIVATED'			MOIndex_0,MOIndex		0
A:
	select count(*) from itfndb.dbo.BSC6000R11GTRX a,itfndb.dbo.BSC6000R11NE b	
	where b.Fdn =substring(a.Fdn,1,len(b.Fdn)) 
	and a.ACTSTATUS='ACTIVATED'	
B:
select count(*)   from itfndb.dbo.BSC6900GSMGTRX a,itfndb.dbo.BSC6900GSMNE b	
where b.Fdn =substring(a.Fdn,1,len(b.Fdn)) 
and a.ACTSTATUS='ACTIVATED'


