<html>
<head>
<title>
print_sp.php
</title>
</head>
<body>

<?php

function prtable($table) {
	print "<table border=1>\n";
	while ($a_row = mysqli_fetch_row($table)) {
		print "<tr>";
		foreach ($a_row as $field) print "<td>$field</td>";
		print "</tr>";
	}
	print "</table>";
}

//Import Everything that is in dbguest.php
require("/home/course/cda540/u00/dbguest.php");

//It will import all variables such as $host , $user, $pass and $db

//mysqli_connect() is to connect the database 
$link = mysqli_connect($host, $user, $pass, $db);

//Check the connection. Give error message if any error 
if (!$link) die("Couldn't connect to MySQL");
print "Successfully connected to server<p>";

//Once connection is Successfully done then select the database. Here we want to selected guest database 

//It will print error message if there is any error.

//mysqli_select_db() is used to select the database 
mysqli_select_db($link, $db)
	or die("Couldn't open $db: ".mysqli_error($link));
#print "Successfully selected database \"$db\"<p>";

//Variable with the table name
$table = "sp";

//Run query. Here we are performing select query
//mysqli_query will execute the query and stores into $result

$result = mysqli_query($link, "select * from $table");

//mysqli_num_rows gives number of rows in the table 
$num_rows = mysqli_num_rows($result);
print "There are $num_rows rows in the table<p>";

//It will print the result in the form of table 
prtable($result);

//Close the connection
mysqli_close($link);

print "<p><p>Connection closed. Bye..."
?>

<p>
	
<a href="main.php"> back to MAIN menu</a>
</body>

</html>

