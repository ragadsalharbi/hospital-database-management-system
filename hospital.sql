CREATE DATABASE Hospital;
USE Hospital;
create table departments(
department_name varchar(50)primary key,
FN_of_the_department_manager varchar(50),
LN_of_the_department_manager varchar(50),
department_manager_phnumber varchar(25));
create table doctors (
doctor_id int primary key not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
phonenumber varchar(25) not null,
date_of_birth date,
sex varchar(10),
specialization varchar(50),
department_name varchar(50),
salary decimal(10,2),
foreign key(department_name) references departments (department_name ) );
USE Hospital;
create table patients (
patient_id int primary key not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
phonenumber varchar(25) ,
age int,
date_of_birth date,
sex varchar(10)
);
create table appintments (
appintment_id int primary key not null,
patient_id int,
doctor_id int,
department_name varchar(50),
appintments_date date,
StartTime Time,
EndTime Time,
foreign key(patient_id) references patients(patient_id),
foreign key(doctor_id) references doctors(doctor_id),
foreign key(department_name) references departments (department_name));
use Hospital;
INSERT INTO departments VALUES ('cardiology','ali','suliman','05412336780');
INSERT INTO departments VALUES ('Dermatology','nawaf','naif','05556783456');
INSERT INTO departments VALUES ('Ear,Nose and Throat','badar','Omar','05667532901');
INSERT INTO departments VALUES ('Endocrinology','hassan','nawaf','057313455678');
INSERT INTO departments VALUES ('pediatrics','ahmad','Mohammed','0501123755');

use Hospital;
INSERT INTO doctors VALUES
(10197455,'Rakan','nawaf','0566600122','1994-5-14','M','pediatric','pediatrics','20000.00');
INSERT INTO doctors VALUES
(11023463,'Sama','khaled','05311564833','1995-3-08','F','Ear, Nose and Throat
Specialist','Ear,Nose and Throat','33000.00');
INSERT INTO doctors VALUES
(11100654,'Basil','Saud','0548857333','1992-8-22','M','Dermatologist','Dermatology','50000.
00');
INSERT INTO doctors VALUES
(11234586,'Abdulaziz','Jabbar','0551236744','1993-4-01','M','cardiologist','cardiology','4000
0.00');
INSERT INTO doctors VALUES
(11269031,'Farah','Ahmad','0594157820','1996-1-07','F','Endocrinologist','Endocrinology','4
5000.00');
use Hospital;
INSERT INTO patients VALUES (10087435,'Noor',"Omar",'0561126876',30,"1994-4-08","F");
INSERT INTO patients VALUES (11076468,'Ali',"Naif",'0553212340',25,"1999-2-10","M");
INSERT INTO patients VALUES
(11123867,'Mohammed',"Alharbi",'0542345770',26,"1998-1-03","M");
INSERT INTO patients VALUES (11208461,'Sara',"Ali",'0502345678',5,"2019-9-15","F");
INSERT INTO patients VALUES
(11255432,'Ahmad',"saleh",'0546678908',24,"2000-4-08","M");
use Hospital;
insert into appintments
values(1,10087435,11234586,'cardiology',"2024-2-11","10:00","10:30");
insert into appintments
values(2,11076468,11100654,'Dermatology',"2024-3-15","13:00","13:30");
insert into appintments values(3,11123867,11023463,'Ear,Nose and
Throat',"2024-4-05","17:00","18:30");
insert into appintments
values(4,11208461,11269031,'Endocrinology',"2024-4-28","15:00","16:30");
insert into appintments
values(5,11255432,10197455,'pediatrics',"2024-5-01","10:00","11:00");
use Hospital;
select*from departments ;
select*from doctors ;
select*from patients ;
select*from appintments ;

use Hospital;
SELECT MAX(salary) FROM doctors;
select min(salary)from doctors;
select count(*) AS appintments_count from appintments;
select sum(salary) AS total_salary from doctors;
use Hospital;
SELECT department_name, AVG(salary) AS average_salary
FROM doctors
GROUP BY department_name;
SELECT appintments.appintment_id, patients.first_name AS patient_first_name,
doctors.first_name AS doctor_first_name
FROM appintments
JOIN patients ON appintments.patient_id = patients.patient_id
JOIN doctors ON appintments.doctor_id = doctors.doctor_id;
use Hospital;
SELECT * FROM doctors WHERE salary > 40000;
SELECT DISTINCT specialization FROM doctors;
SELECT DISTINCT patients.first_name, patients.last_name
FROM patients
WHERE patients.sex = 'M';
SELECT patients.first_name AS patient_name, patients.sex AS patient_gender
FROM patients
WHERE patients.age > 20;
USE hospital;
SELECT patient_id FROM patients
UNION
SELECT doctor_id FROM doctors;
USE hospital;
SELECT patient_id,first_name,last_name
FROM patients
WHERE patient_id>'2'
UNION
SELECT patient_id,first_name,last_name
FROM patients
WHERE first_name BETWEEN 'A'AND 'N';
