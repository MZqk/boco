#!/bin/ksh
. /etc/profile
. $HOME/.profile

cd /home/oracle/jxwy/report/school

yesterday=`date +%Y%m%d`

putfile="aaa.csv"

sqlplus  niosdb/Niosoptr@jxwydb <<EOF
@/home/oracle/zqk/university.sql 

EOF

    
    sed '1i\
        时间（小时级),地市,CGI,上行流量(M),下行流量(M),上行PRB利用率,下行PRB利用率,有效RRC连接最大数,有效RRC连接平均数,RRC连接最大数,RRC连接平均数,E-RAB连接建立成功数' $putfile>tmp.file
        putfile="${yesterday}.csv"

        cp tmp.file $putfile

        rm tmp.file

        rm aaa.csv
