#采集数据正常后需重新做快照
source ~/.cshrc
#++++脚本运行格式++++
#sh resource.sh tbl_name
#脚本后tbl_name为所需重做的快照名

tbl_name=$1

perl /opt/BOCO.NPM/DB/snap/sync_parcm.pl -t "$tbl_name" >> resource.sh.log

#昨日数据缺失使用一下语句重新做快照
# perl /opt/BOCO.NPM/DB/snap/sync_parcm.pl -t "$tbl_name" -s "2017-02-19 00:00:00" -e "2017-02-20 00:00:00"
