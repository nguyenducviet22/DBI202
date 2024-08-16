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
----------------------------------

DROP TABLE Province
DROP TABLE District

CREATE TABLE Province(
	PName nvarchar(30) PRIMARY KEY
)

CREATE TABLE District(
	DName nvarchar(30) NOT NULL,
	PName nvarchar(30) NOT NULL REFERENCES Province(PName),
	PRIMARY KEY (DName, PName)
)

SELECT DISTINCT province FROM Locations
INSERT INTO Province SELECT DISTINCT province FROM Locations
SELECT * FROM Province

SELECT DISTINCT district, province FROM Locations
INSERT INTO District SELECT DISTINCT district, province FROM Locations
SELECT * FROM District

SELECT DName FROM District WHERE PName = N'Thành phố Hồ Chí Minh'

CREATE TABLE Ward(
	WName nvarchar(30), -- NOT NULL,
	DName nvarchar(30), -- NOT NULL REFERENCES District(DName),
	--PRIMARY KEY (WName, DName)
)

SELECT Ward, District FROM Locations
INSERT INTO Ward SELECT Ward, District FROM Locations
SELECT * FROM Ward

SELECT * FROM Locations
-- Print out all Huyện Châu Thành from all province, not just Tỉnh Đồng Tháp
SELECT w.WName FROM Ward w INNER JOIN District d ON w.DName =d.DName
			WHERE d.DName = N'Huyện Châu Thành' 
			AND d.PName = N'Tỉnh Đồng Tháp'
