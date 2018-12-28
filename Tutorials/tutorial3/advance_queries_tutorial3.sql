

-- Query 1  Find Average Salary of all departments --

select DEP_ID, AVG(SALARY) as "Average Salary"
from EMPLOYEES
group by DEP_ID


-- Query 2 Find number of employees in each department --


select DEP_ID, Count(*) as "Number of Employees"
from EMPLOYEES
group by DEP_ID


-- Query 3 Find Minimum salary of each department --

select DEP_ID, Min(Salary) as "Minimum Salary"
from EMPLOYEES
group by DEP_ID


-- Query 4 Find Maximum salary of each department --

select DEP_ID, Max(Salary) as "Maximum Salary"
from EMPLOYEES
group by DEP_ID


-- Query 5 Combined total salary of all employees in each department --

select DEP_ID, sum(Salary) as "Combined Salary"
from EMPLOYEES
group by DEP_ID


-- Query 6 ROW_NUMBER() --

Select Salary,
ROW_NUMBER() over (order by salary) as "ROW_NUMBER"
from employees 
where salary in ('50000', '60000', '65000', '70000')


-- Query 7 RANK() --


Select Salary,
RANK() over (order by salary) as "RANK"
from employees 
where salary in ('50000', '60000', '65000', '70000')

-- Query 8 DENSE_RANK() --


Select Salary,
DENSE_RANK() over (order by salary) as "DENSE RANK"
from employees 
where salary in ('50000', '60000', '65000', '70000')

-- Query 9 NTILE() --

Select Salary,
NTILE(2) over (order by salary) as "NTILE"
from employees 
where salary in ('50000', '60000', '65000', '70000')

-- Query 10  LAG --

SELECT  emp_id, salary as "Salary",
       LAG(salary, 1,0) OVER (ORDER BY emp_id) AS "Salary_Nexy"  
FROM employees 

-- Query 11  LEAD --

SELECT  emp_id, salary as "Salary",
       LEAD(salary, 1,0) OVER (ORDER BY emp_id) AS "Salary_Nexy"  
FROM employees 

-- Query 12 LEAD Diff --

SELECT  emp_id, salary as "Salary",
       LEAD(salary, 1,0) OVER (ORDER BY emp_id) AS "Salary_Nexy",   salary - LEAD(salary, 1,0) OVER (ORDER BY emp_id) AS "Salary_Nexy" 
FROM employees 


-- Query 13 LAG Diff --

SELECT  emp_id, salary as "Salary",
       LAG(salary, 1,0) OVER (ORDER BY emp_id) AS "Salary_Nexy",   salary - LAG(salary, 1,0) OVER (ORDER BY emp_id) AS "Salary_Nexy" 
FROM employees 

-- Query 14 Group by sex--

select sex, sum(salary) as "Total Salary"
from employees
group by sex;

-- Query 15 Group by sex and dep_id--

select sex, dep_id, sum(salary) as "Total Salary"
from employees
group by sex, dep_id;

-- Query 16 Group by sex ,dep_id and manager_id --
select sex, dep_id, manager_id, sum(salary) as "Total Salary"
from employees
group by sex, dep_id, manager_id;


-- Query 17 UNION ALL --

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


-- Query 18 GROUPING SET ---

Select  sex, dep_id, manager_id, sum(salary) as "Total Salary"
from employees
Group by Grouping sets 

((sex),
(sex, dep_id),
(sex, dep_id, manager_id))


-- Query 19 ROLLUP --

Select  sex, dep_id, manager_id, sum(salary) as "Total Salary"
from employees
Group by ROLLUP(dep_id, manager_id, sex)

-- Query 20 CUBE --

Select  sex, dep_id, manager_id, sum(salary) as "Total Salary"
from employees
Group by CUBE(dep_id, manager_id, sex)


-- Query 21 Create View --

CREATE VIEW names AS Select F_NAME,L_NAME from employees;

-- Query 22 Select View --

select * from names;


-- Query 24 create and Select from Common table expression


WITH dep_data 
AS (
  Select f_name,l_name,job_id from employees where dep_id = 2
)

select * from dep_data where job_id = 100












