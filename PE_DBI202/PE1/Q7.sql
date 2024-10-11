SELECT e.EmployeeID, e.FirstName, e.LastName, e.Salary, 
	d.DepartmentID, d.DepartmentName, 
	COUNT(e.EmployeeID) AS NumberOfSubordinates
FROM Employees e JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 10000
GROUP BY e.EmployeeID, e.FirstName, e.LastName, e.Salary, 
		d.DepartmentID, d.DepartmentName, e.ManagerID
HAVING COUNT(e.ManagerID) > 0
ORDER BY NumberOfSubordinates DESC--, e.LastName ASC

SELECT e.EmployeeID, e.FirstName, e.LastName, e.Salary, 
	d.DepartmentID, d.DepartmentName
FROM Employees e JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE EmployeeID IN(SELECT DISTINCT ManagerID FROM Employees
					WHERE ManagerID IS NOT NULL)
OR Salary > 10000

SELECT COUNT(EmployeeID) FROM Employees
GROUP BY ManagerID

--CHECK AGAIN

--Q10
