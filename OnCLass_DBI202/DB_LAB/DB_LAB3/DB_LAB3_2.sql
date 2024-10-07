CREATE DATABASE DB_LAB3_2
USE DB_LAB3_2

CREATE TABLE tblStudents(
	stid nchar(7) PRIMARY KEY,
	name nvarchar(25),
	birthday date,
	phone nvarchar(15)
);

CREATE TABLE tblSubjects(
	subid nchar(6) PRIMARY KEY,
	subname nvarchar(50),
	unit int
);

CREATE TABLE Result(
	stid nchar(7) NOT NULL,
	subid nchar(6) NOT NULL,
	score01 float,
	score02 float,
	PRIMARY KEY (stid, subid),
	FOREIGN KEY (stid) REFERENCES tblStudents(stid),
	FOREIGN KEY (subid) REFERENCES tblSubjects(subid)
);