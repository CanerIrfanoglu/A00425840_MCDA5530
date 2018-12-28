LOAD DATA INFILE '/Users/Caner/Desktop/SMU_Class/Database_5530/Assigment_1/q3_CSV Files/CSV Files/customer.csv' 
INTO TABLE customer 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS

SHOW VARIABLES LIKE "secure_file_priv";

SELECT * FROM customer