USE Northwind

SELECT * from Employees WHERE YEAR(BirthDate) >= 1960 AND YEAR(BirthDate) <= 1970 ORDER BY BirthDate DESC
--<=>
SELECT * from Employees WHERE YEAR(BirthDate) BETWEEN 1960 AND 1970 ORDER BY BirthDate DESC

SELECT * from Orders WHERE ShipCountry = 'USA' OR ShipCountry = 'France' OR ShipCountry = 'Brazil'
--<=>
SELECT * from Orders WHERE ShipCountry IN ('USA', 'France', 'Brazil')
--<=> not
SELECT * from Orders WHERE ShipCountry NOT IN ('USA', 'France', 'Brazil')

SELECT * from Orders WHERE YEAR(OrderDate) = 1996 AND MONTH(OrderDate) NOT IN (6, 7, 8, 9)