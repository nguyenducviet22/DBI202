--transaction
--1. Viết 1 transaction 
-- 1.1.Chen dong vao bang Employees nhu sau:
--(lastname, firstname, titleOfcourtesy) (Nguyen, A, Mr.)
--1.2 Chen dong vao bang Employees nhu sau:
--(titleOfcourtesy)
--BEGIN TRANSACTION
	--cac step
--IF @@ERROR<>0
--	ROLLBACK TRANSACTION
--PRINT @@ERROR
--COMMIT TRANSACTION




--2. Viết 1 transaction 
--2.1.Lay du lieu Employees (select)
--2.2 Chen dong vao bang Employees nhu sau:
--(lastname, firstname, titleOfcourtesy) (test4, A, Mr.)
--2.3 Update Country 'USA' thanh 'My'
BEGIN TRANSACTION
	SELECT * FROM Employees

	INSERT INTO Employees(lastname, firstname, titleOfcourtesy)
	VALUES('test4', 'A', 'Mr.')

	UPDATE Employees SET Country = 'My'
	WHERE Country = 'USA'
	IF @@ERROR <> 0
	ROLLBACK TRANSACTION
	PRINT @@ERROR
COMMIT TRANSACTION

SELECT * FROM Employees
--CLuster Index




-- tao bang teater de tao Cluster Index

--view
--1. Che dau thong tin
--2. Don gian hoa nghiep vu cho user
--3. tang toc do
-- Tao view


--tao view ten nhan vien MR, kiem tra xem co chua?

-- sau khi sua trong bang doc tu dong cap nhat tren view



--tao View tenNV co tren 50 OrderID




--Bai tap


--BT1 Tạo 1 view với tên 'seafood' liệt kê những Product thuộc CategoryName là 'Seafood'



--BT2 Tạo 1 view với tên 'Supply_5_20' trong bảng table Supplier
--hiển thị các Record SupplierID từ 5 đến 20 và không 
--thuộc Country 'Germany'



--BT3 Tạo 1 view với tên 'Product1' hiển thị : ProductID, ProductName, QuantityPerUnit và UnitsInStock
--của những sản phẩm thuộc loại 'confections' và có QuantityPerUnit chứa chuỗi bag hoạc box





