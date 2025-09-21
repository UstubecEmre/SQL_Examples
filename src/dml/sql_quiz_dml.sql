USE SQL_QUIZ

-- DML (Data Manipulation Language): => INSERT, UPDATE, DELETE
-- INSERT SOME RECORDS
-- FILED
INSERT INTO FIELD(Field) VALUES('Technology') --1
INSERT INTO FIELD(Field) VALUES('Marketing') --2
INSERT INTO FIELD(Field) VALUES('R&D') --3
INSERT INTO FIELD(Field) VALUES('Industrial') --4
INSERT INTO FIELD(Field) VALUES('Biomedical') --5
INSERT INTO FIELD(Field) VALUES('Health') --6
INSERT INTO FIELD(Field) VALUES('Justice') --7
INSERT INTO FIELD(Field) VALUES('Education') --8
INSERT INTO FIELD(Field) VALUES('Finance') --9
INSERT INTO FIELD(Field) VALUES('Energy') --10
INSERT INTO FIELD(Field) VALUES('Agriculture') --11
INSERT INTO FIELD(Field) VALUES('Construction') --12
INSERT INTO FIELD(Field) VALUES('Logistics') --13
INSERT INTO FIELD(Field) VALUES('Games') --14
INSERT INTO FIELD(Field) VALUES('Commerce') --15


/* fields = [
'Technology',
'Marketing',
'R&D',
'Industrial',
'Biomedical',
'Health',
'Justice',
'Education',
'Finance',
'Energy',
'Agriculture',
'Construction'
'Logistics',
'Games',
'Commerce'

]
*/
SELECT * FROM FIELD

SELECT * FROM COMPANY

INSERT INTO COMPANY(Name, EstablishedDate, FieldID)
VALUES
('TechNova','2010-04-15',1)

-- Department
INSERT INTO DEPARTMENT(Department)
VALUES
('HR'), -- 1-Insan Kaynaklari
('IT'), -- 2- Bilgi islem
('Marketing'), -- 3-Pazarlama
('Sales'), -- 4-Satis
('Finance'), --5-Finans
('R&D'), --6-Arastirma-Gelistirme
('Operations'), --7-Operasyon
('Logistics'), --8- Tedarik zinciri
('Customer Service'),-- 9- Musteri Hizmetleri
('Legal'), -- 10-Hukuk
('QC'), -- 11- Kalite Kontrol
('Purchasing'), -- 12-Satin Alma
('Customer Success'), --13- Musteri Memnuniyeti
('Talent Management'), -- 14- Yetenek Yonetimi (HR'in gelismisi)
('Technical Support'), -- 15- Teknik Destek
('Manufacturing') -- 16-Uretim


-- COMPANY
INSERT INTO COMPANY(Name, EstablishedDate, FieldID)
VALUES
('Microsoft','1974-04-04',1),
('Apple','1976-04-01',1),
('NVIDIA','1993-04-05', 1),


('MarketGuru','2015-09-01',2),
('AdWise','2012-03-15',2),
('BrandBoost','2010-06-20',2),
('PromoWorks','2013-11-05',2),
('CreativeSpark','2008-08-12',2),

('ARGE Innovators','2018-11-12', 3),
('Scientific and Technological Research Council of Türkiye','1963-07-24',3),

('SteelWorks','2000-06-12',4),
('BuildTech','2005-09-20',4),
('MachineMakers','2010-11-25',4),
('FactoryPro','2013-01-15',4),
('Industrial Solutions Inc','1995-03-05',4),

('BioHealth Labs','2008-12-10',5),
('MedTech Innovations','2012-05-20',5),
('BioGen Solutions','2015-09-15',5),
('GenomeWorks','2015-09-15',5),
('CellLife','2013-03-05',5),


('Star Medica','2010-08-15',6),
('CareWell Hospitals','2005-09-12',6),
('MediLife Services','2010-02-20',6),
('VitalHealth Labs','2012-11-10',6),



('Justice Partners','2000-06-20',7),
('HealthFirst Clinic','2003-05-30',7),


('EduCore','2005-09-10', 8),
('LearnHub','2010-02-20', 8),
('KnowledgePlus','2012-06-15', 8),
('BrightMinds','2008-11-05', 8),
('AcademyWorks','2015-01-25', 8),

('CapitalWise','2000-01-10',9),
('FinBank','2005-06-20',9),
('InvestPro','2010-09-15',9),
('MoneySolutions','2013-11-05',9),

('SolarPower','2005-03-10',10),
('WindGen','2010-06-15',10),
('HydroTech','2012-11-05',10),
('EnergySolutions','2015-01-20',10),
('GreenVolt','2018-08-12',10),

('AgriTech','2003-04-15',11),
('GreenFields','2008-07-20',11),
('FarmSolutions','2010-09-30',11),
('AgroPlus','2012-12-10',11),
('NatureHarvest','2015-03-05',11),

('BuildRight','1998-04-15',12),
('UrbanConstruct','2003-09-20',12),
('TowerWorks','2008-11-10',12),
('SolidFoundations','2012-02-25',12),


('QuickMove','2008-05-10',13),
('GlobalTransit','2010-08-20',13),
('ShipRight','2012-03-15',13),
('CargoPlus','2015-09-05',13),
('FastTrack','2018-01-25',13),

('GamesHub', '2012-07-18', 14),

('E-Com World','2016-02-25',15)

-- EMPLOYEE

INSERT INTO EMPLOYEE(Name, Surname, Email, CompanyId, DepartmentID, Salary,Experience, StartDate)
VALUES
('Emre','Ustubec','emre@gmail.com',1,2, 35000, 3, '2022-09-17'),
('Erol','Ustubec','erol@gmail.com',1,2, 55000, 6, '2010-01-24'),
('Zahide','Kalkan','zahide@outlook.com',1,1, 25000, 1, '2023-11-07'),
('Fatma','Derin','fatma@yahoo.com',2,1, 47500, 4, '2019-10-19'),
('Zahir','Yusufi','yusufizahir@gmail.com',2, 5, 41000, 3, '2022-10-10'),
('Havva','Hakiki','havva@outlook.com',3, 3, 60000 ,7, '2017-01-29'),
('Emre','Ilgic','ilgicemre@yahoo.com',4, 1, 45000, 3, '2022-01-01'),
('Edis','Gezer','gezerdis@yahoo.com',5, 5, 27000, 1, '2024-03-30'),
('Uygar','Yuksel','uygar@google.com',7, 4, 32000, 4, '2021-06-15'),
('Polen','Zaferoglu','polenzoglu@google.com',8, 6, 52000, 4, '2021-08-20'),
('Bahar','Eker','bahar@google.com',9, 10, 42500, 4, '2018-08-20'),
('Dicle','Sudoken','sdicle@outlook.com',10, 12, 367500, 2, '2022-10-07'),
('Fatma','Yaprak','fatmayaprak@outlook.com',4, 16, 48750, 7, '2016-02-14')