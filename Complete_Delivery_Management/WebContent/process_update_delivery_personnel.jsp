<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Process Update Delivery Personnel</title>
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
<body>

	<%
		Connection conn = null;
		PreparedStatement stmt = null;
		int orderId = Integer.parseInt(request.getParameter("order_id"));
		int deliveryPersonnelId = Integer.parseInt(request.getParameter("delivery_personnel_id"));
		int restaurantId=(int)session.getAttribute("restaurant_id");
		try {
			// Connect to the database
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
			
			// Update the delivery personnel for the order
			String sql = "UPDATE restaurant_orders SET delivery_personnel_id = ? , order_status= 'On the way' WHERE order_id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, deliveryPersonnelId);
			stmt.setInt(2, orderId);
			stmt.executeUpdate();
			stmt.close();
			//update status for orders table also
			sql="Update orders set order_status='On the way' where order_id=? ";
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, orderId);
			stmt.executeUpdate();
			stmt.close();
			sql="UPDATE restaurant_orders set delivery_personnel_id=? where order_id=?";
			
			stmt=conn.prepareStatement(sql);
			
			stmt.setInt(1, deliveryPersonnelId);
			
			stmt.setInt(2, orderId);

			stmt.executeUpdate();
		
			stmt.close();
			
			sql = "SELECT order_id FROM restaurant_orders WHERE delivery_personnel_id = ?";
		
			stmt = conn.prepareStatement(sql);
		
			stmt.setInt(1, deliveryPersonnelId);
			
			ResultSet rs = stmt.executeQuery();
		
			while (rs.next()) {
			   orderId = rs.getInt("order_id");
			    // do something with orderId
			 
			}
			rs.close();
			stmt.close();
			sql="Update delivery_personnel set order_id=? where delivery_personnel_id=?";
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, orderId);
			stmt.setInt(2, deliveryPersonnelId);
			stmt.executeUpdate();
			stmt.close();
			
			
			sql="UPDATE delivery_personnel SET status = 'unavailable' WHERE order_id = ? ";
			
			stmt=conn.prepareStatement(sql);
			
			stmt.setInt(1, orderId);
			
			
			stmt.executeUpdate();
			
			stmt.close();
			
			out.println("Successfully Assigned ");
			// Redirect back to the restaurant dashboard
		/* 	response.sendRedirect("restaurant_owner_dashboard.jsp"); */
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// Close the database resources
			if (stmt != null) {
				try { stmt.close(); } catch (Exception e) {}
			}
			if (conn != null) {
				try { conn.close(); } catch (Exception e) {}
			}
		}
	%>
	<br>
	<nav>
	<ul>
		<li><a href="order_management.jsp">Back to Order Management </a></li>
		<li> <a href="restaurant_owner_dashboard.jsp">Go to Dashboard</a></li>
		<li><a href="rest_logout.jsp">Logout</a></li>
	</ul>
	</nav>
	
	

</body>
</html>
