USE PE_DBI202_Su2024_B5
--Q2
SELECT *
FROM Employees e
WHERE e.Position = 'Mechanic' OR e.Position = 'Driver'

--Q3
SELECT c.CarID, c.Maker, c.Model, c.Year, c.LicensePlate, c.Status,
rl.RentalLocationID, rl.LocationName
FROM Cars c
JOIN RentalLocations rl ON c.CurrentLocationID = rl.RentalLocationID
WHERE c.status = 'Available' 
AND (rl.LocationName = 'Waterfront' OR rl.LocationName = 'Central Park')

--Q4
SELECT r.RentalID, r.RentalDate, c.CarID, c.Maker, c.Model,
cc.CategoryName, rl.LocationName
FROM Rentals r
JOIN Cars c ON r.CarID = c.CarID
JOIN CarCategories cc ON c.CategoryID = cc.CategoryID
JOIN RentalLocations rl ON r.RentalLocationID = rl.RentalLocationID
WHERE YEAR(r.RentalDate) = 2020 AND rl.LocationName = 'Westside Depot'
ORDER BY r.RentalDate DESC
