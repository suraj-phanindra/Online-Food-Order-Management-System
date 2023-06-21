<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Update Order Status Action</title>
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
		String orderStatus = request.getParameter("order_status");
		try {
			// Connect to the database
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
			
			// Update the order status for the given order ID
			String sql = "UPDATE restaurant_orders SET order_status = ? WHERE order_id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, orderStatus);
			stmt.setInt(2, orderId);
			int rowsUpdated = stmt.executeUpdate();
			
			if (rowsUpdated > 0) {
				out.println("<h1>Order status updated successfully!</h1>");
				out.println("<p>Order ID: " + orderId + "</p>");
				out.println("<p>New Order Status: " + orderStatus + "</p>");
			} else {
				out.println("<h1>Error updating order status</h1>");
			}
		
			if(orderStatus.equalsIgnoreCase("Delivered" )||orderStatus.equalsIgnoreCase("Cancelled")){
				
				String query="Update delivery_personnel set status='available',order_id=null where order_id=?";
				
				PreparedStatement st=conn.prepareStatement(query);
			
				st.setInt(1, orderId);
				
				st.executeUpdate();
			
				st.close();
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			// Close the database resources
			if (stmt != null) {
				try { stmt.close(); } catch (Exception e) {}
			}
			if (conn != null) {
				try { conn.close(); } catch (Exception e) {}
			}
		}
		
		try {
			// Connect to the database
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
			
			// Update the order status for the given order ID
			String sql = "UPDATE orders SET order_status = ? WHERE order_id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, orderStatus);
			stmt.setInt(2, orderId);
			int rowsUpdated = stmt.executeUpdate();
			if(orderStatus.equals("Ready"))
			out.println("Now assign a delievery_personnel for delievery");
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
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
			<li><a href="order_management.jsp">Back to Order Management</a></li>
			<li><a href="rest_logout.jsp">Logout</a></li>
			</ul>
	</nav>
	
	
	
</body>
</html>
