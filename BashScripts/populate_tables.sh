#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "jkuyumcu/06235647@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
INSERT INTO User_Account (User_name, Password) VALUES ('username1', 'password1');
INSERT INTO User_Account (User_name, Password) VALUES ('username2', 'password2'); 
INSERT INTO User_Account (User_name, Password) VALUES ('username3', 'password3');
INSERT INTO User_Account (User_name, Password) VALUES ('username4', 'password4');
INSERT INTO User_Account (User_name, Password) VALUES ('username5', 'password5');

alter SESSION set NLS_DATE_FORMAT = 'YYYY-MM-DD';
INSERT INTO Customer VALUES (1, 'John Doe', '1 Fake St. Toronto ON', '2015-01-01');
INSERT INTO Customer VALUES (2, 'Jane Naught', '2 Unreal Ave. Montreal QC', '2002-12-01');
INSERT INTO Customer VALUES (3, 'James Stew', '3 Fabrication Cres. Vancouver BC', '2009-02-05');
INSERT INTO Customer VALUES (4, 'Drake', '21 Toronto St. Toronto ON', '1995-03-03');
INSERT INTO Customer VALUES (5, 'Alex Chan', '199 Wasabi Ave. Vancouver BC', '1999-02-20');


INSERT INTO Creates_Customer VALUES ('username1', 1);
INSERT INTO Creates_Customer VALUES ('username2', 2);
INSERT INTO Creates_Customer VALUES ('username3', 3);
INSERT INTO Creates_Customer VALUES ('username4', 4);
INSERT INTO Creates_Customer VALUES ('username5', 5);

INSERT INTO movie VALUES(1, 'Top Gun', 'Bronze', 1986, NULL, 15.99);
INSERT INTO movie VALUES(2, 'Old Movie A', 'Bronze', 1990, NULL, 20.99);
INSERT INTO movie VALUES(3, 'New movie A', 'Gold', 2022, NULL, 60.99);
INSERT INTO movie VALUES(4, 'New movie B', 'Silver', 2021, NULL, 45.99);
INSERT INTO movie VALUES(5, 'Indiana Jones', 'Bronze', 1989, NULL, 15.99);
INSERT INTO movie VALUES(6, 'The Avengers', 'Bronze', 2012, NULL, 15.99);


INSERT INTO Genre VALUES ('Action');
INSERT INTO Genre VALUES ('Horror');
INSERT INTO Genre VALUES ('Comedy');
INSERT INTO Genre VALUES ('Sci-Fi');

INSERT INTO Movie_Has_Genre VALUES ('Action', 1);
INSERT INTO Movie_Has_Genre VALUES ('Horror', 2);
INSERT INTO Movie_Has_Genre VALUES ('Sci-Fi', 3);
INSERT INTO Movie_Has_Genre VALUES ('Comedy', 4);
INSERT INTO Movie_Has_Genre VALUES ('Action', 5);
INSERT INTO Movie_Has_Genre VALUES ('Action', 6);

INSERT INTO Admin_Account VALUES ('siteadmin1', 'password1');
INSERT INTO Admin_Account VALUES ('publisher1', 'password2');

INSERT INTO subscription_rate VALUES('Gold', 20.25);
INSERT INTO subscription_rate VALUES('Silver', 10.25);
INSERT INTO subscription_rate VALUES('Bronze', 5.25);

INSERT INTO purchases_subscription VALUES(1, 'Gold');
INSERT INTO purchases_subscription VALUES(2, 'Silver');
INSERT INTO purchases_subscription VALUES(3, 'Bronze');
INSERT INTO purchases_subscription VALUES(4, 'Gold');
INSERT INTO purchases_subscription VALUES(5, 'Bronze');

INSERT INTO purchase_movie VALUES(1, 1);
INSERT INTO purchase_movie VALUES(1, 2);
INSERT INTO purchase_movie VALUES(1, 3);
INSERT INTO purchase_movie VALUES(1, 4);
INSERT INTO purchase_movie VALUES(1, 5);
INSERT INTO purchase_movie VALUES(1, 6);
INSERT INTO purchase_movie VALUES(2, 4);
INSERT INTO purchase_movie VALUES(2, 1);
INSERT INTO purchase_movie VALUES(3, 2);
INSERT INTO purchase_movie VALUES(3, 5);
INSERT INTO purchase_movie VALUES(4, 3);
INSERT INTO purchase_movie VALUES(4, 4);
INSERT INTO purchase_movie VALUES(5, 1);
INSERT INTO purchase_movie VALUES(5, 6);

INSERT INTO review VALUES(1, 1, 'Good movie, kinda long but overall enjoyable', 3.5);
INSERT INTO review VALUES(1, 2, 'This movie is so old!', 2.0);
INSERT INTO review VALUES(1, 3, 'Amazing, definitely worth the Gold tier!', 5.0);
INSERT INTO review VALUES(1, 4, 'Sort of boring at times, but it really picked up towards the end', 4.5);
INSERT INTO review VALUES(1, 5, 'A classic', 4.0);
INSERT INTO review VALUES(1, 6, 'I mean, its the Avengers', 5.0);
INSERT INTO review VALUES(2, 4, 'Meh', 1.5);
INSERT INTO review VALUES(3, 2, 'Decent!', 3.0);
INSERT INTO review VALUES(4, 3, 'Really good', 4.0);
INSERT INTO review VALUES(4, 4, 'I got the Silver tier just for this, super good', 5.0);
INSERT INTO review VALUES(5, 1, 'Trash', 1.0);
INSERT INTO review VALUES(5, 6, 'Typical Marvel stuff, which means its good', 3.5);

INSERT INTO Update_Catalogue VALUES ('siteadmin1', 1, '2022-09-28', 'Add');
INSERT INTO Update_Catalogue VALUES ('siteadmin1', 2, '2022-09-28', 'Add');
INSERT INTO Update_Catalogue VALUES ('siteadmin1', 3, '2022-09-28', 'Add');
INSERT INTO Update_Catalogue VALUES ('siteadmin1', 4, '2022-09-28', 'Add');
INSERT INTO Update_Catalogue VALUES ('siteadmin1', 5, '2022-09-28', 'Add');
INSERT INTO Update_Catalogue VALUES ('publisher1', 6, '2022-10-02', 'Add');
INSERT INTO Update_Catalogue VALUES ('publisher1', 6, '2022-10-04', 'Remove');
INSERT INTO Update_Catalogue VALUES ('siteadmin1', 4, '2022-09-04', 'Remove');
INSERT INTO Update_Catalogue VALUES ('publisher1', 2, '2022-10-10', 'Remove');

INSERT INTO age_rating VALUES ('G', '0-200');
INSERT INTO age_rating VALUES('PG', '8-12');
INSERT INTO age_rating VALUES('PG-13', '13-17');
INSERT INTO age_rating VALUES('R', '18-200');

INSERT INTO assign_age_rating VALUES(1, 'PG-13');
INSERT INTO assign_age_rating VALUES(2, 'R');
INSERT INTO assign_age_rating VALUES(3, 'PG');
INSERT INTO assign_age_rating VALUES(4, 'G');
INSERT INTO assign_age_rating VALUES(5, 'PG-13');
INSERT INTO assign_age_rating VALUES(6, 'PG-13');
exit;
EOF
