USE Northwind

SELECT * from Employees
SELECT * from Employees WHERE Region IS NULL
SELECT * from Employees WHERE Region IS NOT NULL
--<=>
SELECT * from Employees WHERE NOT (Region IS NULL)