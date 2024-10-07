CREATE DATABASE DB_LAB3_5
USE DB_LAB3_5

CREATE TABLE Customers(
	SSN varchar(20) PRIMARY KEY,
	Name nvarchar(50),
	Address nvarchar(255)
);

CREATE TABLE Loans(
	LoanNumber varchar(20) PRIMARY KEY,
	Amount float,
	Date Date,
	Branch nvarchar(100),
	SSN varchar(20) FOREIGN KEY REFERENCES Customers(SSN)
);

CREATE TABLE Payments(
	PaymentNo varchar(30) NOT NULL,
	Amount float,
	Date Date,
	LoanNumber varchar(20) NOT NULL,
	PRIMARY KEY (PaymentNo, LoanNumber),
	FOREIGN KEY (LoanNumber) REFERENCES Loans(LoanNumber)
);