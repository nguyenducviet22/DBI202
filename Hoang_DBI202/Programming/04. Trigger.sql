USE DB_PROGRAMMING

--Hoang HCM lecturer
DROP TRIGGER TR_CheckInsertionOnEvent
DROP TRIGGER TR_ForbidInsertionOnEvent
DROP TRIGGER TR_LimitInsertionOnEvent

GO
CREATE TRIGGER TR_CheckInsertionOnEvent ON Event FOR INSERT
AS
BEGIN
	PRINT 'Inserted'
END	
GO

EXEC PR_InsertEvent 'Blockchain & Game'

GO
CREATE TRIGGER TR_ForbidInsertionOnEvent ON Event FOR INSERT
AS
BEGIN
	PRINT 'Insert failed'
	ROLLBACK
END
GO

EXEC PR_InsertEvent 'High Risk High Return'

GO
CREATE TRIGGER TR_LimitInsertionOnEvent ON Event FOR INSERT
AS
BEGIN
	DECLARE @NoEvent int 
	SELECT @NoEvent = COUNT(*) FROM Event
	-- PRINT @NoEvent
	IF @NoEvent > 5
	BEGIN
		PRINT 'Excessive Events'
		SELECT * FROM INSERTED
		ROLLBACK
	END
END
GO

EXEC PR_InsertEvent 'High Risk High Return'
EXEC PR_InsertEvent 'Survive in Uni Life'
SELECT * FROM Event

--Tien HN Lecturer
USE DB_PROGRAMMING
DROP TABLE Customer
CREATE TABLE Customer(
	CustomerID varchar(10) NOT NULL PRIMARY KEY,
	Name varchar(30) NOT NULL,
	Address varchar(MAX),
	Phone varchar(11),
	Email varchar(30)
)

--INSERT
DROP TRIGGER trg_insertCustomer
CREATE TRIGGER trg_insertCustomer ON Customer 
AFTER INSERT
AS
BEGIN
	SELECT * FROM inserted
	DECLARE @count int = (SELECT COUNT(*) FROM inserted)
	PRINT'Inserted ' +  CAST(@count AS varchar(MAX)) +  ' customers successfully!'
END

DELETE FROM Customer
INSERT INTO Customer VALUES
('CT01', 'Nguyen An', 'TP HCM', '012345', 'na@gmail.com'),
('CT02', 'Vu Binh', 'TP HCM', '012345', 'vb@gmail.com'),
('CT03', 'Pham Chi', 'TP HCM', '012345', 'pc@gmail.com'),
('CT04', 'Tran Duong', 'TP HCM', '012345', 'td@gmail.com'),
('CT05', 'Tran Duc', 'TP HCM', '012345', 'td@gmail.com')


--DELETE
DROP TRIGGER trg_deleteCustomer
CREATE TRIGGER trg_deleteCustomer ON Customer 
AFTER DELETE
AS
BEGIN
	SELECT * FROM deleted
	SELECT  CustomerID INTO #temp FROM deleted
	DECLARE @count int = (SELECT COUNT(*) FROM deleted)
	IF @count > 0
	BEGIN
		PRINT 'Deleted ' +  CAST(@count AS varchar(MAX)) +  ' customers successfully!'
		DECLARE @id varchar(MAX)
		WHILE (SELECT COUNT(*) FROM #temp) > 0
		BEGIN
			SELECT TOP 1 @id = CustomerID FROM #temp
			PRINT @id
			DELETE FROM #temp WHERE CustomerID = @id
		END
	END
	ELSE
	BEGIN
		PRINT 'Delete failed'
	END
END

DELETE FROM Customer
WHERE CustomerID = 'CT03' OR CustomerID = 'CT05'
DELETE FROM Customer
WHERE CustomerID = 'CT06'
DELETE FROM Customer
WHERE CustomerID IN ('CT01', 'CT02', 'CT04')

SELECT * FROM Customer

--EXE
CREATE TABLE Orders(
	OrderID varchar(10) NOT NULL PRIMARY KEY,
	Date date,
	CustomerID varchar(10) NOT NULL,
	Amount DECIMAL(10,2),
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
)
--Update Customer -> Show bf and af updating
CREATE TRIGGER trg_updateCustomer ON Customer
AFTER UPDATE
AS
BEGIN
	SELECT * FROM deleted
	SELECT * FROM inserted
END

--Update Order -> create orderHist table to show orderInfo and editDate
CREATE TABLE OrderHist(
	OrderID varchar(10) NOT NULL PRIMARY KEY,
	Date date,
	CustomerID varchar(10) NOT NULL,
	Amount DECIMAL(10,2),
	EditDate date,
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
)

CREATE TRIGGER trg_editOrderHist ON Orders
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
	INSERT INTO OrderHist
		SELECT *, GETDATE() FROM deleted
		UNION
		SELECT *, GETDATE() FROM inserted
END

--Update Product -> if price < stock