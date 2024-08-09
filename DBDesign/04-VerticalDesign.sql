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