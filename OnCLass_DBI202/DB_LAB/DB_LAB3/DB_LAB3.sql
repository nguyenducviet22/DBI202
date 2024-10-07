CREATE DATABASE DB_LAB3
USE DB_LAB3

CREATE TABLE Branch(
	BranchID nchar(10) PRIMARY KEY,
	BranchName nvarchar(30),
	City nvarchar(30)
);

CREATE TABLE Staff(
	StaffID nchar(7) PRIMARY KEY,
	Name nvarchar(30),
	Phone nchar(10),
	BranchID nchar(10) FOREIGN KEY REFERENCES Branch(BranchID)
);

CREATE TABLE Event(
	EventID nchar(20) PRIMARY KEY,
	EventName nvarchar(30)
);

CREATE TABLE WorkFor(
	Hours float,
	StaffID nchar(7) NOT NULL,
	EventID nchar(20) NOT NULL,
	PRIMARY KEY (StaffID, EventID),
	FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
	FOREIGN KEY (EventID) REFERENCES Event(EventID)
);