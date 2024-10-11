SELECT j.JobID, j.JobTitle, COUNT(e.EmployeeID) AS NumberOfEmployees
FROM Jobs j JOIN Employees e ON j.JobID = e.JobID
GROUP BY j.JobID, j.JobTitle
HAVING COUNT(e.JobID) >= ALL(SELECT COUNT(e.EmployeeID)
							FROM Jobs j JOIN Employees e ON j.JobID = e.JobID
							GROUP BY j.JobID, j.JobTitle)
--not jobID check again