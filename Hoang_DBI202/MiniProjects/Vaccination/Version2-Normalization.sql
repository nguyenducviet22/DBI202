DROP TABLE PersonV2_0
DROP TABLE VaccinationV2_0
DROP TABLE VaccineV2_0

CREATE TABLE PersonV2_0(
	ID char(11) PRIMARY KEY,
	LastName nvarchar(30),
	FirstName nvarchar(10),
	Phone varchar(11) NOT NULL UNIQUE
)

CREATE TABLE VaccinationV2_0(--Normalize a col by using dropdown, do not freely type
	STT int IDENTITY PRIMARY KEY,
	Dose int,
	InjDate datetime,
	Vaccine varchar(30) REFERENCES VaccineV2_0(VaccineName), 
	Lot nvarchar(20),
	Location nvarchar(50),
	PersonID char(11) REFERENCES PersonV2_0(ID),
	--FOREIGN KEY (Vaccine) REFERENCES VaccineV2_0(VaccineName),
	--CONSTRAINT FK_VCN_VC FOREIGN KEY (Vaccine) REFERENCES VaccineV2_0(VaccineName)
)

CREATE TABLE VaccineV2_0(
	VaccineName varchar(30) PRIMARY KEY
)

INSERT INTO VaccineV2_0 VALUES('AstraZeneca')
INSERT INTO VaccineV2_0 VALUES('Pfizer')
INSERT INTO VaccineV2_0 VALUES('Verocell')
INSERT INTO VaccineV2_0 VALUES('Moderna')

INSERT INTO PersonV2_0 VALUES('00000000001', N'Nguyen', N'An', '098x')
INSERT INTO PersonV2_0 VALUES('00000000002', N'Le', N'Binh', '097x')
INSERT INTO PersonV2_0 VALUES('00000000003', N'Tran', N'Chi', '099x')

INSERT INTO VaccinationV2_0 VALUES(1, GETDATE(), 'AstraZeneca', NULL, NULL, '00000000001')
INSERT INTO VaccinationV2_0 VALUES(2, GETDATE(), 'AstraZeneca', NULL, NULL, '00000000001')
INSERT INTO VaccinationV2_0 VALUES(1, GETDATE(), 'AZ', NULL, NULL, '00000000002')--Failed, STT was still automatically increased
INSERT INTO VaccinationV2_0 VALUES(1, GETDATE(), 'AstraZeneca', NULL, NULL, '00000000003')
INSERT INTO VaccinationV2_0 VALUES(3, GETDATE(), 'Pfizer', NULL, NULL, '00000000001')
INSERT INTO VaccinationV2_0 VALUES(4, GETDATE(), 'Verocell', NULL, NULL, '00000000001')
INSERT INTO VaccinationV2_0 VALUES(1, GETDATE(), 'Verocell', NULL, NULL, '00000000002')
INSERT INTO VaccinationV2_0 VALUES(2, GETDATE(), 'AstraZeneca', NULL, NULL, '00000000003')

SELECT * FROM PersonV2_0
SELECT * FROM VaccineV2_0
SELECT * FROM VaccinationV2_0

SELECT vc.VaccineName, COUNT(vcn.STT) FROM VaccineV2_0 vc LEFT JOIN VaccinationV2_0 vcn 
			ON vc.VaccineName = vcn.Vaccine GROUP BY vc.VaccineName