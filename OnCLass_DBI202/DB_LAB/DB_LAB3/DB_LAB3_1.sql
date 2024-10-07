CREATE DATABASE DB_LAB3_1
USE DB_LAB3_1

CREATE TABLE Items (
	itemID int PRIMARY KEY,
	name nvarchar(255),
	price float
);

CREATE TABLE ItemVariant (
	variantID int PRIMARY KEY,
	detail nvarchar(200),
	color nvarchar(50),
	size nvarchar(30),
	itemID int FOREIGN KEY REFERENCES Items(itemID)
);

CREATE TABLE Categories(
	cateID int PRIMARY KEY,
	name nvarchar(255)
);

CREATE TABLE BelongTo(
	cateID int NOT NULL,
	itemID int NOT NULL,
	PRIMARY KEY (cateID, itemID),
	FOREIGN KEY(cateID) REFERENCES Categories(cateID),
	FOREIGN KEY(itemID) REFERENCES Items(itemID)
);