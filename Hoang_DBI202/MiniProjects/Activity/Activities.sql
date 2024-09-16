CREATE DATABASE DB_ACTIVITIES
USE DB_ACTIVITIES

CREATE TABLE ACTIVITY_V1(
	LecturerID char(8) ,
	LectName nvarchar(30),
	Email varchar(50),
	Phone varchar(11),
	Major varchar(30),
	StartDate datetime,
	ActType nvarchar(30),
	Topic nvarchar(30),
	Intro nvarchar(250),
	Room nvarchar(50),
	NoSeat int
)

INSERT INTO ACTIVITY_V1 VALUES('00000001', N'Hoadnt', 'hoadnt@gmail.com', '099x', 'CF', '2024-08-13', 'Seminar',
								N'Machine Learning', Null, N'HCM-FPTU Lib Seminar Room', 100)

SELECT * FROM ACTIVITY_V1
-----------------------------------

DROP TABLE LECTURE_V2
DROP TABLE ACTIVITY_V2
CREATE TABLE LECTURE_V2(
	LecturerID char(8) PRIMARY KEY,
	LectName nvarchar(30),
	Email varchar(50),
	Phone varchar(11),
	Major varchar(30)
)

CREATE TABLE ACTIVITY_V2(
	STT int IDENTITY PRIMARY KEY,
	StartDate datetime,
	ActType nvarchar(30),
	Topic nvarchar(30),
	Intro nvarchar(250),
	Room nvarchar(50),
	NoSeat int,
	LectID char(8) REFERENCES LECTURE_V2(LecturerID)
)

INSERT INTO LECTURE_V2 VALUES('00000001', N'Hoadnt', 'hoadnt@gmail.com', '099x', 'CF')

INSERT INTO ACTIVITY_V2 VALUES('2024-08-13', 'Seminar', N'Machine Learning', Null, N'HCM-FPTU Lib Seminar Room', 100, '00000001')
INSERT INTO ACTIVITY_V2 VALUES('2024-08-14', 'Seminar', N'Machine Learning', Null, N'HCM-FPTU Lib Seminar Room', 100, '00000001')
INSERT INTO ACTIVITY_V2 VALUES('2024-08-15', 'Seminar', N'Machine Learning', Null, N'HCM-FPTU Lib Seminar Room', 100, '00000001')

SELECT * FROM LECTURE_V2
SELECT * FROM ACTIVITY_V2