USE DBDESIGN_PHONEBOOK

DROP TABLE PersonV4
CREATE TABLE PersonV4(
	Name nvarchar(15),
	Title nvarchar(15),
	Company nvarchar(20)
)

DROP TABLE PhoneTypeV4
CREATE TABLE PhoneTypeV4(
	TpyeName nvarchar(20)
)
ALTER TABLE PhoneTypeV4 ALTER COLUMN TpyeName nvarchar(20) NOT NULL
ALTER TABLE PhoneTypeV4 ADD CONSTRAINT PK_PHONETYPEV4 PRIMARY KEY(TpyeName)

DROP TABLE PhoneBookV4
CREATE TABLE PhoneBookV4(
	Phone char(11),
	TpyeName nvarchar(20) REFERENCES PhoneTypeV4(TpyeName),
	Name nvarchar(15)
)

INSERT INTO PhoneTypeV4 VALUES('Mobile')
INSERT INTO PhoneTypeV4 VALUES('Work')
INSERT INTO PhoneTypeV4 VALUES('Home')

INSERT INTO PersonV4 VALUES(N'An bro', 'Manager', 'FS')
INSERT INTO PersonV4 VALUES(N'Binh bro', 'Co-worker', 'FS')
INSERT INTO PersonV4 VALUES(N'Chi sis', 'Leader', 'FS')

INSERT INTO PhoneBookV4 VALUES('099x', 'work', N'An bro')
INSERT INTO PhoneBookV4 VALUES('098x', 'mobile', N'An bro')
INSERT INTO PhoneBookV4 VALUES('097x', 'mobile', N'Binh bro')
INSERT INTO PhoneBookV4 VALUES('096x', 'work', N'Chi sis')
INSERT INTO PhoneBookV4 VALUES('095x', 'mobile', N'Chi sis')
INSERT INTO PhoneBookV4 VALUES('094x', 'home', N'Chi sis')

SELECT * FROM PersonV4
SELECT * FROM PhoneBookV4
SELECT * FROM PhoneTypeV4

-------------------------------------------------------------
DROP TABLE PersonV4_1
CREATE TABLE PersonV4_1(
	NameContact nvarchar(15) PRIMARY KEY,
	Title nvarchar(15),
	Company nvarchar(20)
)

DROP TABLE PhoneTypeV4_1
CREATE TABLE PhoneTypeV4_1(
	TpyeName nvarchar(20) NOT NULL,
	PRIMARY KEY (TpyeName)
)

DROP TABLE PhoneBookV4_1
CREATE TABLE PhoneBookV4_1(
	Phone char(11) NOT NULL,
	TpyeName nvarchar(20) REFERENCES PhoneTypeV4_1(TpyeName),
	Name nvarchar(15) REFERENCES PersonV4_1(NameContact),
	CONSTRAINT PK_PHONEBOOKV4_1 PRIMARY KEY(Phone)
)

INSERT INTO PhoneTypeV4_1 VALUES('Mobile')
INSERT INTO PhoneTypeV4_1 VALUES('Work')
INSERT INTO PhoneTypeV4_1 VALUES('Home')

INSERT INTO PersonV4_1 VALUES(N'An bro', 'Manager', 'FS')
INSERT INTO PersonV4_1 VALUES(N'Binh bro', 'Co-worker', 'FS')
INSERT INTO PersonV4_1 VALUES(N'Chi sis', 'Leader', 'FS')

INSERT INTO PhoneBookV4_1 VALUES('099x', 'work', N'An bro')
INSERT INTO PhoneBookV4_1 VALUES('098x', 'mobile', N'An bro')
INSERT INTO PhoneBookV4_1 VALUES('097x', 'mobile', N'Binh bro')
INSERT INTO PhoneBookV4_1 VALUES('096x', 'work', N'Chi sis')
INSERT INTO PhoneBookV4_1 VALUES('095x', 'mobile', N'Chi sis')
INSERT INTO PhoneBookV4_1 VALUES('094x', 'home', N'Chi sis')

SELECT * FROM PersonV4_1
SELECT * FROM PhoneBookV4_1
SELECT * FROM PhoneTypeV4_1