CREATE DATABASE DB_FUMS
GO
USE DB_FUMS

CREATE TABLE Major(
	MajorID nvarchar(10) PRIMARY KEY,
	MajorName nvarchar(255)
);

CREATE TABLE Department(
	DepartmentID nvarchar(10) PRIMARY KEY,
	DepartmentName nvarchar(255)
);

CREATE TABLE Classroom(
	ClassID nvarchar(10) PRIMARY KEY, 
	RoomNumber int
);
ALTER TABLE Classroom
ADD CONSTRAINT UQ_RoomNumber UNIQUE (RoomNumber)

CREATE TABLE Lecturer(
	LecturerID nvarchar(10) PRIMARY KEY, 
	FirstName nvarchar(10), 
	LastName nvarchar(20), 
	Title nvarchar(10), 
	Email nvarchar(30), 
	Phone nvarchar(10), 
	DepartmentID nvarchar(10) FOREIGN KEY REFERENCES Department(DepartmentID)
);
ALTER TABLE Lecturer
ADD CONSTRAINT UQ_Email UNIQUE (Email);
ALTER TABLE Lecturer
ADD CONSTRAINT UQ_Phone UNIQUE (Phone);

CREATE TABLE Student(
	StudentID nvarchar(10) PRIMARY KEY,
	FirstName nvarchar(10), 
	LastName nvarchar(20), 
	DOB Date, 
	Gender nvarchar(6), 
	Email nvarchar(30), 
	Phone nvarchar(10), 
	Address nvarchar(255),
	MajorID nvarchar(10) FOREIGN KEY REFERENCES Major(MajorID)
);

--DROP TABLE Course
CREATE TABLE Course(
	CourseID nvarchar(10) PRIMARY KEY, 
	CourseName nvarchar(255), 
	LecturerID nvarchar(10) FOREIGN KEY REFERENCES Lecturer(LecturerID),
	ClassID nvarchar(10) FOREIGN KEY REFERENCES Classroom(ClassID)
);

