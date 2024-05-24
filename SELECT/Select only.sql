SELECT * FROM Customers

SELECT * FROM Employees

SELECT GETDATE()

SELECT GETDATE() AS [Today]

SELECT MONTH(GETDATE()) AS [Month]

SELECT YEAR(GETDATE()) - 2004
SELECT N'Duc ' + N'Viet is ' + CONVERT (VARCHAR, (YEAR(GETDATE()) - 2004)) + N' years old.'
SELECT N'Duc ' + N'Viet is ' + CAST ((YEAR(GETDATE()) - 2004) AS varchar) + N' years old.'