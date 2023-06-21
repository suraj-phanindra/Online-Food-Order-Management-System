<%@page import="java.sql.*"%>
<%
int restaurant_id = (int) session.getAttribute("restaurant_id");

if (request.getMethod().equals("POST")) {
    try {
        String name = request.getParameter("name");
        String phone_number = request.getParameter("phone_number");
        
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
        PreparedStatement stmt = conn.prepareStatement("INSERT INTO delivery_personnel (name, phone_number, status, restaurant_id) VALUES (?, ?, ?, ?)");
        stmt.setString(1, name);
        stmt.setString(2, phone_number);
        stmt.setString(3, "available");
        stmt.setInt(4, restaurant_id);
        
        stmt.executeUpdate();
        
        out.println("<p>New delivery personnel added successfully!</p>");
        
        conn.close();
    } catch (Exception e) {
        out.println("<p>Error adding delivery personnel: " + e.getMessage() + "</p>");
    }
}
%>
<html>
<head>
	<style>
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
</html>

<nav>
	<ul>
		<li><a href="deliver_personnel_management.jsp">Go Back to deliver_personnel Management</a> </li>
		<li><a href="rest_logout.jsp">Logout</a></li>
	</ul>
</nav>

