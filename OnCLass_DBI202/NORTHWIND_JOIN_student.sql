--ôn 1. lấy thành phố của tất cả employees loại bỏ những dòng trùng lặp.
SELECT DISTINCT City
FROM Employees

--ôn 2.  Lấy 20% freight Lớn nhất và OrderID có shipcity là 'bern' trong bảng Order
SELECT TOP 20 PERCENT Freight, OrderID, ShipCity
FROM Orders
WHERE ShipCity = 'bern'
ORDER BY Freight DESC

--ôn 3. Lấy tên nhân viên là Dr. hoặc Mr.
SELECT *
FROM Employees
WHERE TitleOfCourtesy IN ('Dr.', 'Mr.')

--ôn 4. Dem so don hang cua tung khach hang, chi thong ke khach hang co tu 10 don hang tro len
SELECT CustomerID, COUNT(OrderID) AS CountOrder
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) >= 10


--joins
--vidu 1. Lay ten Khach hang va orderID cua khach hang do
SELECT c.CompanyName, o.OrderID
FROM Customers c JOIN Orders o
ON c.CustomerID = o.CustomerID

--vidu 2. Lay ten cong ty khach hang va tong soDH cua moi khach hang 
SELECT c.CompanyName, COUNT(o.OrderID)
FROM Customers c JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName

--vidu 3. Hay lay thong tin tat ca khach hang va don hang cua khach hang 
--(ca nhung khach hang chua mua hang)
SELECT *
FROM Customers c LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID

--vidu 3.1 Hay lay thong tin tat ca khach hang va don hang cua khach hang 
--(nhung khach hang da mua hang)
SELECT *
FROM Customers c JOIN Orders o
ON c.CustomerID = o.CustomerID

--vidu 3.2 Hay lay thong tin tat ca khach hang va don hang cua khach hang 
--(nhung khach hang chua mua hang)
SELECT *
FROM Customers c LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL

--vidu 4. It returns  ProductName, Companyname(Supplier) and categoryname for each product.
SELECT p.ProductName, s.CompanyName, c.CategoryID
FROM Products p JOIN Suppliers s ON p.SupplierID = s.SupplierID
				JOIN Categories c ON p.CategoryID = c.CategoryID

--1 Lay ten san pham, so luong da dat cua tung san pham
SELECT p.ProductName, COUNT(od.ProductID) AS [total Product]
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductName

--2 Lay thong tin Don hang cua cac khach hang dang song tai Torino
SELECT c.CustomerID, o.EmployeeID, o.Freight, c.City
FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.City LIKE 'Torino'

--3. Lay ten KH, ten SP ma khach hang da mua tren 2 lan
SELECT c.CompanyName, p.ProductName, COUNT(p.ProductName) AS slmua
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
				 JOIN [Order Details] od ON o.OrderID = od.OrderID
				 JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.CompanyName, p.ProductName
HAVING COUNT(p.ProductName) > 2

--4. Write a SELECT query to display total orders of every employee in 1996 as following: 
SELECT e.EmployeeID, e.LastName, e.FirstName, YEAR(OrderDate) AS [Year], COUNT(o.OrderID) AS [Total Orders]
FROM Orders o JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE YEAR(OrderDate) = 1996
GROUP BY e.EmployeeID, e.LastName, e.FirstName, YEAR(OrderDate)

--5. Write a SELECT query to display total orders of every employee in 1998 as following:(NORTWINd 1)
SELECT e.EmployeeID, e.LastName, e.FirstName, e.City, e.Country, COUNT(o.OrderID) AS [total orders]
FROM Orders o JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE YEAR(o.OrderDate) = 1998
GROUP BY e.EmployeeID, e.LastName, e.FirstName, e.City, e.Country

--6. Write a SELECT query to display total orders of every employee from 1/1/1998 to 31/7/1998 as following:(NORTWINd 1)
SELECT e.EmployeeID, e.LastName, e.FirstName, e.HireDate, COUNT(o.OrderID) AS [total Orders]
FROM Orders o JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE o.OrderDate BETWEEN '1/1/1998' AND '7/31/1998'
GROUP BY e.EmployeeID, e.LastName, e.FirstName, e.HireDate

SELECT *
FROM Orders

--7. Write a SELECT query to display total orders of every employee from 1/1/1997 to 30/6/1997 as following:(NORTWINd 1)
SELECT e.EmployeeID, e.LastName, e.FirstName, e.HireDate, e.HomePhone, COUNT(o.OrderID) AS TotalOrders
FROM Orders o JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE o.OrderDate BETWEEN '1997-1-1' AND '1997-6-30'
GROUP BY e.EmployeeID, e.LastName, e.FirstName, e.HireDate, e.HomePhone

--8. Liet ke ProductID, ProductName, CategoryName nhung Product thuoc CategoryName la 'Seafood' (NORTWINd 1)
SELECT p.ProductID, p.ProductName, c.CategoryName
FROM Products p JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName LIKE 'Seafood'

--9. Tim nhung Quantity cao nhat trong table Order Details tren ProductName (NORTWINd 1)
SELECT p.ProductID, p.ProductName, MAX(od.Quantity)
FROM [Order Details] od JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName





