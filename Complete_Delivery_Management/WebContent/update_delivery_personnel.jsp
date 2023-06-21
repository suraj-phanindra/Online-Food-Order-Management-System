<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Update Delivery Personnel</title>
	
</head>
<body>
	<h1>Update Delivery Personnel</h1>
	<%
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int orderId = Integer.parseInt(request.getParameter("order_id"));
		
		try {
			// Connect to the database
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
			
			// Retrieve the list of available delivery personnel
			String sql = "SELECT * FROM delivery_personnel WHERE status = 'available'";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			// Display the list of delivery personnel in a dropdown menu
			%>
			<form method="post" action="process_update_delivery_personnel.jsp">
				<input type="hidden" name="order_id" value="<%= orderId %>">
				<label for="delivery_personnel_id">Select delivery personnel:</label>
				<select name="delivery_personnel_id" id="delivery_personnel_id">
					<%
						while (rs.next()) {
							int deliveryPersonnelId = rs.getInt("delivery_personnel_id");
							String name = rs.getString("name");
							%>
							<option value="<%= deliveryPersonnelId %>"><%= name %></option>
							<%
						}
					%>
				</select>
				<button type="submit">Assign Delivery Personnel</button>
			</form>
			<%
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
</body>
</html>
