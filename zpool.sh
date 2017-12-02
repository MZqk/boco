#!/bin/bash
#source ~/.cshrc

temporary="`date +%N`.sh"
touch $temporary
#echo "source ~/.cshrc" > $temporary

being()
{
	test -e $temporary && echo "正在运行脚本内容为：";cat $temporary || echo "参数有误，请重新输入"
}
state()
{
	if [ $? -eq 0 ] ;then
		echo "脚本已成功添加，请使用jobs命令查看后台运行脚本数"
	else
		echo "脚本未能生成，请确认参数是否输入正确"
	fi
}

resources()
{
	read -p "请输入需要汇总的资源表名： " tbl_name 
 	echo "==============================================================================="
 	echo "+正在汇总资源$tbl_name表至历史表中"
 	echo "==============================================================================="
for tables in $tbl_name
do
	echo "perl /opt/BOCO.NPM/DB/snap/sync_parcm.pl -t $tables">> $temporary
done 
being 
nohup sh $temporary &
}

performance(){
 	echo "正在汇总性能数据至历史表中"

}

 gsm()
 {
	read -p "请输入需要补总GSM性能的时间： " gsm_hours 
 	echo "==============================================================================="
 	echo "+正在汇总GSM性能数据至历史表中"
 	echo "==============================================================================="
 daydate=`date +%Y-%m-%d`
#cfg为配置文件变量
cfg1=tpd_sts_cell_ne_jx.cfg
cfg2=tpd_sts_cell_egprs_jx.cfg
cfg3=tpd_sts_cell_gprs_jx.cfg

for hour in $gsm_hours
do
	for cfg in $cfg1 $cfg2 $cfg3
    do
    	echo "perl /opt/BOCO.NPM/DB/ReportSum/bin/tpa_cell_sum_nk_jx.pl -e '$daydate ${hour}:59:59' -c $cfg -u 0 -s '$daydate ${hour}:00:00'" >> $temporary
	done
done
being 
#nohup sh $temporary &
echo '\n'
state
}


td(){
 	echo "正在汇总TD性能数据至历史表中"
}


 lte()
 {
	read -p "请输入需要补总LTE性能的时间： " lte_hours 
 	echo "==============================================================================="
 	echo "+正在汇总LTE性能数据至历史表中"
 	echo "==============================================================================="
 	daytime=`date +%Y-%m-%d`
 	for hour in $lte_hours
 	do
 		echo "perl /opt/BOCO.NPM/DB/ReportSum/bin/Tpa_eutrancell_hour_sum.pl -c Tpa_eutrancell.cfg -s '$daytime ${hour}:00:00' -e '$daytime ${hour}:59:59'" >> $temporary
 		echo "perl /opt/BOCO.NPM/DB/ReportSum/bin/Tpa_lte_hour_ne.pl -c Tpa_eutr_prb_yunnan.cfg -s '$daytime ${hour}:00:00' -e '$daytime ${hour}:59:59'">> $temporary
 		echo "perl /opt/BOCO.NPM/DB/ReportSum/bin/Tpa_lte_hour_sum.pl -c Tpa_eutr_prb_yunnan.cfg -s '$daytime ${hour}:00:00' -e '$daytime ${hour}:59:59'" >> $temporary
 		echo '\n' >> $temporary
 	done
being 
#nohup sh $temporary &
echo '\n'
state
}

zpoolhelp()
{
	echo " -t 参数为汇总资源表（参数表）\n -G 参数为汇总GSM性能数据 \n \
-L 参数为汇总LTE性能数据 \n -T 参数
	"
}
case $1 in
	"-G")
	gsm
	;;
	"-T")
	td
	;;
	"-L")
	lte
	;;
	"-t")
	resources
	;;
	"-p")
	;;
	"-h")
	zpoolhelp
	;;
	*)
	echo "参数错误 请输入如下参数： -t -p -G -T -L "
esac

rm -f $temporary
echo '\n'