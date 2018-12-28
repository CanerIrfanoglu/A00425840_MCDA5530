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

DEPARTMENTS CREATE TABLE LOCATIONS (
                            LOC_ID CHAR(9) NOT NULL,
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (LOC_ID,DEP_ID));




 -- 6) Query to Create Database --

-- Note: This command is not allowed on your smu account --

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




-- 25) Retrieve all employees whose address is in Elgin,IL------



select F_NAME , L_NAME
from EMPLOYEES
where ADDRESS LIKE '%Elgin,IL%' ;


--26) Retrieve all employees who were born during the 1970's.--

select F_NAME , L_NAME, B_DATE
from EMPLOYEES
where B_DATE LIKE '197%' ;

select F_NAME , L_NAME, B_DATE
from EMPLOYEES
where B_DATE BETWEEN '1970-01-01' AND '1979-12-31'



---27) Retrieve all employees in department 5 whose salary is between 60000 and 70000.--

select *
from EMPLOYEES
where (SALARY BETWEEN 60000 and 70000)  and DEP_ID = 5 ;


SELECT *
FROM EMPLOYEES 
WHERE SALARY >= 60000
and SALARY <= 70000 and DEP_ID = 5;


--28) Retrieve a list of employees ordered by department, within each department, ordered alphabetically by rst name( in descending order).--

SELECT DEP_NAME , F_NAME, L_NAME
FROM EMPLOYEES
INNER JOIN DEPARTMENTS ON EMPLOYEES.dep_id = departments.DEP_ID
order by DEP_NAME, L_NAME desc ;


--29) Retrieve the department number, the number of employees in the department, and their average salary.--

select DEP_ID, COUNT(*), AVG(SALARY)
from EMPLOYEES
group by DEP_ID;





-- Query 30  Find Average Salary of all departments --

select DEP_ID, AVG(SALARY) as "Average Salary"
from EMPLOYEES
group by DEP_ID


-- Query 31 Find number of employees in each department --


select DEP_ID, Count(*) as "Number of Employees"
from EMPLOYEES
group by DEP_ID


-- Query 32 Find Minimum salary of each department --

select DEP_ID, Min(Salary) as "Minimum Salary"
from EMPLOYEES
group by DEP_ID


-- Query 33 Find Maximum salary of each department --

select DEP_ID, Max(Salary) as "Maximum Salary"
from EMPLOYEES
group by DEP_ID


-- Query 34 Combined total salary of all employees in each department --

select DEP_ID, sum(Salary) as "Combined Salary"
from EMPLOYEES
group by DEP_ID


-- Query 35 ROW_NUMBER() --

Select Salary,
ROW_NUMBER() over (order by salary) as "ROW_NUMBER"
from employees 
where salary in ('50000', '60000', '65000', '70000')


-- Query 36 RANK() --


Select Salary,
RANK() over (order by salary) as "RANK"
from employees 
where salary in ('50000', '60000', '65000', '70000')

-- Query 37 DENSE_RANK() --


Select Salary,
DENSE_RANK() over (order by salary) as "DENSE RANK"
from employees 
where salary in ('50000', '60000', '65000', '70000')

-- Query 38 NTILE() --

Select Salary,
NTILE(2) over (order by salary) as "NTILE"
from employees 
where salary in ('50000', '60000', '65000', '70000')

-- Query 39  LAG --

SELECT  emp_id, salary as "Salary",
       LAG(salary, 1,0) OVER (ORDER BY emp_id) AS "Salary_Nexy"  
FROM employees 

-- Query 40  LEAD --

SELECT  emp_id, salary as "Salary",
       LEAD(salary, 1,0) OVER (ORDER BY emp_id) AS "Salary_Nexy"  
FROM employees 

-- Query 41 LEAD Diff --

SELECT  emp_id, salary as "Salary",
       LEAD(salary, 1,0) OVER (ORDER BY emp_id) AS "Salary_Nexy",   salary - LEAD(salary, 1,0) OVER (ORDER BY emp_id) AS "Salary_Nexy" 
FROM employees 


-- Query 42 LAG Diff --

SELECT  emp_id, salary as "Salary",
       LAG(salary, 1,0) OVER (ORDER BY emp_id) AS "Salary_Nexy",   salary - LAG(salary, 1,0) OVER (ORDER BY emp_id) AS "Salary_Nexy" 
FROM employees 

-- Query 43 Group by sex--

select sex, sum(salary) as "Total Salary"
from employees
group by sex;

-- Query 44 Group by sex and dep_id--

select sex, dep_id, sum(salary) as "Total Salary"
from employees
group by sex, dep_id;

-- Query 45 Group by sex ,dep_id and manager_id --
select sex, dep_id, manager_id, sum(salary) as "Total Salary"
from employees
group by sex, dep_id, manager_id;


-- Query 46 UNION ALL --

select sex, null as "dep_id" ,null as "manager_id",sum(salary) as "Total Salary"
from employees
group by sex

UNION ALL

select sex,dep_id, null, sum(salary) as "Total Salary"
from employees
group by sex, dep_id

UNION ALL

select sex, dep_id, manager_id, sum(salary) as "Total Salary"
from employees
group by sex, dep_id, manager_id;


-- Query 47 GROUPING SET ---

Select  sex, dep_id, manager_id, sum(salary) as "Total Salary"
from employees
Group by Grouping sets 

((sex),
(sex, dep_id),
(sex, dep_id, manager_id))


-- Query 48 ROLLUP --

Select  sex, dep_id, manager_id, sum(salary) as "Total Salary"
from employees
Group by ROLLUP(dep_id, manager_id, sex)

-- Query 49 CUBE --

Select  sex, dep_id, manager_id, sum(salary) as "Total Salary"
from employees
Group by CUBE(dep_id, manager_id, sex)


-- Query 50 Create View --

CREATE VIEW names AS Select F_NAME,L_NAME from employees;

-- Query 51 Select View --

select * from names;


-- Query 52 create and Select from Common table expression


WITH dep_data 
AS (
  Select f_name,l_name,job_id from employees where dep_id = 2
)

select * from dep_data where job_id = 100





-- 53) Query Optimization--

--With Higher Cost---

select *
from EMPLOYEES
where EMP_ID IN (SELECT EMP_ID 
FROM EMPLOYEES  where (SALARY BETWEEN 60000 and 70000) and DEP_ID = 5 );

--With Lower Cost--

select *
from EMPLOYEES
where (SALARY BETWEEN 60000 and 70000)  and DEP_ID = 5 ;












