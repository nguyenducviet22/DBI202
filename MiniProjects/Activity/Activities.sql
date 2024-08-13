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