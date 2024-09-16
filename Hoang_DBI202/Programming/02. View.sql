USE Northwind
SELECT * FROM Employees WHERE City = 'London'
GO
CREATE VIEW VW_LondonEmp AS SELECT * FROM Employees WHERE City = 'London'
GO

SELECT * FROM VW_LondonEmp

