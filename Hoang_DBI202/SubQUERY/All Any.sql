USE Northwind

CREATE TABLE Num(
	Numbr int
)

SELECT * from Num
INSERT INTO Num values (2)
INSERT INTO Num values (4)
INSERT INTO Num values (1)
INSERT INTO Num values (5)
INSERT INTO Num values (3)

SELECT * from Num WHERE Numbr >= ALL(SELECT * from Num)