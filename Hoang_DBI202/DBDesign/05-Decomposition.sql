USE DBDESIGN_PHONEBOOK

DROP TABLE PersonV3
CREATE TABLE PersonV3(
	Name nvarchar(15),
	Title nvarchar(15),
	Company nvarchar(20)
)

DROP TABLE PhoneBookV3
CREATE TABLE PhoneBookV3(
	Phone char(11),
	PhoneTpye nvarchar(20),
	Name nvarchar(15)
)

INSERT INTO PersonV3 VALUES(N'An bro', 'Manager', 'FS')
INSERT INTO PersonV3 VALUES(N'Binh bro', 'Co-worker', 'FS')
INSERT INTO PersonV3 VALUES(N'Chi sis', 'Leader', 'FS')

INSERT INTO PhoneBookV3 VALUES('099x', 'work', N'An bro')
INSERT INTO PhoneBookV3 VALUES('098x', 'cell', N'An bro')
INSERT INTO PhoneBookV3 VALUES('097x', 'cell', N'Binh bro')
INSERT INTO PhoneBookV3 VALUES('096x', 'work', N'Chi sis')
INSERT INTO PhoneBookV3 VALUES('095x', 'cell', N'Chi sis')
INSERT INTO PhoneBookV3 VALUES('094x', 'home', N'Chi sis')

SELECT * FROM PersonV3
SELECT * FROM PhoneBookV3