--DROP TABLE enrolls
CREATE TABLE enrolls(
	StudentID nvarchar(10) NOT NULL,
	CourseID nvarchar(10) NOT NULL,
	PRIMARY KEY (StudentID, CourseID),
	FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
	FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

--DROP TABLE Grade
CREATE TABLE Grade(
	GradeValue float, 
	DateGraded Date, 
	StudentID nvarchar(10) NOT NULL, 
	CourseID nvarchar(10) NOT NULL,
	PRIMARY KEY (StudentID, CourseID),
	FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
	FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Major (MajorID, MajorName)
VALUES 
    ('M01', 'Computer Science'),
    ('M02', 'Electrical Engineering'),
    ('M03', 'Business Administration'),
    ('M04', 'Mechanical Engineering');

INSERT INTO Department (DepartmentID, DepartmentName)
VALUES
    ('D01', 'Computer Science Department'),
    ('D02', 'Electrical Engineering Department'),
    ('D03', 'Business Department'),
    ('D04', 'Mechanical Engineering Department');

INSERT INTO Classroom (ClassID, RoomNumber)
VALUES
    ('C01', 101),
    ('C02', 102),
    ('C03', 201),
    ('C04', 202);

INSERT INTO Lecture (LecturerID, FirstName, LastName, Title, Email, Phone, DepartmentID)
VALUES
    ('L01', 'John', 'Smith', 'Dr.', 'jsmith@univ.edu', '1234567890', 'D01'),
    ('L02', 'Jane', 'Doe', 'Prof.', 'jdoe@univ.edu', '1234567891', 'D02'),
    ('L03', 'Michael', 'Brown', 'Dr.', 'mbrown@univ.edu', '1234567892', 'D03'),
    ('L04', 'Emily', 'White', 'Prof.', 'ewhite@univ.edu', '1234567893', 'D04');

INSERT INTO Lecture (LecturerID, FirstName, LastName, Title, Email, Phone, DepartmentID)
VALUES
    ('L05', 'Linda', 'Taylor', 'Dr.', 'ltaylor@univ.edu', '1234567804', 'D01'),
    ('L06', 'Robert', 'Miller', 'Prof.', 'rmiller@univ.edu', '1234567805', 'D02'),
    ('L07', 'Nancy', 'Garcia', 'Dr.', 'ngarcia@univ.edu', '1234567806', 'D03'),
    ('L08', 'Charles', 'Moore', 'Prof.', 'cmoore@univ.edu', '1234567807', 'D04');

INSERT INTO Student (StudentID, FirstName, LastName, DOB, Gender, Email, Phone, Address, MajorID)
VALUES
    ('S01', 'Alice', 'Johnson', '2002-03-15', 'Female', 'alice.johnson@univ.edu', '1234567894', '123 Main St', 'M01'),
    ('S02', 'Bob', 'Williams', '2001-07-22', 'Male', 'bob.williams@univ.edu', '1234567895', '456 Oak St', 'M02'),
    ('S03', 'Catherine', 'Davis', '2000-11-30', 'Female', 'catherine.davis@univ.edu', '1234567896', '789 Pine St', 'M03'),
    ('S04', 'David', 'Wilson', '2002-05-18', 'Male', 'david.wilson@univ.edu', '1234567897', '321 Elm St', 'M04');

INSERT INTO Student (StudentID, FirstName, LastName, DOB, Gender, Email, Phone, Address, MajorID)
VALUES
    ('S05', 'Eve', 'Martinez', '2002-09-12', 'Female', 'eve.martinez@univ.edu', '1234567898', '987 Maple St', 'M01'),
    ('S06', 'Frank', 'Thomas', '2001-02-19', 'Male', 'frank.thomas@univ.edu', '1234567899', '654 Birch St', 'M02'),
    ('S07', 'Grace', 'Lee', '2000-06-25', 'Female', 'grace.lee@univ.edu', '1234567800', '543 Cedar St', 'M03'),
    ('S08', 'Henry', 'Clark', '2002-01-30', 'Male', 'henry.clark@univ.edu', '1234567801', '789 Spruce St', 'M04'),
    ('S09', 'Ivy', 'King', '2001-10-10', 'Female', 'ivy.king@univ.edu', '1234567802', '222 Maple St', 'M01'),
    ('S10', 'Jake', 'Scott', '2003-03-05', 'Male', 'jake.scott@univ.edu', '1234567803', '111 Oak St', 'M02');

INSERT INTO Course (CourseID, CourseName, LecturerID, ClassID)
VALUES
    ('CO01', 'Introduction to Computer Science', 'L01', 'C01'),
    ('CO02', 'Electrical Circuits', 'L02', 'C02'),
    ('CO03', 'Principles of Management', 'L03', 'C03'),
    ('CO04', 'Thermodynamics', 'L04', 'C04');

INSERT INTO enrolls (StudentID, CourseID)
VALUES
    ('S01', 'CO01'),
    ('S02', 'CO02'),
    ('S03', 'CO03'),
    ('S04', 'CO04'),
    ('S01', 'CO03'),  -- Student Alice also enrolled in "Principles of Management"
    ('S02', 'CO01');  -- Student Bob also enrolled in "Introduction to Computer Science"

INSERT INTO Grade (GradeValue, DateGraded, StudentID, CourseID)
VALUES
    (95.5, '2024-06-15', 'S01', 'CO01'),
    (89.0, '2024-06-15', 'S02', 'CO02'),
    (78.0, '2024-06-15', 'S03', 'CO03'),
    (85.0, '2024-06-15', 'S04', 'CO04'),
    (90.0, '2024-06-15', 'S01', 'CO03'),  -- Alice's grade for Principles of Management
    (88.0, '2024-06-15', 'S02', 'CO01');  -- Bob's grade for Introduction to CS

INSERT INTO Grade (GradeValue, DateGraded, StudentID, CourseID)
VALUES
    (91.0, '2024-06-20', 'S05', 'CO01'),  -- Eve's grade for Introduction to CS
    (88.0, '2024-06-20', 'S06', 'CO02'),  -- Frank's grade for Electrical Circuits
    (76.5, '2024-06-20', 'S07', 'CO03'),  -- Grace's grade for Principles of Management
    (83.0, '2024-06-20', 'S08', 'CO04'),  -- Henry's grade for Thermodynamics
    (89.5, '2024-06-20', 'S09', 'CO01'),  -- Ivy's grade for Introduction to CS
    (86.0, '2024-06-20', 'S10', 'CO02'),  -- Jake's grade for Electrical Circuits
    (85.5, '2024-06-21', 'S05', 'CO03'),  -- Eve's grade for Principles of Management
    (80.0, '2024-06-21', 'S06', 'CO04'),  -- Frank's grade for Thermodynamics
    (88.0, '2024-06-21', 'S07', 'CO01'),  -- Grace's grade for Introduction to CS
    (82.5, '2024-06-21', 'S08', 'CO02'),  -- Henry's grade for Electrical Circuits
    (91.0, '2024-06-21', 'S09', 'CO03'),  -- Ivy's grade for Principles of Management
    (85.0, '2024-06-21', 'S10', 'CO04');  -- Jake's grade for Thermodynamics
