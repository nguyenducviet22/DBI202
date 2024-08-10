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
ALTER TABLE PhoneTypeV4 ALTER COLUMN TpyeName nvarchar(15) NOT NULL
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

SELECT * FROM PersonV4
SELECT * FROM PhoneBookV4
SELECT * FROM PhoneTypeV4