USE Northwind

SELECT * from Customers

-- Just show some columns
SELECT CustomerID, CompanyName, ContactName, Country from Customers
SELECT EmployeeID, LastName, FirstName, Title, BirthDate from Employees

--Merge colums and creat new ones
SELECT EmployeeID, FirstName + ' ' + LastName AS [Fullname], Title, 
		BirthDate, YEAR(GETDATE()) - YEAR(BirthDate) AS Age from Employees

SELECT *, UnitPrice * Quantity AS [Total] from [Order Details]
SELECT *, UnitPrice * Quantity - (1 - Discount) AS [Total] from [Order Details]