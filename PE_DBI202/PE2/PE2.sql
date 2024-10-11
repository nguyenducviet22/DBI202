USE PE2
--Q1
CREATE TABLE Category(
	ID int PRIMARY KEY,
	CategoryName nvarchar(30)
);

CREATE TABLE SubCategory(
	ID int PRIMARY KEY,
	SubCategoryName nvarchar(30),
	CategoryID int FOREIGN KEY REFERENCES Category(ID)
);

CREATE TABLE Product(
	ID int PRIMARY KEY,
	ProductName nvarchar(30),
	UnitPrice float,
	SubCategoryID int FOREIGN KEY REFERENCES SubCategory(ID)
);

CREATE TABLE Customer(
	ID int PRIMARY KEY,
	CustomerName nvarchar(30),
	Segment nvarchar(30),
	Country nvarchar(30), 
	City nvarchar(30), 
	State nvarchar(30), 
	PostalCode nvarchar(30), 
	Region nvarchar(30)
);

CREATE TABLE Orders(
	ID varchar(30) PRIMARY KEY,
	OrderDate date,
	ShipDate date,
	ShipMode nvarchar(30),
	CustomerID int FOREIGN KEY REFERENCES Customer(ID)
);

CREATE TABLE OrderDetails(
	OrderID varchar(30) NOT NULL,
	ProductID int NOT NULL,
	SalePrice float,
	Quantity int,
	Discount float,
	Profit float,
	PRIMARY KEY (OrderID, ProductID),
	FOREIGN KEY (OrderID) REFERENCES Orders(ID),
	FOREIGN KEY (ProductID) REFERENCES Product(ID)
);

--Q2
SELECT ID, CustomerName, Segment, Country, City, State, PostalCode, Region
FROM Customer
WHERE City LIKE 'Arlington'

--Q3
SELECT c.ID, c.CustomerName, c.Segment, c.Country, c.City, c.State, c.PostalCode, c.Region
FROM Customer c JOIN Orders o ON c.ID = o.CustomerID 
WHERE CustomerName LIKE 'B%' 
AND YEAR(o.OrderDate) = 2017 AND MONTH(o.OrderDate) = 12
ORDER BY Segment DESC, CustomerName ASC

--Q4
SELECT sc.ID, sc.SubCategoryName, COUNT(p.ID) AS NumberOfProducts
FROM Product p JOIN SubCategory sc ON p.SubCategoryID = sc.ID
GROUP BY sc.ID, sc.SubCategoryName
HAVING COUNT(p.ID) > 100
ORDER BY NumberOfProducts DESC

--Q5
SELECT od.ProductID, p.ProductName, od.Quantity 
FROM Product p JOIN OrderDetails od ON p.ID = od.ProductID
WHERE od.Quantity = (SELECT MAX(Quantity) FROM OrderDetails)

SELECT od.ProductID, p.ProductName, od.Quantity 
FROM Product p JOIN OrderDetails od ON p.ID = od.ProductID
WHERE od.Quantity >= ALL(SELECT Quantity FROM OrderDetails)

--Q6 CHECK AGAIN
SELECT o.CustomerID, c.CustomerName, COUNT(o.ID) AS NumberOfOrders
FROM Customer c JOIN Orders o ON c.ID = o.CustomerID 
GROUP BY o.CustomerID, c.CustomerName
HAVING COUNT(o.ID) >= ALL(SELECT COUNT(ID) FROM Orders
							GROUP BY CustomerID)

--Q7
	SELECT * FROM(
		SELECT TOP 5 *
		FROM Product 
		ORDER BY UnitPrice DESC) AS Top5
UNION
	SELECT * FROM(
		SELECT TOP 5 *
		FROM Product 
		ORDER BY UnitPrice ASC) AS Bot5
ORDER BY UnitPrice DESC
