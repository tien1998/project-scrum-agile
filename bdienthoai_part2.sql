USE MASTER
GO
IF EXISTS(SELECT * FROM SYSDATABASES WHERE NAME='BDT') DROP DATABASE BDT
GO

CREATE DATABASE BDT
GO 

USE BDT
GO

set dateformat dmy
go

IF  EXISTS (SELECT * FROM SYSOBJECTS  WHERE name = 'ACC')	DROP TABLE ACC
GO
CREATE TABLE ACC
(
USERNAME VARCHAR(50) NOT NULL,
PASS VARCHAR(32) NOT NULL,
ROLES NVARCHAR(30)
CONSTRAINT PK_ACC PRIMARY KEY (USERNAME)
)

IF  EXISTS (SELECT * FROM SYSOBJECTS  WHERE name = 'STAFF')	DROP TABLE STAFF
GO
CREATE TABLE STAFF
(
ID VARCHAR(10) NOT NULL UNIQUE,
USERNAME VARCHAR(50) NOT NULL unique,
NAME NVARCHAR(60) NOT NULL,
BIRTHDAY DATETIME NOT NULL,
PHONE VARCHAR(15) NOT NULL,
ADDRESS NVARCHAR(MAX) NOT NULL
CONSTRAINT PK_ID PRIMARY KEY (ID),
CONSTRAINT FK_STAFF_ACC FOREIGN KEY (USERNAME) REFERENCES ACC(USERNAME)
)
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE name = 'CUSTOMERS') DROP TABLE CUSTOMERS
GO
CREATE TABLE CUSTOMERS
(
CUS_ID VARCHAR(10) NOT NULL,
CUS_NAME NVARCHAR(60) NOT NULL,
CUS_PHONE VARCHAR(15) NOT NULL,
CUS_ADDRESS NVARCHAR(MAX) NOT NULL
CONSTRAINT CUSTOMERSS PRIMARY KEY (CUS_ID)
)

IF  EXISTS (SELECT * FROM SYSOBJECTS  WHERE name = 'CATEGORIES')	DROP TABLE CATEGORIES
GO
CREATE TABLE CATEGORIES
(
CAT_ID VARCHAR(10) NOT NULL,
CAT_NAME VARCHAR(70) NULL,
CONSTRAINT PK_CAT_ID PRIMARY KEY (CAT_ID)
)

IF  EXISTS (SELECT * FROM SYSOBJECTS  WHERE name = 'PRODUCTS')	DROP TABLE PRODUCTS
GO
CREATE TABLE PRODUCTS
(
PROD_ID VARCHAR(10) NOT NULL ,
PROD_NAME VARCHAR(70) NULL,
CAT_ID VARCHAR(10) NOT NULL,
PRICE MONEY,
NUMBER INT,
DETAILS NVARCHAR(MAX)
CONSTRAINT PK_PRODUCTS PRIMARY KEY (PROD_ID),
CONSTRAINT FK_PRODUCTS_CATEGORIES FOREIGN KEY(CAT_ID) REFERENCES CATEGORIES(CAT_ID)
)



IF  EXISTS (SELECT * FROM SYSOBJECTS  WHERE name = 'INVOICES')	DROP TABLE INVOICES
GO
CREATE TABLE INVOICES
(
INV_ID VARCHAR(10) NOT NULL,
ID VARCHAR(10) NOT NULL,
INV_DATE DATETIME,
CUS_ID VARCHAR(10) NOT NULL,
INV_TOTAL MONEY
CONSTRAINT PK_INV_ID PRIMARY KEY (INV_ID),
CONSTRAINT FK_INVOICES_CUSTOMERS FOREIGN KEY (CUS_ID) REFERENCES CUSTOMERS(CUS_ID),
CONSTRAINT FK_INVOICES_STAFF FOREIGN KEY (ID) REFERENCES STAFF(ID)
)

IF  EXISTS (SELECT * FROM SYSOBJECTS  WHERE name = 'INVOICE_DETAILS')	DROP TABLE INVOICE_DETAILS
GO
CREATE TABLE INVOICE_DETAILS
(
INV_ID VARCHAR(10) NOT NULL,
PROD_ID VARCHAR(10) NOT NULL,
NUMBER_DETAIL INT,
PRICE MONEY
CONSTRAINT PK_INV_ID_STT PRIMARY KEY (INV_ID,PROD_ID),
CONSTRAINT FK_INVOICE_DETAILS_PRODUCTS FOREIGN KEY (PROD_ID) REFERENCES PRODUCTS(PROD_ID),
CONSTRAINT FK_INVOICE_DETAILS_INVOICES FOREIGN KEY (INV_ID) REFERENCES INVOICES(INV_ID)
)
SELECT INV_TOTAL FROM INVOICES WHERE INV_ID='hd1'
INSERT INTO ACC VALUES ('DUC','admin','ADMIN')
INSERT INTO ACC VALUES ('KHANH','123456','STAFF')
INSERT INTO ACC VALUES ('HAI','123456','STAFF')
INSERT INTO ACC VALUES ('TRUONG','123456','STAFF')
INSERT INTO ACC VALUES ('TRUONG11','123456','STAFF')
INSERT INTO ACC VALUES ('TRUONG13','123456','STAFF')

