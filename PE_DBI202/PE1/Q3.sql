SELECT JobID, JobTitle, min_salary
FROM Jobs
WHERE min_salary > 5000 AND JobTitle LIKE '%Manager%'
ORDER BY min_salary DESC, JobTitle ASC