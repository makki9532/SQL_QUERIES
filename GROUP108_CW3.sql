-- Author: AL-NOORNABI AL-QAUSAYEN AL-MAKKI
-- Script file was written in mysql server version 5.7
-- Relational Schema Investment:

DROP TABLE IF EXISTS PROTECTION;
DROP TABLE IF EXISTS INVESTMENT;
DROP TABLE IF EXISTS COMPANY;
DROP TABLE IF EXISTS SHARES;
DROP TABLE IF EXISTS FOUNDER;
DROP VIEW IF EXISTS C;
DROP VIEW IF EXISTS X;

-- PART 1 DATABASE CREATION

-- CREATE FOUNDER TABLE AND POPULATE WITH DUMMY VALUES

CREATE TABLE FOUNDER
  (ID SMALLINT UNIQUE PRIMARY KEY,
  NAME VARCHAR(40),
  TELEPHONE VARCHAR(30),
  EMAIL VARCHAR(40),
  NATIONALITY VARCHAR(50));

INSERT INTO FOUNDER VALUES
  (1100, 'Steve Jobs', '557-9936', 'steve24@yahoo.com', 'USA');
INSERT INTO FOUNDER VALUES
  (1101, 'Bill Gates', '246-3258', 'bill77@gmail.com', 'USA');
INSERT INTO FOUNDER VALUES
  (1102, 'Jeff Bezos', '327-4285', 'jb32@gmail.com', 'USA');
INSERT INTO FOUNDER VALUES
  (1103, 'Elon Musk', '991-2549', 'elon55@yahoo.com', 'Australia');
INSERT INTO FOUNDER VALUES
  (1104, 'Larry Page', '221-4589', 'lpage@gmail.com', 'Finland');
INSERT INTO FOUNDER VALUES
  (1105, 'John Cadbury', '378-7422', 'johncad@gmail.com', 'Great Britain');
INSERT INTO FOUNDER VALUES
  (1106, 'Jack Dorsey', '784-2258', 'jackdor@gmail.com', 'Sweden');
INSERT INTO FOUNDER VALUES
  (1107, 'Larry Kaplan', '882-4367', 'larry@gmail.com', 'Estonia');
INSERT INTO FOUNDER VALUES
  (1108, 'Tim Sweeney', '444-3254', 'tim@yahoo.com', 'France');
INSERT INTO FOUNDER VALUES
  (1109, 'Mark Zuckerberg', '892-3685', 'mark@yahoo.com', 'Germany');


-- CREATE SHARES TABLE AND POPULATE WITH DUMMY VALUES

CREATE TABLE SHARES
  (ID SMALLINT UNIQUE PRIMARY KEY,
  NUMBERSHARES INT,
  SHARETYPE VARCHAR(30),
  PURCHASEPRICE DECIMAL(8,2),
  CURRENTPRICE DECIMAL(8,2),
  PERCENTAGEOFOWNERSHIP DECIMAL(5,2),
  CHECK(PERCENTAGEOFOWNERSHIP<=100.00 AND PERCENTAGEOFOWNERSHIP>=0.00));

INSERT INTO SHARES VALUES
  (4430, 5236 , 'Non-Voting', 299.54, 150.39, 41.23);
INSERT INTO SHARES VALUES
  (4431, 1254, 'Non-Voting', 426.45, 223.79, 47.28);
INSERT INTO SHARES VALUES
  (4432, 4522, 'Preference', 325.54, 552.39, 39.33);
INSERT INTO SHARES VALUES
  (4433,  3221, 'Ordinary', 345.73, 371.88, 67.34);
INSERT INTO SHARES VALUES
  (4434, 1876,  'Ordinary', 411.65, 584.28, 39.82);
INSERT INTO SHARES VALUES
  (4435, 2924, 'Preference', 320.22, 690.39, 28.80);
INSERT INTO SHARES VALUES
  (4436, 1351, 'Ordinary', 301.32, 272.00, 34.44);
INSERT INTO SHARES VALUES
  (4437, 2254, 'Preference', 413.27, 136.45, 41.01);
INSERT INTO SHARES VALUES
  (4438, 3674, 'Ordinary', 638.05, 479.98, 28.67);
INSERT INTO SHARES VALUES
  (4439, 3898, 'Non-Voting', 284.87, 308.12, 72.13);


-- CREATE COMPANY AND POPULATE WITH DUMMY VALUES

