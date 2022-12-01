#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "jkuyumcu/06235647@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
CREATE VIEW movie_tier_bronze AS
SELECT title, release_date, review_score, price
FROM movie
WHERE subscription_tier = 'Bronze'
WITH READ ONLY;

CREATE VIEW movie_tier_silver AS
(SELECT title, release_date, review_score, price
FROM movie
WHERE subscription_tier = 'Bronze'
OR subscription_tier = 'Silver')
WITH READ ONLY;

CREATE VIEW movie_tier_gold AS
(SELECT title, release_date, review_score, price
FROM movie
WHERE subscription_tier = 'Bronze'
OR subscription_tier = 'Silver'
OR subscription_tier = 'Gold')
WITH READ ONLY;
exit;
EOF
