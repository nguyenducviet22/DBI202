--PART 1
--vidu1
--LIKE, NOT LIKE
SELECT EmployeeID, FirstName, LastName, Country
FROM Employees
WHERE Country = 'USA'

SELECT EmployeeID, FirstName, LastName, Country
FROM Employees
WHERE Country LIKE 'USA'

SELECT EmployeeID, FirstName, LastName, Country
FROM Employees
WHERE Country NOT LIKE 'USA'

--*/TOP
-- 5 row dau tien
SELECT TOP 5 *
FROM Employees

SELECT TOP 10 PERCENT *
FROM Employees

--IS NULL, IS NOT NULL
SELECT * 
FROM Orders
WHERE ShipRegion IS NULL

SELECT * 
FROM Orders
WHERE ShipRegion IS NOT NULL

--BETWEEN AND / NOT BETWEEN AND
SELECT *
FROM Orders
WHERE Freight BETWEEN 10 AND 50

SELECT *
FROM Orders
WHERE Freight NOT BETWEEN 10 AND 50

--IN,NOT IN
SELECT * FROM Employees
WHERE EmployeeID IN (1, 3, 5, 7)

SELECT * FROM Employees
WHERE EmployeeID NOT IN (1, 3, 5, 7)

--RIGHT, LEFT, LEN, SUBSTRING, LOWER, UPPER
SELECT EmployeeID, FirstName, 
LEFT(FirstName, 3) AS [Left], RIGHT(FirstName, 3) AS [Right], 
LEN(FirstName) AS [Length], SUBSTRING(FirstName,4 ,2) AS [Substring],
LOWER(FirstName) AS [Lower Case], UPPER(FirstName + ' ' + LastName)
FROM Employees

--%: 0 or many chars. _: 1 char
SELECT * FROM Employees
WHERE FirstName LIKE '_a%'

SELECT * FROM Employees
WHERE FirstName LIKE '%a%'

--ORDER BY
SELECT * FROM Employees
ORDER BY FirstName DESC, LastName DESC

--PART 2
--GROUP BY, COUNT, SUM, AVG
--HAVING

--vidu1: Hien thi bang OrderDetail sap xep theo UnitPrice giam dan
SELECT * FROM [Order Details]
ORDER BY UnitPrice DESC

--vidu2: Hien thi bang OrderDetail sap xep theo UnitPrice giam dan,
--neu cung UnitPrice thi Quantity tang dan
SELECT * FROM [Order Details]
ORDER BY UnitPrice DESC, Quantity ASC

--vidu3: Hien thi 2 bo co UnitPrice cao nhat
SELECT TOP 2* FROM [Order Details]
ORDER BY UnitPrice

--vidu4:  Dem so don hang cua tung khach hang
--COUNT,MIN,MAX, AVG, SUM
SELECT COUNT(*) FROM Customers

SELECT CustomerID, COUNT(OrderID) AS [No Orders] FROM Orders
GROUP BY CustomerID

SELECT CustomerID, OrderDate, COUNT(OrderID) AS [No Orders] FROM Orders
--WHERE CustomerID = 'VINET'
GROUP BY CustomerID, OrderDate

--vidu5: Dem so don hang cua tung khach hang, chi thong ke khach hang co tu 4 don hang tro len
--HAVING set cond for Count, Sum, ...
SELECT CustomerID, COUNT(OrderID) AS [No Orders] FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) >= 4

--vidu6: Lay OrderID, ProductID, Quantity trong bang Order Details co Unitprice giua 50 va 100 va quantity la 20
SELECT OrderID, ProductID, Quantity
FROM [Order Details]
WHERE UnitPrice BETWEEN 50 AND 100 AND Quantity = 20

--vidu7: Lay gia trung binh cua tat ca cac mat hang (Unitprice trong bang Order Details)
SELECT AVG(UnitPrice) AS avgPrice
FROM [Order Details]

SELECT ProductID, AVG(UnitPrice) AS avgPrice
FROM [Order Details]
GROUP BY ProductID
ORDER BY ProductID

--vidu8: Lay thong tin OrderID, CustomerID, Orderdate trong thang 7 nam 1996 
SELECT OrderID, CustomerID, OrderDate
FROM Orders
WHERE YEAR(OrderDate) = 1996 AND MONTH(OrderDate) = 7