INSERT INTO CUSTOMERS VALUES('KH1','HOLA',0169999999,'FPT POLY')

INSERT INTO CATEGORIES VALUES('CA1','APPLE')
INSERT INTO CATEGORIES VALUES('CA2','SONY')
INSERT INTO CATEGORIES VALUES('CA3','HTC')
INSERT INTO CATEGORIES VALUES('CA4','ASUS')
INSERT INTO CATEGORIES VALUES('CA5','LG')
INSERT INTO CATEGORIES VALUES('CA6','SAMSUNG')

INSERT INTO STAFF VALUES('SKY1','HAI','NGUYEN NGOC HAI','12/05/2012',0123456798,'FPT POLY')
INSERT INTO STAFF VALUES('SKY2','KHANH','KHANH YASUA 20GG','12/05/2012',123456789,'POLY FPT')
INSERT INTO STAFF VALUES('SKY3','TRUONG','XUAN TRUONG','12/05/2012',123456789,'POLY FPT')
INSERT INTO STAFF VALUES('SKY4','TRUONG11','XUAN TRUONG','14/05/2012',123456789,'POLY FPT')
INSERT INTO STAFF VALUES('SKY5','TRUONG13','XUAN TRUONG','14/05/2012',123456789,'POLY FPT')

select * from STAFF

INSERT INTO PRODUCTS VALUES('PRO1','IPHONE 4','CA1',1000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO2','IPHONE 4s','CA1',1500000,100,'')
INSERT INTO PRODUCTS VALUES('PRO3','IPHONE 5','CA1',2000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO4','IPHONE 5s','CA1',2500000,100,'')
INSERT INTO PRODUCTS VALUES('PRO5','IPHONE 6','CA1',6000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO6','IPHONE 6s','CA1',7000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO7','SONY XPERIA Z1','CA2',1000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO8','SONY XPERIA Z2','CA2',1500000,100,'')
INSERT INTO PRODUCTS VALUES('PRO9','SONY XPERIA Z3','CA2',2500000,100,'')
INSERT INTO PRODUCTS VALUES('PRO10','SONY XPERIA Z4','CA2',3500000,100,'')
INSERT INTO PRODUCTS VALUES('PRO11','SONY XPERIA Z5','CA2',8000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO12','HTC ONE M7','CA3',1000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO13','HTC ONE M8','CA3',2000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO14','HTC ONE M9','CA3',3000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO15','ASUS ZENPHONE 1','CA4',500000,100,'')
INSERT INTO PRODUCTS VALUES('PRO16','ASUS ZENPHONE 2','CA4',2500000,100,'')
INSERT INTO PRODUCTS VALUES('PRO17','ASUS ZENPHONE 3','CA4',11000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO18','ASUS ZENPHONE 4','CA4',2000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO19','ASUS ZENPHONE 5','CA4',1500000,100,'')
INSERT INTO PRODUCTS VALUES('PRO20','ASUS ZENPHONE 6','CA4',2500000,100,'')
INSERT INTO PRODUCTS VALUES('PRO21','LG G2','CA5',1500000,100,'')
INSERT INTO PRODUCTS VALUES('PRO22','LG G3','CA5',2000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO23','LG G4','CA5',3000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO24','LG G5','CA5',6000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO25','SAMSUNG GALAXY S1','CA6',500000,100,'')
INSERT INTO PRODUCTS VALUES('PRO26','SAMSUNG GALAXY S2','CA6',1000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO27','SAMSUNG GALAXY S3','CA6',1500000,100,'')
INSERT INTO PRODUCTS VALUES('PRO28','SAMSUNG GALAXY S4','CA6',2000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO29','SAMSUNG GALAXY S5','CA6',3000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO30','SAMSUNG GALAXY S6','CA6',5000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO31','SAMSUNG GALAXY S7','CA6',12000000,100,'')
INSERT INTO PRODUCTS VALUES('PRO32','SAMSUNG GALAXY S8','CA6',22000000,100,'')


SELECT ACC.USERNAME,PASS,ROLES,ID,NAME,CONVERT(NVARCHAR(MAX),BIRTHDAY,103) AS BIRTHDAY,PHONE,ADDRESS FROM ACC JOIN STAFF ON ACC.USERNAME=STAFF.USERNAME WHERE STAFF.NAME='KHANH YASUA 20GG'

SELECT * FROM ACC JOIN STAFF ON ACC.USERNAME=STAFF.USERNAME WHERE ACC.USERNAME='KHANH' AND PASS='123456'

select * from acc

SELECT PROD_ID,PROD_NAME,CATEGORIES.CAT_NAME,PRICE,NUMBER,DETAILS FROM PRODUCTS JOIN CATEGORIES ON PRODUCTS.CAT_ID = CATEGORIES.CAT_ID

SELECT PROD_ID FROM INVOICE_DETAILS WHERE INV_ID='1'
SELECT NUMBER FROM PRODUCTS WHERE PROD_ID='PRO1'
SELECT NUMBER_DETAIL FROM INVOICE_DETAILS WHERE PROD_ID='PRO14' AND INV_ID='HD5'

