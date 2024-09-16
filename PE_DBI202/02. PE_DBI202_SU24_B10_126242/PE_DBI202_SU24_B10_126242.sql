USE PE_DBI202_F2021

--Q2
SELECT *
FROM ProductSubcategory ps
WHERE ps.Category = 'Accessories'

--Q3
SELECT pi.ProductID, pi.LocationID, pi.Quantity
FROM ProductInventory pi
WHERE pi.LocationID = 7 AND pi.Quantity >= 252
ORDER BY pi.Quantity DESC

--Q4
SELECT p.ProductID, p.Name, p.Color, p.Cost, p.Price,
l.LocationID, l.Name, pi.Shelf, pi.Bin, pi.Quantity
FROM Product p
LEFT JOIN ProductInventory pi ON p.ProductID = pi.ProductID
LEFT JOIN Location l ON pi.LocationID = l.LocationID
WHERE p.Color = 'Yellow' AND p.Cost < 400