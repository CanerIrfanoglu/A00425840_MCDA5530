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

	echo "<h2>Listing all registered users... </h2>";

	require("/home/student_2018_winter/ca_irfanoglu/public_html/tutorial/Tutorial_files/dbguest.php");

		$link = mysqli_connect($host, $user, $pass);
		if (!$link) die("Couldn't connect to MySQL");
		//print "Successfully connected to server<p>";

		mysqli_select_db($link, $db)
			or die("Couldn't open $db: ".mysqli_error($link));
		//print "Successfully selected database \"$db\"<p>";

		$sql = "SELECT * FROM users";
		$result = mysqli_query($link, $sql);

		prtable($result);
	
		mysqli_close($link);

?>


