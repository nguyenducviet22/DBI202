CREATE DATABASE DB_LAB4
GO
USE DB_LAB4

CREATE TABLE Departments(
	DeptID varchar(4) PRIMARY KEY,
	Name nvarchar(50) NOT NULL,
	NoOfStudents int
);

CREATE TABLE Students(
	StudentID varchar(4) PRIMARY KEY,
	LastName nvarchar(30),
	FirstName nvarchar(10),
	Sex varchar(1) CHECK(Sex IN ('M', 'F')),
	DateOfBirth date,
	PlaceOfBirth nvarchar(30),
	DeptID varchar(4) FOREIGN KEY REFERENCES Departments(DeptID),
	Scholarship float,
	AverageScore numeric(4, 2)
);

CREATE TABLE Courses(
	CourseID varchar(4) PRIMARY KEY,
	Name nvarchar(35),
	Credits tinyint
);

CREATE TABLE Results(
	StudentID varchar(4) NOT NULL,
	CourseID varchar(4) NOT NULL,
	Year int NOT NULL,
	Semester int NOT NULL,
	Mark float,
	Grade varchar(6),
	PRIMARY KEY (StudentID, CourseID, Year, Semester),
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

UPDATE Departments
SET NoOfStudents = (
    SELECT COUNT(*)
    FROM Students
    WHERE Students.DeptID = Departments.DeptID
);

UPDATE Departments
SET NoOfStudents = (SELECT COUNT(*) FROM Students
					GROUP BY DeptID)
WHERE dep


UPDATE Departments
SET NoOfStudents = NULL
WHERE NoOfStudents = 0

UPDATE Results
SET Grade = NULL
WHERE Grade = 0

SELECT * FROM Departments
SELECT * FROM Students
SELECT * FROM Courses
SELECT * FROM Results

