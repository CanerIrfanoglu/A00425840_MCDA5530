<?php

	require("/home/student_2018_winter/ca_irfanoglu/public_html/tutorial/Tutorial_files/dbguest.php");

	if (isset($_POST['login_btn'])) {

		$email = $_POST['email'];
		$password = $_POST['password'];

		$link = mysqli_connect($host, $user, $pass);
		if (!$link) die("Couldn't connect to MySQL");
		//print "Successfully connected to server<p>";

		mysqli_select_db($link, $db)
			or die("Couldn't open $db: ".mysqli_error($link));
		//print "Successfully selected database \"$db\"<p>";

		$sql = "SELECT email, password FROM users WHERE email = '$email' AND password = '$password' ";
		$result = mysqli_query($link, $sql);

		$row = mysqli_fetch_assoc($result);

		if (!empty($row)){
			echo "Login Successful.";
		}
		else {
			echo "Invalid email password combination. Please try again.";
		}

		
		


		mysqli_close($link);
		}
		

	

?>

<!DOCTYPE html>
<html>
<head>
	<title>Login user </title>
</head>
<body>
<div class="header">
	<h2>Please enter email and password to login </h2>
</div>

<form method ="post" action = "login.php">
	<table>
		<tr>
			<td>Email:</td>
			<td><input type="email" name="email" class= "textInput"></td>
		</tr>
			<td>Password:</td>
			<td><input type="password" name="password" class= "textInput"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" name="login_btn" value="Login"></td>
		</tr>
	</table>
</form>
	
</body>
</html>

