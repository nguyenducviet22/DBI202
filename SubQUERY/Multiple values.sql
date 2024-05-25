USE Northwind

SELECT * from Categories
SELECT * from Products 
		WHERE CategoryID IN 
		(SELECT CategoryID from Categories 
							WHERE CategoryName = 'Beverages' OR CategoryName = 'Meat/Poultry' OR CategoryName = 'Seafood')

SELECT * from Products 
		WHERE CategoryID IN 
		(SELECT CategoryID from Categories 
							WHERE CategoryName IN('Beverages', 'Meat/Poultry', 'Seafood'))

--Select all Orders of Employees from London
SELECT * from Employees
SELECT EmployeeID from Employees WHERE City = 'London'
SELECT * from Orders WHERE EmployeeID IN (SELECT EmployeeID from Employees WHERE City = 'London')