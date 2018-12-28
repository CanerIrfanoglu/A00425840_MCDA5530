SELECT * FROM EMPLOYEES;

select DEP_ID, COUNT(*), AVG(SALARY)
from EMPLOYEES
group by DEP_ID;

select AVG(SALARY) from EMPLOYEES;

select DEP_ID, AVG(SALARY)
from EMPLOYEES
group by DEP_ID;

SELECT DISTINCT DEP_ID FROM EMPLOYEES

SELECT * FROM EMPLOYEES ORDER BY SALARY DESC; 

SELECT SALARY, ROW_NUMBER() over (order by salary) as "ROW_NUMBER" from employees where salary in('50000','60000','65000','70000')

Select Salary,
ROW_NUMBER() over (order by salary) as "ROW_NUMBER"
from employees 
where salary in ('50000', '60000', '65000', '70000')



SELECT emp.SALARY,  @curRow := @curRow + 1 AS row_number FROM EMPLOYEES emp ORDER BY SALARY DESC JOIN (SELECT @curRow := 0) r;


RANK()




