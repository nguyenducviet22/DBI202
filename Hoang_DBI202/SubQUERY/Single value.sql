USE Northwind

SELECT LastName from Employees
SELECT LastName from Employees WHERE LastName = 'King'
-- Find all Employees living in the same City with King
SELECT * from Employees 
		WHERE City = (SELECT City from Employees WHERE LastName = 'King')
		AND LastName != 'King'

-- From the same table
SELECT * from Orders
-- Find all Orders are more Freight than OrderID 10479
SELECT * from Orders WHERE Freight >= (SELECT Freight from Orders WHERE OrderID = 10479)

-- From 2 diferrent tables
SELECT * from Shippers
SELECT * from Orders WHERE ShipVia = (SELECT ShipperID from Shippers WHERE CompanyName = 'Speedy Express')
					AND Freight BETWEEN 50 AND 100