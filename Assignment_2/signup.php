<?php

	require("/home/student_2018_winter/ca_irfanoglu/public_html/tutorial/Tutorial_files/dbguest.php");

	if (isset($_POST['register_btn'])) {

		$username = $_POST['username'];
		$email = $_POST['email'];
		$mobilenumber = $_POST['mobilenumber'];
		$password = $_POST['password'];
		$password = md5($password);

		$link = mysqli_connect($host, $user, $pass);
		if (!$link) die("Couldn't connect to MySQL");
		//print "Successfully connected to server<p>";

		mysqli_select_db($link, $db)
			or die("Couldn't open $db: ".mysqli_error($link));
		//print "Successfully selected database \"$db\"<p>";

		$sql = "INSERT INTO users(username, email, mobile_no, password) VALUES('$username', '$email', '$mobilenumber', '$password')";
		mysqli_query($link, $sql);
		mysqli_close($link);
		echo "Registration Successful";

	}

?>

<!DOCTYPE html>
<html>
<head>
	<title>Register, login and logout user </title>
</head>
<body>
<div class="header">
	<h1>Register, login and logout user php mysql </h1>
</div>

<form method ="post" action = "signup.php">
	<table>
		<tr>
			<td>Username:</td>
			<td><input type="text" name="username" class= "textInput"></td>
		</tr>
		<tr>
			<td>Email:</td>
			<td><input type="email" name="email" class= "textInput"></td>
		</tr>
		<tr>
			<td>Mobile Number:</td>
			<td><input type="mobilenumber" name="mobilenumber" class= "textInput"></td>
		</tr>
		<tr>
			<td>Password:</td>
			<td><input type="password" name="password" class= "textInput"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" name="register_btn" value="Register"></td>
		</tr>

	</table>
</form>
	
</body>
</html>

