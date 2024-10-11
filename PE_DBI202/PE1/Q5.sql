SELECT l.LocationID, l.StreetAddress, l.City, l.StateProvince, l.CountryID, 
		COUNT(d.DepartmentID) AS NumberOfDepartments
FROM Departments d RIGHT JOIN Locations l ON d.LocationID = l.LocationID
GROUP BY l.LocationID, l.StreetAddress, l.City, l.StateProvince, l.CountryID
ORDER BY NumberOfDepartments DESC, LocationID ASC