# USE Ass1_Q3;
# 1 - Write a query that displays the following statistics for each country:
	#  Total number of customers 
	#  Total number of male customers
	#  Total number of female customers
	#  Percent of all customers that are male (Percent Male).    
SELECT Country, Total_Customers, Male, (Total_Customers - Male) as Female, (Male / Total_Customers) * 100 as Percent_Male
FROM 
(SELECT male_count.Country, male_count.male, all_count.Total_Customers
FROM 
(SELECT Country, Gender, COUNT(*) as Male
FROM customer
GROUP BY  Gender, Country
HAVING Gender = 'M') male_count
INNER JOIN 
(SELECT Country, COUNT(*) as Total_Customers FROM customer GROUP BY Country) all_count
ON male_count.Country = all_count.Country
) combined
ORDER BY Percent_Male;


# 2 - Create a result by combining two tables.
	#  Include columns Product_ID, Product_Name from product_dim table.
	#  Include a column with the label Total Sold. Use a summary function to create
	#  		this column, which displays the quantity sold for each product.
	# Specifies the tables product_dim, with the alias p and order_fact with the alias o
	# Join the tables by matching the values of the appropriate columns in each table.
	# Groups the results by Product_ID from product_dim table and Product_Name.
	# Orders the rows so that products with the highest number sold appear at the
	# 		top of the report and then by Product_Name.
SELECT p.Product_ID, p.Product_NAME, SUM(o.Quantity) as Total_Sold  
FROM product_dim p
INNER JOIN order_fact o 
ON p.Product_ID = o.Product_ID
GROUP BY p.Product_ID, p.Product_Name
ORDER BY Total_Sold DESC;


	# 3- Display result of all trainees and workers at company. For each trainee or temporary worker, 
	#		the report should include the employee ID, name and job title, and manager ID and name. 
	#		The report should be ordered by Employee_ID.

SELECT emp.Employee_ID, emp.Employee_Name, emp.Job_Title, emp.Manager_ID,employee_addresses.Employee_Name as Manager_Name
FROM
(SELECT s.Employee_ID, s.Job_Title, e.Employee_Name, s.Manager_ID
FROM staff s
INNER JOIN employee_addresses e
ON s.Employee_ID = e.Employee_ID
WHERE s.Job_Title in ( 'Trainee', 'Temp. Sales Rep.')) emp
INNER JOIN employee_addresses
ON emp.Manager_ID = employee_addresses.Employee_ID
ORDER BY Employee_ID;
 

	# 4- 1) Calculate the difference between the salary of the current row and the previous row	
SET @quot=NULL;
SELECT Employee_ID, Salary, lag_salary, (Salary - lag_salary) as Lag_diff
FROM
(SELECT Employee_ID,Salary,@quot lag_salary, @quot:=salary curr_salary
FROM employee_payroll 
ORDER BY Employee_ID) a;


	#    2) Calculate the difference between the salary of current row and the following row.
SELECT t1.Employee_ID, t1.Salary, t2.Salary as Lead_Salary, (t2.Salary - t1.Salary) as Lead_diff 
FROM (
    SELECT Employee_ID, Salary, @rownum1 := @rownum1 + 1 AS id
    FROM
     employee_payroll  , (SELECT @rownum1 := 0) r
    ORDER BY
     employee_payroll.Employee_ID ASC
) AS t1
LEFT OUTER JOIN ( 
    SELECT Employee_ID, Salary, @rownum2 := @rownum2 + 1 AS id
    FROM
     employee_payroll, (SELECT @rownum2 := 0) r
    ORDER BY
     employee_payroll.Employee_ID ASC
) AS t2
  ON t1.id +1 = t2.id;


select p.Product_ID,p.Product_Name, sum(o.quantity) 'Total Sold' 
from product_dim p, order_fact o 
where p.product_id = o.product_id 
group by Product_ID,Product_Name
order by 3 desc, p.product_name desc;



USE mysql;
SELECT * FROM user;
update user set authentication_string=password('1111') where user='root';
FLUSH PRIVILEGES;

describe user;
 