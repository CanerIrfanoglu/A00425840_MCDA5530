

-- Query 1 Retrieve all employees whose address is in Elgin,IL------



select F_NAME , L_NAME
from EMPLOYEES
where ADDRESS LIKE '%Elgin,IL%' ;


--Query 2 Retrieve all employees who were born during the 1970's.--

select F_NAME , L_NAME, B_DATE
from EMPLOYEES
where B_DATE LIKE '197%' ;

select F_NAME , L_NAME, B_DATE
from EMPLOYEES
where B_DATE BETWEEN '1970-01-01' AND '1979-12-31'



---Query3 Retrieve all employees in department 5 whose salary is between 60000 and 70000.--

select *
from EMPLOYEES
where (SALARY BETWEEN 60000 and 70000)  and DEP_ID = 5 ;


SELECT *
FROM EMPLOYEES 
WHERE SALARY >= 60000
and SALARY <= 70000 and DEP_ID = 5;


--Query4 Retrieve a list of employees ordered by department, within each department, ordered alphabetically by rst name( in descending order).--

SELECT DEP_NAME , F_NAME, L_NAME
FROM EMPLOYEES
INNER JOIN DEPARTMENTS ON EMPLOYEES.dep_id = departments.DEP_ID
order by DEP_NAME, L_NAME desc ;


--Query5 Retrieve the department number, the number of employees in the department, and their average salary.--

select DEP_ID, COUNT(*), AVG(SALARY)
from EMPLOYEES
group by DEP_ID;





--Query Optimization--

--With Higher Cost---

select *
from EMPLOYEES
where EMP_ID IN (SELECT EMP_ID 
FROM EMPLOYEES  where (SALARY BETWEEN 60000 and 70000) and DEP_ID = 5 );

--With Lower Cost--

select *
from EMPLOYEES
where (SALARY BETWEEN 60000 and 70000)  and DEP_ID = 5 ;
