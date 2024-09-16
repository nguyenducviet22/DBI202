CREATE DATABASE Cartesian
USE Cartesian

CREATE TABLE EnDict
(
	Num int,
	Def varchar(30)
)

-- DROP TABLE EnDict

INSERT INTO EnDict VALUES(1, 'One')
INSERT INTO EnDict VALUES(2, 'Two')
INSERT INTO EnDict VALUES(3, 'Three')

CREATE TABLE ChDict
(
	Num int,
	Def nvarchar(30)
)

INSERT INTO ChDict VALUES(1, N'一')
INSERT INTO ChDict VALUES(2, N'二')
INSERT INTO ChDict VALUES(3, N'三')

SELECT * from EnDict
SELECT * from ChDict

SELECT en.*, ch.Def from EnDict en, ChDict ch ORDER BY en.Num
SELECT en.*, ch.Def from EnDict en CROSS JOIN ChDict ch ORDER BY en.Num
SELECT en.*, ch.Def from EnDict en CROSS JOIN ChDict ch WHERE en.Num = Ch.Num