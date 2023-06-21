<%@page import="com.dms.Customer"%>
<%@page import="com.dms.CustomerRepository"%>
<%@page import="com.dms.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dms.Restaurant" %>
<%@ page import="com.dms.MenuItem" %>
<%@page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
	<title>Food Delivery Management System</title>
		<link rel="stylesheet" type="text/css" href="home.css">
</head>
<body>
	<%
User user = (User)session.getAttribute("user");
	Connection conn=null;
	try{
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
	}
	catch(Exception e){
		out.println(e.getMessage());
	}
	CustomerRepository customerRepository=new CustomerRepository(conn);
    int userId=(int)session.getAttribute("user_id");
    Customer customer=customerRepository.getCustomerByUserId(userId);
    try{
    session.setAttribute("customer_id", customer.getCustomerId());
    }
    catch(Exception e){
    	out.println("To Buy something and  you have to first give address and payment method");
    }
	int restaurant_id=-1;
	int menu_item_id=-1;
	
%>
	<h1>Welcome to the Food Delivery Management System, <%=user!=null?user.getUsername():"Object is null" %> !</h1>
	<nav>
		<ul>
			<li><a href="profile.jsp">Profile</a></li>
			<li><a href="search.jsp">Search for Restaurants</a></li>
			<li><a href="view_orders.jsp">View Orders</a></li>
			
			<li><a href="logout.jsp">Logout</a></li>
		</ul>
	</nav>
	
</body>
</html>