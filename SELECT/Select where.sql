USE Northwind

SELECT * from Customers
SELECT * from Customers WHERE Country = 'USA'
SELECT * from Customers WHERE Country = 'Italy'
SELECT * from Customers WHERE Country = 'USA' OR Country = 'Italy'
SELECT * from Customers WHERE Country = 'USA' OR Country = 'Italy' ORDER BY Country
SELECT * from Customers WHERE Country != 'USA' AND Country <> 'Mexico'


SELECT * from Employees
SELECT * from Employees WHERE YEAR(BirthDate) >= 1960
SELECT * from Employees WHERE Country = 'USA' AND YEAR(GETDATE()) - YEAR(BirthDate) > 72
SELECT * from Employees WHERE Country != 'USA'
SELECT * from Employees WHERE Country <> 'USA'
SELECT * from Employees WHERE NOT(Country = 'USA')
