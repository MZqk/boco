#!/bin/csh
#归一化参数汇总

source ~/.cshrc
#汇总当天的天粒度
#脚本运行方式为直接运行，不需要添加参数

daytime="`date "+%Y-%m-%d"`"
perl $DB_PATH/ReportSum/bin/eutrancell_tpa_par_lte_sum.pl -c eutrancell_tpa_par_lte_sum.cfg -u 1  -s "$daytime 00:00:00"   -e "$daytime 23:59:59" >> foa_eutrancell.sh.log