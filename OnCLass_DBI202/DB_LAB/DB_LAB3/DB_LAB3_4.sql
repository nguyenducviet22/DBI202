CREATE DATABASE DB_LAB3_4
USE DB_LAB3_4

CREATE TABLE Locations(
	locationID varchar(20) PRIMARY KEY,
	Name nvarchar(100),
	Address nvarchar(255)
);

CREATE TABLE Events(
	eventID int PRIMARY KEY,
	name nvarchar(255),
	StartTime DateTime,
	EndTime DateTime,
	locationID varchar(20) FOREIGN KEY REFERENCES Locations(locationID)
);

CREATE TABLE Staffs(
	staffID int PRIMARY KEY,
	name nvarchar(255),
	Phone varchar(15)
);

CREATE TABLE workFor(
	role nvarchar(30) NOT NULL,
	eventID int NOT NULL,
	staffID int NOT NULL,
	PRIMARY KEY (eventID, staffID),
	FOREIGN KEY (eventID) REFERENCES Events(eventID),
	FOREIGN KEY (staffID) REFERENCES Staffs(staffID)
);