CREATE TABLE COMPANY
  (ID SMALLINT UNIQUE PRIMARY KEY,
  NAME VARCHAR(40),
  FOUNDERID SMALLINT,
  AREA VARCHAR(30),
  EXPECTEDTURNOVER DECIMAL(8,2),
  TURNOVER DECIMAL(8,2),
  EXPECTEDTNUMBERCUSTOMERS INT,
  FOREIGN KEY (FOUNDERID) REFERENCES FOUNDER (ID));

INSERT INTO COMPANY VALUES
  (100, 'Meta', 1109 ,  'Silicon Valley', 299325.54, 150221.39, 242069);
INSERT INTO COMPANY VALUES
  (101, 'Alphabet', 1104,  'Silicon Valley', 100426.45, 261023.79, 421325);
INSERT INTO COMPANY VALUES
  (102, 'Cadbury', 1105,  'London', 69325.54, 55221.39, 10000);
INSERT INTO COMPANY VALUES
  (103, 'Activision', 1107,  'Brighton', 97345.73, 51371.88, 10301);
INSERT INTO COMPANY VALUES
  (104, 'Microsoft', 1101,  'Seattle', 411436.65, 358345.28, 281563);
INSERT INTO COMPANY VALUES
  (105, 'Apple', 1100,  'Washington', 322670.22, 190339.39, 141288);
INSERT INTO COMPANY VALUES
  (106, 'EpicGames', 1108,  'Silicon Valley', 37501.32, 27056.00, 5681);
INSERT INTO COMPANY VALUES
  (107, 'Twitter', 1106,  'Colorado', 144113.27, 130628.45, 125363);
INSERT INTO COMPANY VALUES
  (108, 'Amazon', 1102,  'Denver', 638922.05, 584079.98, 420558);
INSERT INTO COMPANY VALUES
  (109, 'Tesla', 1103,  'Texas', 284320.87, 130890.12, 72369);


-- CREATE INVESTMENT AND POPULATE WITH DUMMY VALUES

CREATE TABLE INVESTMENT
  (ID SMALLINT NOT NULL PRIMARY KEY,
    COMPANYID SMALLINT,
    SHAREID SMALLINT,
    FOREIGN KEY (COMPANYID) REFERENCES COMPANY (ID),
    FOREIGN KEY (SHAREID) REFERENCES SHARES (ID));

INSERT INTO INVESTMENT VALUES
  (0, 100, 4430);
INSERT INTO INVESTMENT VALUES
  (1, 101, 4431);
INSERT INTO INVESTMENT VALUES
  (2, 102, 4432);
INSERT INTO INVESTMENT VALUES
  (3, 103, 4433);
INSERT INTO INVESTMENT VALUES
  (4, 104, 4434);
INSERT INTO INVESTMENT VALUES
  (5, 105, 4435);
INSERT INTO INVESTMENT VALUES
  (6, 106, 4436);
INSERT INTO INVESTMENT VALUES
  (7, 107, 4437);
INSERT INTO INVESTMENT VALUES
  (8, 108, 4438);
INSERT INTO INVESTMENT VALUES
  (9, 109, 4439);


-- CREATE PROTECTION AND POPULATE WITH DUMMY VALUES

CREATE TABLE PROTECTION
  (ID SMALLINT NOT NULL PRIMARY KEY,
   COMPANYID SMALLINT,
   PROTECTIONTYPE VARCHAR(30),
   PATENTLOCATION VARCHAR(30),
   EXPIRYDATE DATE,
   FOREIGN KEY (COMPANYID) REFERENCES COMPANY (ID));

INSERT INTO PROTECTION VALUES
  (10000, 100, 'Patent', 'California', '2030-10-20');
INSERT INTO PROTECTION VALUES
  (10001, 101, 'Patent', 'California', '2035-09-12');
INSERT INTO PROTECTION VALUES
  (10002, 102, 'Copyright', 'London', '2025-06-05');
INSERT INTO PROTECTION VALUES
  (10003, 100, 'Trademark', 'Liverpool', '2027-03-18');
INSERT INTO PROTECTION VALUES
  (10004, 104,  'Trademark', 'Denver', '2045-04-22');
INSERT INTO PROTECTION VALUES
  (10005, 105, 'Copyright', 'California', '2026-06-01');
INSERT INTO PROTECTION VALUES
  (10006, 106, 'Patent', 'Washington', '2032-09-26');
INSERT INTO PROTECTION VALUES
  (10007, 101, 'Copyright', 'Florida', '2024-01-07');
INSERT INTO PROTECTION VALUES
  (10008, 108, 'Trademark', 'Munich', '2037-03-08');
INSERT INTO PROTECTION VALUES
  (10009, 109, 'Patent', 'Melbourne', '2028-11-04');

