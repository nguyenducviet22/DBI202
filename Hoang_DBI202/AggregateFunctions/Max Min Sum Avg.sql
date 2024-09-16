USE Northwind

SELECT * from Employees
SELECT MIN(BirthDate) from Employees
SELECT MAX(HireDate) from Employees

SELECT * from Employees WHERE BirthDate = (SELECT MIN(BirthDate) from Employees)
SELECT * from Employees WHERE BirthDate <= ALL (SELECT MIN(BirthDate) from Employees)
SELECT * from Employees WHERE BirthDate <= ALL (SELECT BirthDate from Employees)

SELECT * from Orders
SELECT * from Shippers
SELECT SUM(Freight) AS [Sum of Freight] from Orders
SELECT SUM(Freight) AS [Sum of Freight] from Orders WHERE ShipVia = 3

SELECT AVG(Freight) from Orders
SELECT * from Orders WHERE Freight >= (SELECT AVG(Freight) from Orders) ORDER BY Freight ASC
SELECT COUNT(*) from Orders WHERE Freight >= (SELECT AVG(Freight) from Orders)

SELECT Region, COUNT(*) from Employees GROUP BY Region
SELECT Region, COUNT(Region) from Employees GROUP BY Region

SELECT * from Orders
SELECT ShipCountry, COUNT(*) AS [No Orders] from Orders GROUP BY ShipCountry
SELECT ShipCountry, COUNT(*) AS [No Orders] from Orders GROUP BY ShipCountry HAVING COUNT(*) >= 50