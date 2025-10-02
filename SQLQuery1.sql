CREATE DATABASE Prescription 
GO
USE Prescription
GO
CREATE SCHEMA P

CREATE TABLE P.Patient (
    URNumber int Primary key,
    Name VARCHAR(100) NOT NULL,
    Age int,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Street VARCHAR(100),
    City VARCHAR(50),
    MedicareCardNo VARCHAR(50),
    DoctorID INT,
    FOREIGN KEY (DoctorID) REFERENCES P.Doctor(DoctorID)


)

CREATE TABLE P.Doctor (
    DoctorID int Primary key,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Specialty VARCHAR(50),
    Experience INT
)

CREATE TABLE P.PharmaceuticalCompany (
    CompanyID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Street VARCHAR(100),
    City VARCHAR(50)


)

CREATE TABLE P.Drug (
    DrugID INT PRIMARY KEY,
    TradeName VARCHAR(100) NOT NULL,
    Strength VARCHAR(50),
    CompanyID INT,
    FOREIGN KEY (CompanyID) REFERENCES P.PharmaceuticalCompany(CompanyID)
     
)

CREATE TABLE P.Prescription (
    URNumber INT,
    DoctorID INT,
    DrugID INT,
    Date Datetime2,
    Quantity INT,
    PRIMARY KEY (URNumber, DoctorID, DrugID),
    FOREIGN KEY (URNumber) REFERENCES P.Patient(URNumber),
    FOREIGN KEY (DoctorID) REFERENCES P.Doctor(DoctorID),
    FOREIGN KEY (DrugID) REFERENCES P.Drug(DrugID)
    ON DELETE CASCADE
)
insert into P.Doctor  values (674594613,'Bab','bomullan0@china.com.cn','389-978-4649', ' for nil:NilClass',34)
insert into P.Doctor  values (1448339606,'Ruthann','rsutton1@taobao.com','840-202-4835',' for nil:NilClass',17)
insert into P.Doctor  values (1308232213,'Dorolice','daird2@canalblog.com','508-394-2608', ' for nil:NilClass',54)
insert into P.Doctor  values (1391663031,'Connie','ctallquist3@smh.com.au','772-221-1590',' for nil:NilClass',33)
insert into P.Doctor  values (5, 'Dr. Ahmed Nabil', 'ahmed.nabil@example.com', '0101010101', 'Cardiology', 10)
insert into P.Doctor  values (6, 'Dr. Mariam Saeed', 'mariam.saeed@example.com', '0102020202', 'Neurology', 8)
insert into P.Doctor  values (7, 'Dr. Hossam Fathy', 'hossam.fathy@example.com', '0103030303', 'Dermatology', 15)
insert into P.Doctor  values (8, 'Dr. Salma Gamal', 'salma.gamal@example.com', '0104040404', 'Oncology', 6)
insert into P.Doctor  values(9, 'Dr. Tamer Ali', 'tamer.ali@example.com', '0105050505', 'Orthopedics', 12)
insert into P.Doctor  values(10, 'Dr. Yara Hussein', 'yara.hussein@example.com', '0106060606', 'Pediatrics', 7)
insert into P.Doctor  values (11, 'Dr. Karim Samy', 'karim.samy@example.com', '0107070707', 'ENT', 5)
insert into P.Doctor  values (12, 'Dr. Dina Hany', 'dina.hany@example.com', '0108080808', 'Psychiatry', 9)
insert into P.Doctor  values (13, 'Dr. Eslam Hassan', 'eslam.hassan@example.com', '0109090909', 'Cardiology', 14)
insert into P.Doctor  values (14, 'Dr. Laila Adel', 'laila.adel@example.com', '0111111111', 'Dermatology', 11)
insert into P.Doctor  values (15, 'Dr. Nader Farouk', 'nader.farouk@example.com', '0122222222', 'Neurology', 13)



insert into P.Patient values(101, 'Omar Khaled', 30, 'omar.khaled@example.com', '01033333333', 'Tahrir St', 'Cairo', 'MC12345', 674594613)
insert into P.Patient values(102, 'Sara Mohamed', 25, 'sara.mohamed@example.com', '01044444444', 'Nile St', 'Giza', 'MC67890', 1448339606)
insert into P.Patient values (103, 'Youssef Adel', 40, 'youssef.adel@example.com', '01055555555', 'Freedom St', 'Alexandria', 'MC24680',1308232213)
insert into P.Patient values(104, 'Mona Samir', 35, 'mona.samir@example.com', '01066666666', 'October St', 'Cairo', 'MC13579', 1391663031)
insert into P.Patient values (105, 'Ali Hassan', 32, 'ali.hassan@example.com', '0123333333', 'Street 1', 'Cairo', 'MC10001', 5);
insert into P.Patient values (106, 'Lina Youssef', 29, 'lina.youssef@example.com', '0124444444', 'Street 2', 'Giza', 'MC10002', 6);
insert into P.Patient values (107, 'Mahmoud Eid', 41, 'mahmoud.eid@example.com', '0125555555', 'Street 3', 'Alexandria', 'MC10003', 7);
insert into P.Patient values (108, 'Rania Magdy', 36, 'rania.magdy@example.com', '0126666666', 'Street 4', 'Cairo', 'MC10004', 8);
insert into P.Patient values (109, 'Hatem Zaki', 24, 'hatem.zaki@example.com', '0127777777', 'Street 5', 'Giza', 'MC10005', 9);
insert into P.Patient values (110, 'Maha Ezzat', 27, 'maha.ezzat@example.com', '0128888888', 'Street 6', 'Cairo', 'MC10006', 10);
insert into P.Patient values (111, 'Mostafa Galal', 31, 'mostafa.galal@example.com', '0129999999', 'Street 7', 'Alexandria', 'MC10007', 11);
insert into P.Patient values (112, 'Dalia Ibrahim', 26, 'dalia.ibrahim@example.com', '0131111111', 'Street 8', 'Mansoura', 'MC10008', 12);
insert into P.Patient values (113, 'Ola Fathi', 39, 'ola.fathi@example.com', '0132222222', 'Street 9', 'Cairo', 'MC10009', 13);
insert into P.Patient values (114, 'Adel Kamal', 45, 'adel.kamal@example.com', '0133333333', 'Street 10', 'Giza', 'MC10010', 14);
insert into P.Patient values (115, 'Noha Ashraf', 21, 'noha.ashraf@example.com', '0134444444', 'Street 11', 'Cairo', 'MC10011', 15);



