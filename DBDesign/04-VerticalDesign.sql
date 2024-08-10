USE DBDESIGN_PHONEBOOK

DROP TABLE PhoneBookV1
CREATE TABLE PhoneBookV1(
	Name nvarchar (15),
	Phone char(11)
)

INSERT INTO PhoneBookV1 VALUES(N'An bro', '099x')
INSERT INTO PhoneBookV1 VALUES(N'An bro', '098x')
INSERT INTO PhoneBookV1 VALUES(N'Binh bro', '097x')
INSERT INTO PhoneBookV1 VALUES(N'Chi sis', '096x')
INSERT INTO PhoneBookV1 VALUES(N'Chi sis', '095x')
INSERT INTO PhoneBookV1 VALUES(N'Chi sis', '094x')

SELECT * FROM PhoneBookV1
-----------------------------------------------------

DROP TABLE PhoneBookV2
CREATE TABLE PhoneBookV2(
	Name nvarchar (15),
	Phone char(11),
	PhoneTpye nvarchar(20)
)

INSERT INTO PhoneBookV2 VALUES(N'An bro', '099x', 'work')
INSERT INTO PhoneBookV2 VALUES(N'An bro', '098x', 'cell')
INSERT INTO PhoneBookV2 VALUES(N'Binh bro', '097x', 'cell')
INSERT INTO PhoneBookV2 VALUES(N'Chi sis', '096x', 'work')
INSERT INTO PhoneBookV2 VALUES(N'Chi sis', '095x', 'cell')
INSERT INTO PhoneBookV2 VALUES(N'Chi sis', '094x', 'home')

SELECT * FROM PhoneBookV2