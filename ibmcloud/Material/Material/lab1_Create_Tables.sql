------------------------------------------
--DDL statement for table 'HR' database--
--------------------------------------------

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
                            
  CREATE TABLE JOB_HISTORY (
                            EMP_ID CHAR(9) NOT NULL, 
                            START_DATE DATE,
                            JOB_ID CHAR(9) NOT NULL,
                            DEP_ID CHAR(9),
                            PRIMARY KEY (EMP_ID,JOB_ID));
 
 CREATE TABLE JOBS (
                            JOB_ID CHAR(9) NOT NULL, 
                            JOB_TITLE VARCHAR(15) ,
                            MIN_SALARY DECIMAL(10,2),
                            MAX_SALARY DECIMAL(10,2),
                            PRIMARY KEY (JOB_ID));

CREATE TABLE DEPARTMENTS (
                            DEP_ID CHAR(9) NOT NULL, 
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEP_ID));

CREATE TABLE LOCATIONS (
                            LOC_ID CHAR(9) NOT NULL,
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (LOC_ID,DEP_ID));
                            