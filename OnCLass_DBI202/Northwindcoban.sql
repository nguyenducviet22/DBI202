--PART 1
--Exe 1
SELECT LOWER(LastName + ' ' + FirstName) AS [Full name], titleOfCourtesy FROM Employees 
--Exe 2
SELECT UPPER(LastName + ' ' + FirstName) AS [Full name] FROM Employees
--Exe 3
SELECT EmployeeID, LastName, FirstName, Title, City, Country FROM Employees
WHERE Country = 'USA'
--Exe 4
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Country FROM Customers
WHERE Country = 'UK'
--Exe 5
SELECT CustomerID, CompanyName, Address, City, Country FROM Customers
WHERE Country = 'Mexico'
--Exe 6
SELECT CustomerID, CompanyName, Phone, Address, City, Country FROM Customers
WHERE Country = 'Sweden'
--Exe 7
SELECT ProductID, ProductName, UnitPrice, UnitsInStock FROM Products
WHERE UnitsInStock BETWEEN 5 AND 10
--Exe 8
SELECT ProductID, ProductName, UnitPrice, ReorderLevel, UnitsOnOrder FROM Products
WHERE UnitsOnOrder BETWEEN 60 AND 100

--PART 2
--1. SELECT
--C1
SELECT CategoryID, CategoryName, Description FROM Categories
ORDER BY CategoryName DESC
--C2
SELECT DISTINCT City FROM Customers
--C3
SELECT ProductName, UnitPrice, UnitsInStock FROM Products
ORDER BY UnitPrice DESC, UnitsInStock DESC
--C4
SELECT OrderID, Freight FROM Orders
WHERE Freight < 50
--C5
SELECT * FROM Employees
WHERE City LIKE 'London'
--C6
SELECT * FROM Employees
WHERE FirstName LIKE 'A%'
--C7
SELECT * FROM Employees
WHERE YEAR(BirthDate) BETWEEN 1950 AND 1960
--C8
SELECT CompanyName, RIGHT(Phone, 8) FROM Shippers
SELECT CompanyName, SUBSTRING(Phone, 7, 14) FROM Shippers
--C9
SELECT EmployeeID, LastName, FirstName, Title, HomePhone FROM Employees
WHERE HomePhone LIKE '%4444'
--C10
SELECT EmployeeID, LastName, FirstName, Title, HomePhone, City FROM Employees
WHERE City IN ('Tacoma', 'Seattle')
--C11
SELECT EmployeeID, LastName, FirstName, Title, HomePhone, City FROM Employees
WHERE TitleOfCourtesy IN ('Mr.', 'Ms.')
--C12
SELECT SupplierID, CompanyName, ContactName, Phone, Fax FROM Suppliers
WHERE (SupplierID BETWEEN 5 AND 20) AND Fax IS NOT NULL
--C13
SELECT SupplierID, CompanyName, City, Country FROM Suppliers
WHERE Country IN ('Germany', 'Australia', 'Denmark')
--C14
SELECT SupplierID, CompanyName, City, Country FROM Suppliers
WHERE (SupplierID BETWEEN 5 AND 20) AND Country NOT LIKE 'Germany'
--C15
SELECT SupplierID, CompanyName, ContactName FROM Suppliers
WHERE SupplierID < 10 OR SupplierID > 20
SELECT SupplierID, CompanyName, ContactName FROM Suppliers
WHERE SupplierID NOT BETWEEN 10 AND 20
--C16
SELECT * FROM Products
WHERE UnitPrice < 20 AND UnitsInStock > 30
--C17
SELECT ProductID, ProductName, SupplierID, CategoryID FROM Products
WHERE CategoryID = '1' AND ProductName NOT LIKE 'Chang'
--C18
SELECT p.ProductID, p.ProductName, c.CategoryName FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE CategoryName LIKE 'Seafood'
--C19
SELECT ProductID, ProductName, QuantityPerUnit, UnitsInStock, CategoryName FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE CategoryName LIKE 'confections' AND 
(QuantityPerUnit LIKE '%boxes%' OR QuantityPerUnit LIKE '%bags%')
--C20
SELECT * FROM Products
WHERE ProductName LIKE '%Chef%'
--C21
SELECT * FROM Products
WHERE ProductName LIKE 'Queso%Pastora'
--C22
SELECT RegionID, COUNT(*) AS TerritoryPerRegion FROM Territories
GROUP BY RegionID
--C23
SELECT COUNT(*) FROM Customers
WHERE Fax IS NULL
--C24
SELECT * FROM Customers
WHERE LEN(CompanyName) < 10
--C25
SELECT TOP 1 * FROM [Order Details]
ORDER BY UnitPrice DESC, Quantity DESC
--C26
SELECT ProductID, MAX(UnitPrice) AS MaxUnitPrice, MAX(Quantity) AS MaxQuantity FROM [Order Details] od
GROUP BY ProductID
--C27
SELECT AVG(UnitPrice) AS AvgUnitPrice FROM [Order Details]
--C28
SELECT p.ProductName, od.Quantity AS MaxQuantity FROM [Order Details] od
JOIN Products p ON od.ProductID = p.ProductID
WHERE Quantity = (SELECT TOP 1 Quantity FROM [Order Details]
ORDER BY Quantity DESC)
--C29
SELECT DISTINCT CategoryID, UnitsInStock FROM Products
WHERE UnitsInStock = (SELECT MIN(UnitsInStock) FROM Products)
--C30
SELECT CategoryID, AVG(UnitPrice) AS AvgUnitPrice FROM Products
GROUP BY CategoryID
HAVING AVG(UnitPrice) BETWEEN 20 AND 30