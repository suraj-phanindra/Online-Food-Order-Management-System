<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Restaurant Owner Signup</title>
	<style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
      }
      
      h1 {
        color: #0066cc;
        text-align: center;
      }
      
      form {
        width: 400px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 5px;
      }
      
      label {
        display: block;
        margin-bottom: 10px;
        color: #666;
      }
      
      input[type="text"],
      input[type="password"],
      input[type="email"],
      input[type="tel"],
      select {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        font-family: Arial, sans-serif;
      }
      
      input[type="submit"] {
        display: block;
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 5px;
        background-color: #0066cc;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
      }
      
      input[type="submit"]:hover {
        background-color: #0052a3;
      }
      
      a {
        color: #008080;
        text-decoration: none;
      }
      
      a:hover {
        text-decoration: underline;
      }
          nav {
      background-color: #0066cc;
      color: white;
      display: flex;
      justify-content: center;
      padding: 10px;
    }
    nav a {
      color: white;
      text-decoration: none;
      margin-left: 20px;
    }
    nav a:hover {
      text-decoration: underline;
    }
    </style>
</head>
<body>
	<h1>Restaurant Owner Signup</h1>
	<form action="register.jsp" method="POST">
		<label for="username">Username:</label>
		<input type="text" id="username" name="username" required><br><br>
			<label for="password">Password:</label>
	<input type="password" id="password" name="password" required><br><br>
	
	<label for="email">Email:</label>
	<input type="email" id="email" name="email" required><br><br>
	
	<label for="phone_number">Phone Number:</label>
	<input type="text" id="phone_number" name="phone_number" required><br><br>
	
	<label for="restaurant_name">Restaurant Name:</label>
	<input type="text" id="restaurant_name" name="restaurant_name" required><br><br>
	
	<label for="address">Address:</label>
	<input type="text" id="address" name="address" required><br><br>
	
	<label for="rating">Rating:</label>
	<input type="number" id="rating" name="rating" required min=0 max=5 style="width: 100%; "><br><br> 
	
	<input type="submit" value="Signup">
</form>
<form action="restaurant_owner_login.jsp">
	<input type="submit" value="Login">
</form>

</body>
</html>