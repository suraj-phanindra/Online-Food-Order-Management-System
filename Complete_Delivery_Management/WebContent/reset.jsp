<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        
        h1 {
            color: #333;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
        }
        
        input[type="email"],
        input[type="password"] {
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 300px;
            margin-bottom: 10px;
        }
        
        input[type="submit"] {
            background-color: #008CBA;
            color: white;
            padding: 10px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }
        
        input[type="submit"]:hover {
            background-color: #006E8C;
        }
        
        a {
            color: #008CBA;
            text-decoration: none;
            margin-right: 10px;
        }
        
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Reset Password</h1>
    <form action="resetAction.jsp" method="post">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="password">New Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <input type="submit" value="Reset Password">
    </form>
    <br>
    <a href="profile.jsp">Back to Profile Page</a><br>
    <a href="logout.jsp">Logout</a>
</body>
</html>
