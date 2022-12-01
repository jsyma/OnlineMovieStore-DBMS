#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "jkuyumcu/06235647@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
set lines 150
set pagesize 50000
set trimspool on
set trimout on
set tab off

COLUMN Name FORMAT a50
COLUMN Address FORMAT a50
COLUMN DOB FORMAT a10
(SELECT * FROM Customer)
MINUS 
(SELECT c.*
FROM customer c
WHERE c.address LIKE '%ON');

COLUMN Review_Description FORMAT a50
(SELECT m_id, review_description, score
FROM review 
WHERE (score = 5))
UNION
(SELECT m_id, review_description, score
FROM review
WHERE (score = 1))
ORDER BY score DESC;

SELECT M_ID, COUNT(C_ID) as Sales
FROM Purchase_movie
GROUP BY M_ID
ORDER BY Sales DESC;

SELECT M_ID, COUNT(C_ID) as Sales
FROM Purchase_movie 
GROUP BY M_ID 
HAVING COUNT(C_ID) > (
    SELECT AVG(Sales)
    FROM ( SELECT COUNT (C_ID) AS Sales
          FROM Purchase_movie 
          GROUP BY M_ID ))
ORDER BY Sales DESC;

COLUMN Username FORMAT a20
SELECT cc.Username FROM Creates_Customer cc
WHERE EXISTS (
    SELECT 1 FROM Review r
    WHERE cc.C_ID = r.C_ID
);

exit;
EOF
