<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Restaurant Dashboard</title>
	<link rel="stylesheet" type="text/css" href="restaurant.css">
	
</head>
<body>
	<h1>Order Management</h1>
	<table>
		<thead>
			<tr>
				<th>Order ID</th>
				<th>Customer Name</th>
				<th>Delivery Address</th>
				<th>Order Status</th>
				<th>Assign Delivery Personnel</th>
				<th>Update Order Status</th>
			</tr>
		</thead>
		<tbody>
			<% 
				Connection conn = null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				int restaurantId=(int)session.getAttribute("restaurant_id");
			/* 	out.println(restaurantId); */
				try {
					// Connect to the database
					
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
					
					int del_id=0;
					// Retrieve the list of orders for this restaurant
					String sql = "SELECT o.order_id, c.name, ro.delivery_address, ro.order_status,ro.delivery_personnel_id FROM orders o JOIN customers c ON o.customer_id = c.customer_id JOIN restaurant_orders ro ON o.order_id = ro.order_id WHERE ro.restaurant_id = ?"; 
								
								
					stmt = conn.prepareStatement(sql);
					stmt.setInt(1, restaurantId);
					rs = stmt.executeQuery();
					
					// Display each order in a table row
					while (rs.next()) {
						int orderId = rs.getInt("order_id");
						String customerName = rs.getString("name");
						String deliveryAddress = rs.getString("delivery_address");
						String orderStatus = rs.getString("order_status");
						del_id=rs.getInt("delivery_personnel_id");
						%>
						<tr>
							<td><%= orderId %></td>
							<td><%= customerName %></td>
							<td><%= deliveryAddress %></td>
							<td><%= orderStatus %></td>
							<td>
	<form method="post" action="assign_delivery_personnel.jsp">
		<input type="hidden" name="order_id" value="<%= orderId %>">
		<button type="submit" <%= orderStatus.equals("On the way") || orderStatus.equals("Delivered")||orderStatus.equals("New") ||orderStatus.equals("Preparing")   ? "disabled" : "" %>>Assign</button>
	</form>
</td>

							<td>
								<form method="post" action="update_order_status_action.jsp">
									<input type="hidden" name="order_id" value="<%= orderId %>">
									<select name="order_status">
   
    <% if (orderStatus.equals("New")) { %>
        <option value="Preparing" >Preparing</option>
        <option value="Ready" >Ready</option>
       <!--  <option value="On the way" >On the way</option> -->
    <!--     <option value="Delivered" >Delivered</option> -->
         <!--  <option value="Cancelled" >Cancelled</option> -->
    <% } else if (orderStatus.equals("Preparing")) { %>
       
        <option value="Ready" >Ready</option>
  <!--       <option value="On the way" >On the way</option>
        <option value="Delivered" >Delivered</option> -->
        <!--       <option value="Cancelled" >Cancelled</option> -->
    <% } else if (orderStatus.equals("Ready")) { %>
      	
<!-- 
        <option value="On the way" >On the way</option>
        <option value="Delivered" >Delivered</option> -->
           <!--    <option value="Cancelled" >Cancelled</option> -->
    <% } else if (orderStatus.equals("On the way")) { %>
                
      
        <option value="Delivered" >Delivered</option>
             
    <% } else if (orderStatus.equals("Delivered")) {out.println("Successfuly deliverd"); }%>
        	
  
</select>
<button type="submit" <%= orderStatus.equals("Delivered") ||(orderStatus.equals("Ready")&& del_id==0) ? "disabled" : "" %>>Update</button>

									
								</form>
							</td>
						</tr>
						<%
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					// Close the database resources
					if (rs != null) {
						try { rs.close(); } catch (Exception e) {}
					}
					if (stmt != null) {
						try { stmt.close(); } catch (Exception e) {}
					}
					if (conn != null) {
						try { conn.close(); } catch (Exception e) {}
					}
				}
			%>
		</tbody>
	</table>
	<br>
	<nav>
	<ul>
		<li><a href="restaurant_owner_dashboard.jsp">Return to Dashboard</a>	</li>
		<li>	<a href="rest_logout.jsp">Logout</a> </li>
	</ul>
	</nav>
	


</body>
</html>
