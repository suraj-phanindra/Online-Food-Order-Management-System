<!DOCTYPE html>
<html>
<head>
	<title>Restaurant Owner Login</title>
	    <link rel="stylesheet" type="text/css" href="login.css">
</head>
<body>
	<h1>Restaurant Owner Login</h1>
	<form method="post" action="restaurant_owner_authenticate.jsp">
		<label>Username:</label>
		<input type="text" name="username" required><br>
		<label>Password:</label>
		<input type="password" name="password" required><br>
		<input type="submit" value="Login">
		<p>Don't have an account? <div style="display: inline-block;"><a href="rest_signup.jsp" class="register">REGISTER HERE</a></div></p>
	<p>If you are User <div style="display: inline-block;"><a href="first.jsp" class="register">Go Back to Main Page</a></div></p>
	</form>
	
	
</body>
</html>
