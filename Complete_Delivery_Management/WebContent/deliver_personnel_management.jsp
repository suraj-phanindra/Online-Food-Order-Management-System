<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%
int restaurant_id = (int) session.getAttribute("restaurant_id");

try {
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
PreparedStatement stmt = conn.prepareStatement("SELECT * FROM restaurants WHERE restaurant_id=?");
stmt.setInt(1, restaurant_id);
ResultSet rs = stmt.executeQuery();
String restaurant_name = null;
if (rs.next()) {
restaurant_name = rs.getString("name");
}

%>

<!DOCTYPE html>
<html>
<head>
	<title>Deliver Personnel Management - <%= restaurant_name %></title>
	<style>
		h1 {
			text-align: center;
			color: #333;
			font-size: 2.5rem;
			margin-bottom: 2rem;
		}
		
		form {
			margin-bottom: 2rem;
		}
		
		label {
			display: block;
			font-weight: bold;
			margin-bottom: 0.5rem;
		}
		
		input[type="text"],
		textarea,
		input[type="number"] {
			padding: 0.5rem;
			border: 1px solid #ccc;
			border-radius: 4px;
			width: 100%;
			margin-bottom: 1rem;
		}
		
		input[type="submit"] {
			background-color: #333;
			color: #fff;
			padding: 0.5rem 1rem;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}
		
		input[type="submit"]:hover {
			background-color: #555;
		}
		
		table {
			width: 100%;
			border-collapse: collapse;
			margin-bottom: 2rem;
		}
		
		th,
		td {
			padding: 0.5rem;
			border: 1px solid #ccc;
			text-align: left;
		}
		
		th {
			background-color: #333;
			color: #fff;
		}
		
nav {
  background-color: #333;
  overflow: hidden;
}

nav ul {
  margin: 0;
  padding: 0;
  list-style: none;
}

nav li {
  float: left;
}

nav li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

nav li a:hover {
  background-color: #111;
}
	</style>
	
</head>
<body>
	<h1>Manage Deliver Personnel for <%= restaurant_name %></h1>
	<!-- Add Deliver Personnel form -->
	<form action="add_deliver_personnel.jsp" method="post">
		<label for="name">Name:</label>
		<input type="text" id="name" name="name" required><br><br>
		<label for="phone_number">Phone Number:</label>
		<input type="text" id="phone_number" name="phone_number" required><br><br>
		<input type="submit" value="Add Deliver Personnel">
	</form>
	
	<!-- Display existing Deliver Personnel -->
<h2>Existing Deliver Personnel</h2>
<table>
	<tr>
		<th>Name</th>
		<th>Phone Number</th>
		<th>Status</th>
	</tr>
	<%
	stmt = conn.prepareStatement("SELECT * FROM delivery_personnel WHERE restaurant_id=?");
	stmt.setInt(1, restaurant_id);
	rs = stmt.executeQuery();
	while(rs.next()){
		String name = rs.getString("name");
		String phone_number = rs.getString("phone_number");
		String status = rs.getString("status");
	%>
	<tr>
		<td><%= name %></td>
		<td><%= phone_number %></td>
		<td><%= status %></td>
	</tr>
	<%
	}
	%>
</table>

<nav>
	<ul>
		<li><a href="restaurant_owner_dashboard.jsp">Back to Dashboard</a></li>
		<li><a href="rest_logout.jsp">Logout</a></li>
		
	</ul>
</nav>
</body>
</html>
<%
conn.close();
} catch (Exception e) {
out.println(e);
}
%>