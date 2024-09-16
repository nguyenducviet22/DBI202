USE DBDESIGN_ONETABLE

CREATE TABLE Registration(
	STT int	PRIMARY KEY IDENTITY,
	FirstName nvarchar(10),
	LastName nvarchar(10),
	Email varchar(50),
	Phone varchar(11),
	RegDate datetime DEFAULT GetDate()
)

INSERT INTO Registration VALUES(N'An', N'Nguyen', 'an@gmail.com', '090x', null)
INSERT INTO Registration (FirstName, LastName, Email, Phone)
				VALUES(N'An', N'Nguyen', 'an@gmail.com', '090x')

SELECT * FROM Registration