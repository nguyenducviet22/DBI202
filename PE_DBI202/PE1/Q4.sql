SELECT e.EmployeeID, e.FirstName, e.LastName, e.Salary, d.DepartmentName, l.StateProvince, c.CountryID
FROM Employees e JOIN Departments d ON e.DepartmentID = d.DepartmentID
				 JOIN Locations l ON d.LocationID = L.LocationID
				 JOIN Countries c ON l.CountryID = C.CountryID
WHERE e.Salary > 3000 AND l.StateProvince LIKE 'Washington' AND c.CountryID LIKE 'US'