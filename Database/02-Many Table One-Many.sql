CREATE DATABASE DBDESIGN_ONEMANY

USE DBDESIGN_ONEMANY

CREATE TABLE MajorV1
(
	MajorID char(2) PRIMARY KEY,
	MajorName nvarchar(40) NOT NULL
)

INSERT INTO MajorV1 VALUES ('SE', 'Software Engineering')
INSERT INTO MajorV1 VALUES ('IS', 'Information System')

CREATE TABLE StudentV1
(
	StudentID char(8),
	LastName nvarchar(40) NOT NULL,
	FirstName nvarchar(10) NOT NULL,
	DOB datetime,
	[Address] nvarchar(50),
	MajorID char(2)
	CONSTRAINT PK_STUDENTV1 PRIMARY KEY(StudentID)
)

INSERT INTO StudentV1 VALUES ('SE1', N'Nguyễn', N'An', NULL, NULL, 'SE')
INSERT INTO StudentV1 VALUES ('SE2', N'Tran', N'Binh', 2004, NULL, 'GD')

SELECT * FROM StudentV1
SELECT * FROM MajorV1

DROP TABLE MajorV2
CREATE TABLE MajorV2
(
	MajorID char(2) PRIMARY KEY,
	MajorName nvarchar(40) NOT NULL
)

INSERT INTO MajorV2 VALUES ('SE', 'Software Engineering')
INSERT INTO MajorV2 VALUES ('IS', 'Information System')

CREATE TABLE StudentV2
(
	StudentID char(8) PRIMARY KEY,
	LastName nvarchar(40) NOT NULL,
	FirstName nvarchar(10) NOT NULL,
	DOB datetime,
	[Address] nvarchar(50),
	MajorID char(2) FOREIGN KEY REFERENCES MajorV2(MajorID) --full command
--	MajorID char(2) REFERENCES MajorV2(MajorID)
)

INSERT INTO StudentV2 VALUES ('SE1', N'Nguyễn', N'An', NULL, NULL, 'SE')
INSERT INTO StudentV2 VALUES ('SE2', N'Tran', N'Binh', NULL, 'TP HCM', 'IS')

SELECT * FROM StudentV2
SELECT * FROM MajorV2