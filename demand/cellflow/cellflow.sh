#!/bin/ksh
. /etc/profile
. $HOME/.profile

cd /home/oracle/zqk/cellflow

putfile="aaa.csv"

sqlplus  niosdb/Niosoptr@jxwydb <<EOF
@/home/oracle/zqk/cellflow/cellflow.sql
EOF

sed '1i\
ʱ�䣨Сʱ��),ECGI,CELLNAME,��������,��������' $putfile>tmp.file


putfile="cellflow0515.csv"

cp tmp.file $putfile

rm tmp.file

rm aaa.csv

