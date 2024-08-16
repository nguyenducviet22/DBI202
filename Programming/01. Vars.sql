GO
DECLARE @msg nvarchar(30) = 'Hello World'

PRINT @msg
SELECT @msg

DECLARE @yob int
DECLARE @yob2 int
SET @yob = 2004
SELECT @yob2 = 2005

PRINT @yob
SELECT @yob
PRINT @yob2
SELECT @yob2

GO

USE Northwind
SELECT * FROM Employees WHERE City = 'London'
GO
CREATE VIEW VW_LondonEmp AS SELECT * FROM Employees WHERE City = 'London'
GO

SELECT * FROM VW_LondonEmp

