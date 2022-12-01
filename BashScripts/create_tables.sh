#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "jkuyumcu/06235647@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
CREATE TABLE User_Account (
    User_name VARCHAR(50) PRIMARY KEY,
    Password VARCHAR(20) CHECK (LENGTH(Password) > 7 AND LENGTH(Password) < 21) NOT NULL
);

CREATE TABLE Customer (
    C_ID INTEGER PRIMARY KEY,
    Name VARCHAR(1000),
    Address VARCHAR(1000),
    DOB DATE
);

CREATE TABLE Creates_Customer(
    Username VARCHAR(50) REFERENCES User_Account(User_name) ON DELETE CASCADE,
    C_ID INTEGER REFERENCES Customer(C_ID) ON DELETE CASCADE
);

CREATE TABLE Movie(
    M_ID INTEGER,
    Title VARCHAR(200) NOT NULL,
    Subscription_Tier VARCHAR(20) NOT NULL CHECK (Subscription_Tier = 'Free' OR 
        Subscription_Tier = 'Bronze' OR Subscription_Tier = 'Silver' OR 
        Subscription_Tier = 'Gold' OR Subscription_Tier = 'Platinum'),
    Release_Date INTEGER,
    Review_Score DECIMAL(3, 2),
    Price DECIMAL(5, 2) NOT NULL,
    PRIMARY KEY(M_ID)
);

CREATE TABLE Genre(
    Genre_Name VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Movie_Has_Genre (
    Genre_Name VARCHAR(50) REFERENCES Genre(Genre_Name) ON DELETE CASCADE,
    M_ID INTEGER REFERENCES Movie(M_ID) ON DELETE CASCADE
);

CREATE TABLE Admin_Account  (
    Admin_Name VARCHAR(50) PRIMARY KEY,
    Password VARCHAR(20) CHECK (LENGTH(Password) > 7 AND LENGTH(Password) < 21) NOT NULL
);

CREATE TABLE Subscription_Rate (
    Subscription_Tier VARCHAR(20),
    Subscription_Rate DECIMAL(5,2) CHECK (Subscription_Rate >= 0),
    PRIMARY KEY(Subscription_Tier)
);

CREATE TABLE Purchases_Subscription(
    C_ID INTEGER REFERENCES Customer(C_ID) ON DELETE CASCADE,
    Subscription_Tier VARCHAR(20) REFERENCES Subscription_Rate(Subscription_Tier) ON DELETE CASCADE
);

CREATE TABLE Purchase_Movie(
    C_ID INTEGER REFERENCES Customer(C_ID) ON DELETE CASCADE,
    M_ID INTEGER REFERENCES Movie(M_ID) ON DELETE CASCADE
);

CREATE TABLE Review (
    C_ID INTEGER REFERENCES Customer(C_ID) ON DELETE CASCADE,
    M_ID INTEGER REFERENCES Movie(M_ID) ON DELETE CASCADE,
    Review_Description VARCHAR2(4000),
    Score DECIMAL(2,1) NOT NULL CHECK (Score >= 1.0 AND Score <= 5.0 AND MOD(Score, 0.5) = 0)
);

CREATE TABLE Update_Catalogue (
    Admin_Name VARCHAR(50) REFERENCES Admin_Account(Admin_Name) ON DELETE CASCADE,
    M_ID INTEGER REFERENCES Movie(M_ID) ON DELETE CASCADE,
    Date_Change DATE NOT NULL,
    Movie_Status VARCHAR(6) NOT NULL CHECK (Movie_Status = 'Add' OR Movie_Status = 'Remove')
);

CREATE TABLE Age_Rating(
    Age_Rating VARCHAR(8) PRIMARY KEY,
    Age_Range VARCHAR(6) NOT NULL CHECK (REGEXP_LIKE(Age_Range, '^[0-9]{1,2}-[0-9]{1,3}$'))
);

CREATE TABLE Assign_Age_Rating(
    M_ID INTEGER REFERENCES Movie(M_ID) ON DELETE CASCADE,
    Age_Rating VARCHAR(8) REFERENCES Age_Rating(Age_Rating) ON DELETE CASCADE
);
exit;
EOF
