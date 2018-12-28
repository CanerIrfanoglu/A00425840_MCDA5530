-- 1) Create Table Employees --

CREATE TABLE EMPLOYEES (
                            EMP_ID CHAR(9) NOT NULL, 
                            F_NAME VARCHAR(15) NOT NULL,
                            L_NAME VARCHAR(15) NOT NULL,
                            SSN CHAR(9),
                            B_DATE DATE,
                            SEX CHAR,
                            ADDRESS VARCHAR(30),
                            JOB_ID CHAR(9),
                            SALARY DECIMAL(10,2),
                            MANAGER_ID CHAR(9),
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (EMP_ID));



-- 2) Create Table Job History --

CREATE TABLE JOB_HISTORY (
                            EMP_ID CHAR(9) NOT NULL, 
                            START_DATE DATE,
                            JOB_ID CHAR(9) NOT NULL,
                            DEP_ID CHAR(9),
                            PRIMARY KEY (EMP_ID,JOB_ID));




 -- 3) Create Table Jobs --

 CREATE TABLE JOBS (
                            JOB_ID CHAR(9) NOT NULL, 
                            JOB_TITLE VARCHAR(15) ,
                            MIN_SALARY DECIMAL(10,2),
                            MAX_SALARY DECIMAL(10,2),
                            PRIMARY KEY (JOB_ID));




-- 4) Create Table Departments --

CREATE TABLE DEPARTMENTS (
                            DEP_ID CHAR(9) NOT NULL, 
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEP_ID));



-- 5) Create Table Locations ---

CREATE TABLE LOCATIONS (
                            LOC_ID CHAR(9) NOT NULL,
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (LOC_ID,DEP_ID));




 -- 6) Query to Create Database --

-- Note: This command is not allowed on your csc355xx account --

CREATE DATABASE xyz;


-- 7) Show Databases --

SHOW databases;



-- 8) Select xyz database --

USE xyz;



-- 9) Select tutorial1 database --

USE tutorial1



-- 10) Delete  xyz Database -- 

DROP DATABASE xyz;

-- or --

DROP DATABASE IF EXISTS xyz;



--11) DROP  Location TABLE --

DROP TABLE Locations;

-- or --

DROP TABLE IF EXISTS Locations;



-- 12) Show tables --

SHOW tables;



-- 13) Structure of table --

DESCRIBE employees;



-- 14) Insert data into jobs table --

INSERT INTO jobs (job_id, job_title, min_salary, max_salary) values (123, 'Engineer', 40000, 60000);



-- 15) Select data of employees table --

Select * from employees;



-- 16) Select First name and Last Name from Employees table --

Select f_name, l_name from employees;



-- 17) Select records from the jobs table where job title is Sr. Designer --

Select * from jobs where job_title='Sr. Designer';



-- 18) Close the safe update mode --

SET SQL_SAFE_UPDATES=0;



-- 19) Detele row where job id is 123 --

DELETE from jobs where job_id = 123;



-- 20) Change  name of the jobs table to job --

Alter TABLE jobs RENAME AS job; 



-- 21) Add new coloumn (job_info) to the existing table (job) --

ALTER TABLE job ADD job_info varchar(20);



-- 23) To change the data type of a column in a table. Change job_info's datatype --

ALTER TABLE job Modify COLUMN job_info text;


-- 22) See the structure of job table --

DESCRIBE job;


-- 24) Delete coloumn (job_info) from the existing table (job) --

ALTER TABLE job DROP COLUMN job_info;







