<%@page import="com.dms.Order"%>
<%@page import="com.dms.OrderRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%
int owner_id = (int) session.getAttribute("owner_id");
int restaurant_id=-1;
/* out.println(owner_id); */
try {
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
PreparedStatement stmt = conn.prepareStatement("SELECT * FROM restaurant_owner Join restaurants ON restaurant_owner.restaurant_id=restaurants.restaurant_id  WHERE owner_id=?");
stmt.setInt(1, owner_id);
ResultSet rs = stmt.executeQuery();
/* out.println("4"); */
String restaurant_name=null;
/* out.println("5"); */
if (rs.next()) {
	/* out.println("1"); */
	 restaurant_name = rs.getString("restaurants.name");
	 restaurant_id=rs.getInt("restaurants.restaurant_id");
	// display restaurant name and order data here
/* 	out.println("2"); */}

%>

<%OrderRepository orderRepository = new OrderRepository(conn);
List<Order> orders = orderRepository.getOrdersByRestaurantId(restaurant_id); 
for(Order order:orders){
	
	
	
	
}
%>
<!DOCTYPE html>
<html>
<head>
	<title>Restaurant Owner Dashboard - <%= restaurant_name %></title>
		<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f5f5f5;
			color: #333;
			margin: 0;
			padding: 0;
		}
		h1 {
			text-align: center;
			margin-top: 50px;
		}
		nav {
			background-color: #333;
			color: #fff;
			padding: 10px;
			margin-top: 20px;
			text-align: center;
		}
		nav ul {
			list-style: none;
			margin: 0;
			padding: 0;
		}
		nav li {
			display: inline-block;
			margin-right: 20px;
		}
		nav a {
			color: #fff;
			text-decoration: none;
			padding: 10px;
			transition: all 0.3s ease;
		}
		nav a:hover {
			background-color: #fff;
			color: #333;
		}
	</style>
</head>
<body>
	<h1>Welcome, <%= restaurant_name %> Owner!</h1>
	<!-- <h2>Order Data</h2> -->
<!-- display order data here -->
<%-- <%out.println("3"); %> --%>
<nav>
<ul>
<li><a href="analytics.jsp">CLICK HERE to see analysis</a></li>
<li><a href="order_management.jsp">CLICK HERE for order management</a></li>
<li><a href="deliver_personnel_management.jsp">CLICK HERE for deliver_personnel management</a>
<li><a href="menu_management.jsp">CLICK HERE for menu management</a>
<!-- <li><a href="restaurant_owner_login.jsp">CLICK HERE if you are restaurant owner</a></li> -->

</ul>
</nav>
<br>
<nav>
<li><a href="rest_logout.jsp">Logout</a></li>
</nav>

</body>
</html>
<%
session.setAttribute("restaurant_id", restaurant_id);
conn.close();
} catch (Exception e) {
/* 	out.println("6"); */
out.println(e);
}
%>
