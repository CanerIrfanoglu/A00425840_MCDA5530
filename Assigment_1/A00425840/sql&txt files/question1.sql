# (a) Get the names and locations of the suppliers who have shipped part with pno = 3
SELECT s.sname, s.city
FROM s
INNER JOIN sp
ON s.sno  = sp.sno
WHERE sp.pno = 3;


# (b) Get the part numbers and names of parts that have been shipped by suppliers located in Paris with status at least 20.
SELECT p.pno, p.pname
FROM p
INNER JOIN sp
ON p.pno = sp.pno
INNER JOIN s
ON s.sno = sp.sno
WHERE s.city = "Paris" and s.status >= 20;


# (c) For each part, show the part number, name, and the number of suppliers who have supplied the part.
SELECT p.pno, p.pname, COUNT(DISTINCT(sp.sno)) as no_of_supplier 
FROM p 
INNER JOIN sp
ON p.pno = sp.pno
GROUP BY p.pno;


# (d) For each London supplier who has shipped at least 1000 parts, show the name of the supplier and the total number of parts he/she has shipped.
SELECT c.sname, c.total_shipped
FROM
(SELECT s.sname, s.city, SUM(sp.qty) as total_shipped
FROM s
INNER JOIN sp
ON s.sno = sp.sno
GROUP BY s.sno
HAVING s.city = "London" and total_shipped >= 1000) as c;


# (e) Get the names and cities of the suppliers who have supplied all parts that weigh less than 4 grams.
SELECT  sname, city
FROM(
SELECT s.sname, s.city, p.weight, "invalid" = 
CASE WHEN p.weight > 4 THEN 0 ELSE 1 END as invalid_weight
FROM s
INNER JOIN sp
ON s.sno = sp.sno
INNER JOIN p 
ON p.pno = sp.pno) a 
GROUP BY a.sname, a.city
HAVING SUM(invalid_weight) = 0;