insert into p.PharmaceuticalCompany values(201, 'PharmaEgypt', '0223456789', 'Corniche St', 'Cairo')
insert into p.PharmaceuticalCompany values(202, 'GlobalMed', '0229876543', 'Alex St', 'Alexandria')
insert into p.PharmaceuticalCompany values(203, 'HealthCare Inc.', '0234567890', 'Pyramid St', 'Giza')
insert into p.PharmaceuticalCompany values(204, 'MedLife', '0245678901', 'Victory St', 'Mansoura')
insert into p.PharmaceuticalCompany values (205, 'BioPharma', '0231111111', 'Company St 1', 'Cairo');
insert into p.PharmaceuticalCompany values(206, 'CureMed', '0232222222', 'Company St 2', 'Giza');
insert into p.PharmaceuticalCompany values (207, 'LifeCare', '0233333333', 'Company St 3', 'Alexandria');
insert into p.PharmaceuticalCompany values (208, 'MedTrust', '0234444444', 'Company St 4', 'Cairo');
insert into p.PharmaceuticalCompany values (209, 'PharmaLife', '0235555555', 'Company St 5', 'Mansoura');
insert into p.PharmaceuticalCompany values (210, 'NovaPharm', '0236666666', 'Company St 6', 'Cairo');
insert into p.PharmaceuticalCompany values (211, 'GlobeMed', '0237777777', 'Company St 7', 'Giza');
insert into p.PharmaceuticalCompany values (212, 'VitalPharm', '0238888888', 'Company St 8', 'Cairo');
insert into p.PharmaceuticalCompany values (213, 'MegaPharma', '0239999999', 'Company St 9', 'Alexandria');
insert into p.PharmaceuticalCompany values (214, 'SunPharma', '0241111111', 'Company St 10', 'Cairo');
insert into p.PharmaceuticalCompany values (215, 'CarePharma', '0242222222', 'Company St 11', 'Giza');


insert into p.Drug values(301, 'Panadol', '500mg', 201)
insert into p.Drug values(302, 'Augmentin', '625mg', 202)
insert into p.Drug values(303, 'Cataflam', '50mg', 203)
insert into p.Drug values(304, 'Aspirin', '100mg', 204)
insert into p.Drug values(305, 'Zyrtec', '10mg', 205)
insert into p.Drug values (306, 'Voltaren', '75mg', 206)
insert into p.Drug values (307, 'Paracetamol', '500mg', 207)
insert into p.Drug values (308, 'Amoxicillin', '500mg', 208)
insert into p.Drug values (309, 'Ibuprofen', '400mg', 209)
insert into p.Drug values (310, 'Clarithromycin', '500mg', 210)
insert into p.Drug values (311, 'Metformin', '850mg', 211)
insert into p.Drug values (312, 'Omeprazole', '20mg', 212)
insert into p.Drug values (313, 'Ceftriaxone', '1g', 213)
insert into p.Drug values (314, 'Hydrocortisone', '100mg', 214)
insert into p.Drug values (315, 'Azithromycin', '250mg', 215)



insert into P.Prescription values(101, 674594613, 301, '2025-09-01', 2)
insert into P.Prescription values(102, 1448339606, 302, '2025-09-05', 1)
insert into P.Prescription values(103, 1308232213, 303, '2025-09-10', 3)
insert into P.Prescription values(104, 1391663031, 304, '2025-09-15', 2)
insert into P.Prescription values (105, 5, 305, '2025-09-20', 1)
insert into P.Prescription values (106, 6, 306, '2025-09-21', 2)
insert into P.Prescription values (107, 7, 307, '2025-09-22', 3)
insert into P.Prescription values (108, 8, 308, '2025-09-23', 1)
insert into P.Prescription values(109, 9,309, '2025-09-24', 2)
insert into P.Prescription values (110, 10, 310, '2025-09-25', 1)
insert into P.Prescription values (111, 11, 311, '2025-09-26', 4)
insert into P.Prescription values (112, 12, 312, '2025-09-27', 2)
insert into P.Prescription values (113, 13, 313, '2025-09-28', 3)
insert into P.Prescription values (114, 14, 314, '2025-09-29', 1)
insert into P.Prescription values (115, 15, 315, '2025-09-30', 2)



