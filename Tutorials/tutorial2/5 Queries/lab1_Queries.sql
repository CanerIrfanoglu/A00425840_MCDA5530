

-- Query 1------

select F_NAME , L_NAME
from EMPLOYEES
where ADDRESS LIKE '%Elgin,IL%' ;


--Query 2--

select F_NAME , L_NAME, B_DATE
from EMPLOYEES
where B_DATE LIKE '197%' ;

select F_NAME , L_NAME, B_DATE
from EMPLOYEES
where B_DATE BETWEEN '1970-01-01' AND '1979-12-31'



---Query3--

select *
from EMPLOYEES
where (SALARY BETWEEN 60000 and 70000)  and DEP_ID = 5 ;


SELECT *
FROM EMPLOYEES 
WHERE SALARY >= 60000
and SALARY <= 70000 and DEP_ID = 5;


--Query4--

SELECT DEP_NAME , F_NAME, L_NAME
FROM EMPLOYEES
INNER JOIN DEPARTMENTS ON EMPLOYEES.dep_id = departments.DEP_ID
order by DEP_NAME, L_NAME desc ;


--Query5--

select DEP_ID, COUNT(*), AVG(SALARY)
from EMPLOYEES
group by DEP_ID;
