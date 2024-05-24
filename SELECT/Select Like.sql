USE Northwind

SELECT * from Employees

SELECT * from Employees WHERE LastName LIKE 'D%'

SELECT EmployeeID, LastName + ' ' + FirstName AS [Fullname], Title from Employees WHERE LastName LIKE 'D%'
SELECT EmployeeID, LastName + ' ' + FirstName AS [Fullname], Title from Employees WHERE LastName LIKE '%N'
SELECT EmployeeID, CONCAT(LastName, ' ', FirstName) AS [Fullname], Title from Employees WHERE LastName LIKE 'D%'
SELECT EmployeeID, LastName + ' ' + FirstName AS [Fullname], Title from Employees WHERE LastName LIKE '____'

SELECT * from Products WHERE ProductName LIKE '%_____' --greater than 5 chars
SELECT * from Products WHERE ProductName LIKE '% _____' OR ProductName LIKE '_____' --last word has 5 chars