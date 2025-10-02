--1.SELECT: Retrieve all columns from the Doctor table.
select *
from P.Doctor

--2.ORDER BY: List patients in the Patient table in ascending order of their ages.
select *
from P.Patient 
order by Age ASC

--3.OFFSET FETCH: Retrieve the first 10 patients from the Patient table, starting from the 5th record.
select *
from P.Patient
order by URNumber
offset 4 ROWS
fetch next 10 rows only

--4.SELECT TOP: Retrieve the top 5 doctors from the Doctor table.
select top 5 *
from P.Doctor

--5.SELECT DISTINCT: Get a list of unique address from the Patient table.
select DISTINCT street,city
from P.Patient

--6.WHERE: Retrieve patients from the Patient table who are aged 25.
select *
from P.Patient
where Age =25

--7.NULL: Retrieve patients from the Patient table whose email is not provided.
select *
from P.Patient
where email is null

--8.AND: Retrieve doctors from the Doctor table who have experience greater than 5 years and specialize in 'Cardiology'.
select *
from P.Doctor 
where Experience > 5 AND Specialty  ='Cardiology'

--9.IN: Retrieve doctors from the Doctor table whose speciality is either 'Dermatology' or 'Oncology'.
select *
from P.Doctor
where Specialty in('Dermatology','Oncology')

--10.BETWEEN: Retrieve patients from the Patient table whose ages are between 18 and 30.
select *
from P.Patient 
where Age BETWEEN 18 AND 30

--11.LIKE: Retrieve doctors from the Doctor table whose names start with 'Dr.'.
SELECT *
FROM P.Doctor
where Name like 'DR%'

--12.Column & Table Aliases: Select the name and email of doctors, aliasing them as 'DoctorName' and 'DoctorEmail'.
select Name AS DoctorName ,Email AS DoctorEmail
from P.Doctor 

--13.Joins: Retrieve all prescriptions with corresponding patient names.
select p.URNumber , p.name as patientname,pr.Date,pr.Quantity
from P.patient p JOIN P.prescription pr
on p.URNumber=pr.URNumber

--14. GROUP BY: Retrieve the count of patients grouped by their cities.

select count(*) as count, city
from P.Patient 
GROUP BY city

--15.HAVING: Retrieve cities with more than 3 patients.
select count(*) as count, city
from P.Patient 
GROUP BY city
HAVING count(*)>3

--16. GROUPING SETS: Retrieve counts of patients grouped by cities and ages
select City ,Age, count(*) count
from P.Patient
GROUP BY GROUPING SETS (City ,Age)

--17.CUBE: Retrieve counts of patients considering all possible combinations of city and age.
select City ,Age, count(*) count
from P.Patient
GROUP BY CUBE (City ,Age)

--18.ROLLUP: Retrieve counts of patients rolled up by city.
select City , count(*) count
from P.Patient
GROUP BY  ROLLUP(City)

--19.EXISTS: Retrieve patients who have at least one prescription.

select DISTINCT P.Patient .*
from P.Patient join P.Prescription
on P.Patient.URNumber = P.Prescription.URNumber

--20.UNION: Retrieve a combined list of doctors and patients.
select  P.Doctor.Name as doctorname,P.Patient.Name as patientname		
from P.Doctor join P.Patient
on P.Doctor.DoctorID=P.Patient.DoctorID

--22.INSERT: Insert a new doctor into the Doctor table.
insert into P.Doctor values (16,'Dr.Ahmed sayed','ahmed1@taobao.com',12345678,'Cardiology',20)

--23.INSERT Multiple Rows: Insert multiple patients into the Patient table.
insert into P.Patient (URNumber,Name,Age,Email,Phone,Street,City,MedicareCardNo,DoctorID)
values (118,'abdo sayed',25,'abdo12@gmail.com ','13964520','shubra', 'cairo', 'MC54321',16),
(120,'seif seif ',25,'seif12@gmail.com ','13954520','shubra', 'cairo', 'MC65321',16)

--24.UPDATE: Update the phone number of a doctor.
UPDATE p.Doctor
SET phone ='123654987'
where DoctorID=5

--25.UPDATE JOIN: Update the city of patients who have a prescription from a specific doctor.
UPDATE P.patient
SET City ='updated city'
from P.patient join p.Prescription
on P.patient.URNumber =p.Prescription.URNumber
where p.Prescription.DoctorID=5

--26.DELETE: Delete a patient from the Patient table.
DELETE from p.Patient
where URNumber=106

--27.Transaction: Insert a new doctor and a patient, ensuring both operations succeed or fail together.
BEGIN Transaction
insert into P.Doctor values (17,'DR.abdelrhman','abdoh@taobao.com',56932140,'Cardiology',21)
insert into P.Patient values(121,'seif seif ',25,'seif12@gmail.com ','13954520','shubra', 'cairo', 'MC65321',16)
commit

--29.Index: Create an index on the 'phone' column of the Patient table to improve search performance.
CREATE INDEX ix_patient on P.Patient (Phone)

--30.Backup: Perform a backup of the entire database to ensure data safety.
Backup DATABASE prescription 
to disk ='C:\Users\emade\OneDrive\Desktop\Backup'