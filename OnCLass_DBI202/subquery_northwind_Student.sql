USE Northwind
-- ÔN TẬP: 
--1. Liệt kê các đơn hàng có freight từ 100 đến 500 (174 rows)
SELECT * FROM Orders
WHERE Freight BETWEEN 100 AND 500

--2. Liệt kê các đơn hàng gửi tới Mexico, Brazil, Mĩ (233 rows)
SELECT * FROM Orders
WHERE ShipCountry IN('Mexico', 'Brazil', 'USA')

--3. Liệt kê các đơn hàng không gửi tới Mexico, Brazil, Mĩ (597 rows)
SELECT * FROM Orders
WHERE ShipCountry NOT IN('Mexico', 'Brazil', 'USA')

--4. Liệt kê các đơn hàng năm 1996 ngoại trừ tháng 1 2 3 (quy I) (152 rows)
-- TOÁN TỬ IN dùng cho tập rời rạc
SELECT * FROM Orders
WHERE YEAR(OrderDate) = 1996 AND MONTH(OrderDate) NOT IN (1, 2, 3)

--5. Liệt kê các khách hàng từ Mỹ và Brazil có số fax và Region (12 rows)
SELECT * FROM Customers
WHERE Country IN ('USA', 'Brazil') AND Fax IS NOT NULL AND Region IS NOT NULL

--6. Nhân viên có tên(first name) gồm 5 kí tự (3 rows)
SELECT * FROM Employees
WHERE LEN(FirstName) = 5

--7.In ra danh sách khách hàng chưa từng mua hàng
SELECT * 
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL

SELECT c.CustomerID, COUNT(o.OrderID)
FROM Customers c FULL JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
HAVING COUNT(o.OrderID) = 0

--UNION
--INTERSECT
--EXCEPT
SELECT CustomerID FROM Customers
EXCEPT
SELECT CustomerID FROM Orders

--UNION The following SQL statement returns the German cities (only distinct values) 
--from both the "Customers" and the "Suppliers" table
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers

-- INTERSECT
SELECT City FROM Customers
INTERSECT
SELECT City FROM Suppliers

--EXCEPT
SELECT City FROM Customers
EXCEPT
SELECT City FROM Suppliers

--syntax SUBQUERY
--SELECT column_name
--FROM table_name
--WHERE column_name expression operator 
 --   ( SELECT COLUMN_NAME  from TABLE_NAME   WHERE ... );

------------ Subquery1. Single-Row ---------------------------
--Subquery trả về duy nhất một hàng kết quả. 
--Thường được sử dụng trong các mệnh đề WHERE hoặc HAVING để so sánh với một giá trị cụ thể.
--vd: subquery trả về tên product có giá trị product_id lớn nhất từ bảng products
SELECT ProductName FROM Products
WHERE ProductID = (SELECT MAX(ProductID) FROM Products)

SELECT ProductName FROM Products
WHERE ProductID >= ALL(SELECT ProductID FROM Products)

--BT: subquery trả về  order_id có giá trị Freight nhỏ nhất từ bảng Orders
SELECT OrderID FROM Orders
WHERE Freight = (SELECT MIN(Freight) FROM Orders)

SELECT OrderID FROM Orders
WHERE Freight <= ALL(SELECT Freight FROM Orders)

--BT: find employeeID having the highest amount of orders
--Non-subQ
SELECT TOP 1 EmployeeID, COUNT(OrderID) FROM Orders
GROUP BY EmployeeID
ORDER BY COUNT(OrderID) DESC

--SubQ
SELECT EmployeeID, COUNT(OrderID) FROM Orders
GROUP BY EmployeeID
HAVING COUNT(OrderID) >= ALL(SELECT COUNT(OrderID) FROM Orders
								GROUP BY EmployeeID)

--BT: find employeeName having the highest amount of orders
SELECT e.FirstName + ' ' + e.LastName AS FullName, COUNT(OrderID) 
FROM Orders o JOIN Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY e.FirstName, e.LastName
HAVING COUNT(OrderID) >= ALL (SELECT COUNT(OrderID) FROM Orders
								GROUP BY EmployeeID)

-------------- Subquery2. Multiple-Row---------------------------
--Subquery trả về nhiều hàng kết quả. 
--Thường được sử dụng với các phép toán IN, ANY hoặc ALL để so sánh với tập hợp các giá trị.
--MAX(COUNT()) ~ >= ALL
--MIN(COUNT()) ~ <= ALL

--vd1:  Subquery trong ví dụ này trả về danh sách các khách hàng đã đặt hàng vào ngày 27/8/1996
--Non-subQ
SELECT c.CompanyName
FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.OrderDate = '8/27/1996'

--Sub-Q
SELECT CompanyName FROM Customers
WHERE CustomerID IN(SELECT CustomerID FROM Orders
					WHERE OrderDate = '8/27/1996')

--vd2: Liệt kê các nhân viên có cùng City với Michael
SELECT FirstName FROM Employees
WHERE City LIKE (SELECT City FROM Employees
				WHERE FirstName LIKE 'Michael')
AND FirstName NOT LIKE 'Michael'

--BT1: subquery trả về FirstName của Employees phụ trách các Freight từ 10 đến 100 trong bảng Orders
SELECT FirstName FROM Employees
WHERE EmployeeID IN(SELECT EmployeeID FROM Orders
					WHERE Freight BETWEEN 10 AND 100)

--BT2: subquery trả về bộ cặp (EmployeeId, customerID) có freight lớn nhất theo từng ngày trong bảng Orders
SELECT e.EmployeeID, c.CustomerID
FROM Employees e JOIN Orders o ON e.EmployeeID = o.EmployeeID
				 JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.Freight IN(SELECT MAX(Freight) FROM Orders
					GROUP BY OrderDate)

--BTVN
--1 Liệt kê các đơn hàng có freight lớn hơn đơn hàng 10623
SELECT * FROM Orders
WHERE Freight > (SELECT Freight FROM Orders
				WHERE OrderID LIKE 10623)

--2. Liệt kê danh sách các công ty vận chuyển hàng
SELECT * FROM Shippers
--3. Liệt kê danh sách các đơn hàng được vận chuyển bởi công ty giao vận có mã số 1.
SELECT * FROM Orders
WHERE ShipVia LIKE 1

--4. Liệt kê danh sách các đơn hàng được vận chuyển bởi công ty giao vận có tên Speedy Express.
SELECT * FROM Orders
WHERE ShipVia LIKE (SELECT ShipperID FROM Shippers
					WHERE CompanyName LIKE 'Speedy Express')

--5. Liệt kê danh sách các đơn hàng được vận chuyển bởi công ty giao vận 
--có tên Speedy Express và freight từ 100 đến 250.
SELECT * FROM Orders
WHERE ShipVia LIKE (SELECT ShipperID FROM Shippers
					WHERE CompanyName LIKE 'Speedy Express')
				AND Freight BETWEEN 100 AND 250

--6. Liệt kê các mặt hàng cùng chủng loại với mặt hàng Filo Mix
SELECT * FROM Products
WHERE CategoryID LIKE (SELECT CategoryID FROM Products
						WHERE ProductName LIKE 'Filo Mix')

--7. Liệt kê các nhân viên lớn tuổi hơn nhân viên Janet.
SELECT * FROM Employees
WHERE YEAR(BirthDate) < (SELECT YEAR(BirthDate) FROM Employees
						WHERE FirstName LIKE 'Janet')

