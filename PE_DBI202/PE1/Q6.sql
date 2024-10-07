SELECT TOP 1 j.JobID, j.JobTitle, COUNT(e.JobID) AS NumberOfEmployees
FROM Jobs j JOIN Employees e ON j.JobID = e.JobID
GROUP BY j.JobID, j.JobTitle
ORDER BY NumberOfEmployees DESC