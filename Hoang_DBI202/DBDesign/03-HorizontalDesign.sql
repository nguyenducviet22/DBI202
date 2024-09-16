CREATE DATABASE DBDESIGN_PHONEBOOK
USE DBDESIGN_PHONEBOOK

DROP TABLE PhoneBook
CREATE TABLE PhoneBook(
	Name nvarchar (15),
	CellPhone char(11),
	HomePhone char(11),
	WorkPhone char(11)
)

INSERT INTO PhoneBook VALUES(N'An bro', '099x', NULL, '098x')
INSERT INTO PhoneBook VALUES(N'Binh bro', '097x', null, Null)
INSERT INTO PhoneBook VALUES(N'Chi sis', '096x', '095x', '094x')

SELECT * FROM PhoneBook