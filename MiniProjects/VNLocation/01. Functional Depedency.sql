CREATE DATABASE DB_VNLOCATION
USE DB_VNLOCATION

DROP TABLE Locations
CREATE TABLE Locations(
	province nvarchar(30),
	district nvarchar(30),
	ward nvarchar(30)
)

SELECT * FROM Locations
----------------------------

CREATE TABLE Province(
	PName nvarchar(30)
)

SELECT DISTINCT Province FROM Locations
INSERT INTO Province SELECT DISTINCT Province FROM Locations
SELECT * FROM Province

CREATE TABLE District(
	DName nvarchar(30)
)

SELECT DISTINCT District FROM Locations
INSERT INTO District SELECT DISTINCT District FROM Locations
SELECT * FROM District

