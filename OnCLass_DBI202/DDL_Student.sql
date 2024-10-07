--https://www.techonthenet.com/sql/index.php
--1.TAO DATABASE=> Giống như việc tạo ra 1 cái phòng, trong phòng chứa nhiều tủ, 
-- mỗi tủ là 1 table(relation)
CREATE DATABASE SE1835;
DROP DATABASE SE1835;
USE SE1835;

--2. TABLE
--2.1 TAO TABLE  => tạo ra tủ đựng đồ mà mỗi attribute là 1 ngăn tủ
--CREATE TABLE tableName 
--   ( fieldname1 datatype [integrity_constraints],
--     fieldname2 datatype [integrity_constraints],
--    ….)
CREATE DATABASE EmployeeMS
GO
USE EmployeeMS

CREATE TABLE Employees(
	EmpID int IDENTITY(1,1) PRIMARY KEY,
	EmpName nvarchar(50) NOT NULL,
	Phone nchar(12) UNIQUE,
	DOB date CHECK(YEAR(GETDATE()) - YEAR(DOB) >= 18),
	Addr nvarchar(50) DEFAULT N'Ho Chi Minh'
);

CREATE TABLE Department(
	DepID int PRIMARY KEY,
	DepName nvarchar(50)
);

-- Add more columns
--ALTER TABLE tableName
--ADD columnName datatype [constraint]
ALTER TABLE Employees
ADD DepID int FOREIGN KEY REFERENCES Department(DepID)

ALTER TABLE Department
ADD ManagerID int FOREIGN KEY REFERENCES Employees(EmpID)

ALTER TABLE Employees
ADD SupervisorID int FOREIGN KEY REFERENCES Employees(EmpID)

--thêm constraint khóa chính khóa ngoại và check
--ALTER TABLE tablename 
--ADD CONSTRAINT constraintName FOREIGN KEY (<attribute list>)
-- REFERENCES parentTableName (<attribute list>);
CREATE TABLE Project(
	ProjID int NOT NULL,
	ProjName nvarchar(50)
);

ALTER TABLE Project
ADD CONSTRAINT ProjID PRIMARY KEY (ProjID)

ALTER TABLE Project
ADD DepID int FOREIGN KEY REFERENCES Department(DepID)

--2.2Tạo table và khóa chính, khóa ngoại trực tiếp

--2.3  THEM GIA TRI VAO TABLE => đặt quần áo vào tủ
--INSERT INTO tableName(<listOfFields>)
--VALUES  (<value 1>, ... <value m>)
INSERT INTO Department(DepID, DepName)
VALUES (1, N'Accounting'),
		(2, 'HR'),
		(3, 'IT');

INSERT INTO Employees(EmpName, Phone, Addr)
VALUES (N'Nguyen Van Anh', 123, NULL),
		('Tran Anh Binh', 456, 'Ha Noi'),
		('Pham Lan Chi', 789, 'Can Tho');

--2.4 Remove columns
--ALTER TABLE tableName
--DROP columnName datatype [constraint]

--Modify data type

--ALTER TABLE tableName
--ALTER columnName datatype [constraint]

--2.5
--UPDATE
UPDATE Employees
SET Addr = 'Ha Noi'
WHERE EmpName = N'Nguyen Van Anh'

--DELETE
DELETE 
FROM Employees
WHERE Addr LIKE 'Ha Noi'

USE Northwind
SELECT *
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL

DELETE 
FROM Customers
WHERE CustomerID IN(SELECT c.CustomerID
	FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
	WHERE o.OrderID IS NULL)








