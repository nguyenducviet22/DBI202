CREATE DATABASE DBDESIGN_ONETABLE
USE DBDESIGN_ONETABLE

--DROP TABLE Student
CREATE TABLE StudentV1
(
	StudentID char(8),
	LastName nvarchar(40),
	FirstName nvarchar(10),
	DOB datetime,
	[Address] nvarchar(50)
)

SELECT * FROM StudentV1
INSERT INTO StudentV1 VALUES
('SE123456', N'Nguyễn ', N'An', '2003-01-01', N'Thủ Đức-Hồ Chí Minh')
INSERT INTO StudentV1 VALUES
('SE200001', N'Lê', N'Bình', '2003-01-02', NULL)
INSERT INTO StudentV1(StudentID, LastName, FirstName, Address)
VALUES('SE200002', N'Võ', N'Cường', 'TDM - Bình Dương')

CREATE TABLE StudentV2
(
	StudentID char(8) PRIMARY KEY,
	LastName nvarchar(40) NOT NULL,
	FirstName nvarchar(10) NOT NULL,
	DOB datetime,
	[Address] nvarchar(50)
)

INSERT INTO StudentV2 VALUES
('SE123456', N'Nguyễn', N'An', '2003-01-01', N'Thủ Đức-Hồ Chí Minh')
INSERT INTO StudentV2 VALUES
('SE200001', N'Lê', N'Bình', '2003-01-02', NULL)
INSERT INTO StudentV2(StudentID, LastName, FirstName, Address)
VALUES('SE200002', N'Võ', N'Cường', 'TDM - Bình Dương')

CREATE TABLE StudentV3
(
	StudentID char(8),
	LastName nvarchar(40) NOT NULL,
	FirstName nvarchar(10) NOT NULL,
	DOB datetime,
	[Address] nvarchar(50),
	CONSTRAINT PK_STUDENTV6 PRIMARY KEY(StudentID)
)

ALTER TABLE StudentV3 DROP CONSTRAINT PK_STUDENTV6
ALTER TABLE StudentV3 ADD CONSTRAINT PK_STUDENTV3 PRIMARY KEY(StudentID)
