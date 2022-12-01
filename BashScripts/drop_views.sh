#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "jkuyumcu/06235647@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
DROP VIEW movie_tier_bronze;
DROP VIEW movie_tier_silver;
DROP VIEW movie_tier_gold;
exit;
EOF
