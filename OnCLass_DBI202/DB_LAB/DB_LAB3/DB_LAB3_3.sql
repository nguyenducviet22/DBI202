CREATE DATABASE DB_LAB3_3
USE DB_LAB3_3

CREATE TABLE Roles(
	RoleID int PRIMARY KEY,
	name nvarchar(100),
);

CREATE TABLE Users(
	Username varchar(30) PRIMARY KEY,
	Password nvarchar(20),
	Email nvarchar(200),
	RoleID int FOREIGN KEY REFERENCES Roles(RoleID)
);

CREATE TABLE Permissions(
	permissionID int PRIMARY KEY,
	name nvarchar(50)
);

CREATE TABLE hasPermission(
	RoleID int NOT NULL,
	permissionID int NOT NULL,
	PRIMARY KEY (RoleID, permissionID),
	FOREIGN KEY (RoleID) REFERENCES Roles(RoleID),
	FOREIGN KEY (permissionID) REFERENCES Permissions(permissionID)
);