SELECT e.EmployeeID, e.FirstName, e.LastName, e.Salary, d.DepartmentID, d.DepartmentName, COUNT(e.ManagerID) AS NumberOfSubordinates
FROM Employees e JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 10000
GROUP BY e.EmployeeID, e.FirstName, e.LastName, e.Salary, d.DepartmentID, d.DepartmentName
HAVING COUNT(e.ManagerID) > 0
ORDER BY NumberOfSubordinates DESC--, e.LastName ASC

SELECT * FROM Employees
SELECT * FROM Departments