<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Assign Delivery Personnel</title>
		<link rel="stylesheet" type="text/css" href="restaurant.css">
</head>
<body>
	<h1>Assign Delivery Personnel</h1>
	<form method="post" action="process_update_delivery_personnel.jsp">
		<p><label>Order ID:</label> <%= request.getParameter("order_id") %></p>
		<p><label>Select a available delivery personnel:</label>
			<select name="delivery_personnel_id">
				<%
					Connection conn = null;
					PreparedStatement stmt = null;
					ResultSet rs = null;
					
					try {
						// Connect to the database
						Class.forName("com.mysql.jdbc.Driver");
						conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
						
						// Retrieve the list of available delivery personnel for this restaurant
						String sql = "SELECT * FROM delivery_personnel WHERE restaurant_id = ? AND status = 'available' ";
						
						stmt = conn.prepareStatement(sql);
						stmt.setInt(1, (int)session.getAttribute("restaurant_id"));
						rs = stmt.executeQuery();
						
						// Display each available delivery personnel in a dropdown menu option
						while (rs.next()) {
							int deliveryPersonnelId = rs.getInt("delivery_personnel_id");
							String name = rs.getString("name");
							%>
							<option value="<%= deliveryPersonnelId %>"><%= name %></option>
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
			</select>
		</p>
		<input type="hidden" name="order_id" value="<%= request.getParameter("order_id") %>">
		<button type="submit">Assign Delivery Personnel</button>
	</form>
	
	<br>
	<nav>
	<ul> 
	<li><a href="restaurant_owner_dashboard.jsp">Return to Dashboard</a>	</li>
	<li><a href="rest_logout.jsp">Logout</a>	</li>
	</ul>
	</nav>
	
</body>
</html>



