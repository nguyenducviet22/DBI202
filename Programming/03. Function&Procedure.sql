CREATE DATABASE DB_PROGRAMMING
USE DB_PROGRAMMING

GO
CREATE PROCEDURE PR_Hello_1 AS 
	PRINT 'Hello World 1'
CREATE PROC PR_Hello_2 AS 
	PRINT 'Hello World 2'
GO

GO
EXECUTE PR_Hello_1
EXEC PR_Hello_2
GO
-------------------------------------------

GO
CREATE FUNCTION FN_Hello() RETURNS nvarchar(30) AS
BEGIN
	RETURN 'Hello Wortld 3'
END
GO

SELECT dbo.FN_Hello()
PRINT dbo.FN_Hello()
-----------------------------------------

GO
CREATE PROC PR_C2F @cDeg float
AS
BEGIN
	DECLARE @fDeg float = @cDeg * 1.8 + 32
	PRINT @fDeg
END
GO

EXEC PR_C2F @cDeg = 30
EXEC PR_C2F 30
---------------------------------------

GO
CREATE FUNCTION  FN_C2F(@cDeg float) RETURNS float
AS
BEGIN
	DECLARE @fDeg float = @cDeg * 1.8 + 32
	RETURN @fDeg
END
GO

PRINT CAST(dbo.FN_C2F(30) AS varchar(10)) +  ' deg F'
---------------------------------------------------------
USE Northwind
GO
CREATE PROC PR_ShowEmployeeByCity @city varchar(30)
AS
BEGIN 
	SELECT * FROM Employees WHERE City = @city
END
GO

EXEC PR_ShowEmployeeByCity 'London'
--------------------------------------

USE DB_PROGRAMMING
CREATE TABLE Event(
	ID int IDENTITY PRIMARY KEY,
	Name nvarchar (30) NOT NULL
)

INSERT INTO Event VALUES('WHITE LIES')
SELECT * FROM Event

GO
CREATE PROC PR_InsertEvent @name nvarchar(30)
AS
BEGIN
	INSERT INTO Event VALUES(@name)
END
GO

EXEC PR_InsertEvent @name = 'Tricks and Cheating in Fe'
EXEC PR_InsertEvent 'Waiting for ya'
SELECT * FROM Event