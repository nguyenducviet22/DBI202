USE Northwind

SELECT * from Employees

SELECT * from Employees WHERE LastName LIKE 'D%'

SELECT EmployeeID, LastName + ' ' + FirstName AS [Fullname], Title from Employees WHERE LastName LIKE 'D%'
SELECT EmployeeID, LastName + ' ' + FirstName AS [Fullname], Title from Employees WHERE LastName LIKE '%N'
SELECT EmployeeID, CONCAT(LastName, ' ', FirstName) AS [Fullname], Title from Employees WHERE LastName LIKE 'D%'
SELECT EmployeeID, LastName + ' ' + FirstName AS [Fullname], Title from Employees WHERE LastName LIKE '____'