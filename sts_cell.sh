#!/bin/bash

#2G性能sts_cell汇总
source ~/.cshrc

#++++脚本运行方式++++
#sh sts_cell.sh 03 04 05
#脚本后数字参数为所需补采的时间点汇总

daydate=`date +%Y-%m-%d`
#cfg为配置文件变量
cfg1=tpd_sts_cell_ne_jx.cfg
cfg2=tpd_sts_cell_egprs_jx.cfg
cfg3=tpd_sts_cell_gprs_jx.cfg

for hour in $@;do
		for cfg in $cfg1 $cfg2 $cfg3;do
				perl /opt/BOCO.NPM/DB/ReportSum/bin/tpa_cell_sum_nk_jx.pl -e '$daydate ${hour}:59:59' -c $cfg -u 0 -s '$daydate ${hour}:00:00'
									done
			   done				

#原汇总语句
#perl /opt/BOCO.NPM/DB/ReportSum/bin/tpa_cell_sum_nk_jx.pl -e '2017-05-19 04:59:59'  -c tpd_sts_cell_ne_jx.cfg -u 0 -s '2017-05-19 04:00:00'
#perl /opt/BOCO.NPM/DB/ReportSum/bin/tpa_cell_sum_nk_jx.pl -e '2017-05-19 04:59:59'  -c tpd_sts_cell_egprs_jx.cfg -u 0 -s '2017-05-19 04:00:00'
#perl /opt/BOCO.NPM/DB/ReportSum/bin/tpa_cell_sum_nk_jx.pl -e '2017-05-19 04:59:59'  -c tpd_sts_cell_gprs_jx.cfg -u 0 -s '2017-05-19 04:00:00'