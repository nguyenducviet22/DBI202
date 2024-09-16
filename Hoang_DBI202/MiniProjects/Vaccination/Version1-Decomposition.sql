CREATE DATABASE DB_VACCINATION
USE DB_VACCINATION

DROP TABLE Vaccination
CREATE TABLE VaccinationV1_0(-- Many info in a column
	ID char(11) PRIMARY KEY,
	LastName nvarchar(30),
	FirstName nvarchar(10),
	Phone varchar(11) NOT NULL UNIQUE,
	InjectionInfo nvarchar(255)
)

INSERT INTO VaccinationV1_0 VALUES('00000000001', N'Nguyen', N'An', '098x', N'11.08.2024 FPTU')

SELECT * FROM VaccinationV1_0
---------------------------------------------------------------------

CREATE TABLE VaccinationV1_1(-- Split info to many columns
	ID char(11) PRIMARY KEY,
	LastName nvarchar(30),
	FirstName nvarchar(10),
	Phone varchar(11) NOT NULL UNIQUE,
	Dose1 nvarchar(100),
	Dose2 nvarchar(100)
)
--------------------------------------------------------------------------

CREATE TABLE PersonV1_2(-- Split info in columns to many tables
	ID char(11) PRIMARY KEY,
	LastName nvarchar(30),
	FirstName nvarchar(10),
	Phone varchar(11) NOT NULL UNIQUE
)

CREATE TABLE VaccinationV1_2(
	Dose1 nvarchar(100),
	PersonID char(11) REFERENCES PersonV1_2(ID)
)
-------------------------------------------------

CREATE TABLE PersonV1_3(-- Split info to many tables
	ID char(11) PRIMARY KEY,
	LastName nvarchar(30),
	FirstName nvarchar(10),
	Phone varchar(11) NOT NULL UNIQUE
)

CREATE TABLE VaccinationV1_3(
	Dose1 int,
	InjDate datetime,
	Vaccine nvarchar(50),
	Lot nvarchar(20),
	Location nvarchar(50),
	PersonID char(11) REFERENCES PersonV1_3(ID)
)

INSERT INTO PersonV1_3 VALUES('00000000001', N'Nguyen', N'An', '098x')
INSERT INTO PersonV1_3 VALUES('00000000002', N'Le', N'Binh', '097x')
INSERT INTO PersonV1_3 VALUES('00000000003', N'Tran', N'Chi', '099x')

INSERT INTO VaccinationV1_3 VALUES(1, GETDATE(), 'AZ', NULL, NULL, '00000000001')

SELECT * FROM PersonV1_3
SELECT * FROM VaccinationV1_3

SELECT * FROM PersonV1_3 p INNER JOIN VaccinationV1_3 v
		ON p.ID = v.PersonID

SELECT p.ID, p.FirstName, COUNT(v.Dose1) AS 'No Doses' FROM PersonV1_3 p LEFT JOIN VaccinationV1_3 v
		ON p.ID = v.PersonID GROUP BY p.id, p.FirstName