-- END OF PART 1

-- PART 2

-- Find companies that have patents which expire before 2030

SELECT COMPANY.ID AS ID,
COMPANY.NAME AS Company_Name,
PROTECTION.EXPIRYDATE AS Exp_date,
PROTECTION.PROTECTIONTYPE AS Protection_Type
FROM COMPANY
JOIN PROTECTION
ON COMPANY.ID = PROTECTION.COMPANYID
WHERE PROTECTION.EXPIRYDATE<'2030-01-01';

-- Find all the companies, area of operation and the names of their founder

SELECT COMPANY.ID AS ID,
COMPANY.NAME AS Company_Name,
FOUNDER.NAME AS Founder_Name,
COMPANY.AREA AS Area_of_Operation
FROM COMPANY
INNER JOIN FOUNDER ON COMPANY.FOUNDERID = FOUNDER.ID;

-- END OF PART 2

-- PART 3

-- List number of each type of shares

SELECT SHARETYPE AS Share_Type,
SUM(NUMBERSHARES) AS Number_of_shares
FROM SHARES
WHERE SHARETYPE = 'Ordinary'
UNION
SELECT SHARETYPE,
SUM(NUMBERSHARES) AS Number_of_shares
FROM SHARES
WHERE SHARETYPE = 'Non-Voting'
UNION
SELECT SHARETYPE,
SUM(NUMBERSHARES) AS Number_of_shares
FROM SHARES
WHERE SHARETYPE = 'Preference'
GROUP BY SHARETYPE;


-- List all companies, share type and number of shares

SELECT INVESTMENT.ID,
INVESTMENT.COMPANYID AS Company_Id,
INVESTMENT.SHAREID AS Share_Id,
SHARES.NUMBERSHARES AS Number_of_shares,
SHARES.SHARETYPE AS Share_Type,
COMPANY.NAME AS Company_Name
FROM INVESTMENT
LEFT JOIN SHARES
ON SHARES.ID = INVESTMENT.SHAREID
LEFT JOIN COMPANY
ON COMPANY.ID=INVESTMENT.COMPANYID
GROUP BY INVESTMENT.ID;


-- List all companies that have patents

SELECT COMPANY.ID AS ID,
COMPANY.NAME AS Company_Name,
PROTECTION.PROTECTIONTYPE AS Protection_Type
FROM COMPANY
RIGHT JOIN PROTECTION
ON COMPANY.ID = PROTECTION.COMPANYID
WHERE PROTECTION.PROTECTIONTYPE = 'Patent'
GROUP BY PROTECTION.ID;
-- END OF PART 3

-- PART 4

-- Find all companies that have an expected turnover higher than average and their respective area

SELECT NAME AS Company_Name,
AREA AS Company_Area,
EXPECTEDTURNOVER AS Expected_Turnover
FROM COMPANY
WHERE EXPECTEDTURNOVER>(SELECT AVG(EXPECTEDTURNOVER)
                        FROM COMPANY);

-- Find shares that have higher than average current and purchase price

SELECT ID,
NUMBERSHARES AS Number_of_shares,
PURCHASEPRICE AS Purchase_Price,
CURRENTPRICE AS Current_Price
FROM SHARES
WHERE CURRENTPRICE>(SELECT AVG(CURRENTPRICE)
                    FROM SHARES)
AND PURCHASEPRICE>(SELECT AVG(PURCHASEPRICE)
                   FROM SHARES);

-- Find the companies that have an ownnwership less than 50%

CREATE VIEW C AS
SELECT ID, COMPANYID,SHAREID
FROM INVESTMENT
WHERE SHAREID IN (SELECT ID FROM SHARES WHERE PERCENTAGEOFOWNERSHIP>50);

CREATE VIEW X AS
SELECT C.ID, C.COMPANYID, C.SHAREID, SHARES.PERCENTAGEOFOWNERSHIP
FROM C
JOIN SHARES
ON SHARES.ID = C.SHAREID;

SELECT X.COMPANYID AS Company_Id,
COMPANY.NAME AS Company_Name,
X.PERCENTAGEOFOWNERSHIP AS Percentage_Ownership
FROM X
JOIN COMPANY
ON X.COMPANYID=COMPANY.ID;

DROP VIEW C;
DROP VIEW X;

-- END OF PART 4

-- Remove all tables

DROP TABLE PROTECTION;
DROP TABLE INVESTMENT;
DROP TABLE COMPANY;
DROP TABLE SHARES;
DROP TABLE FOUNDER;
