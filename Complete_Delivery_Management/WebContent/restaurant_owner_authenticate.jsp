<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Authentication check</title>
</head>
<body>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
%>

<%
	try {
	    Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
		PreparedStatement stmt = conn.prepareStatement("SELECT * FROM restaurant_owner WHERE username=? AND password=?");
		stmt.setString(1, username);
		stmt.setString(2, password);
		ResultSet rs = stmt.executeQuery();
		
		if (rs.next()) {
			out.println("1");
			session.setAttribute("owner_id", rs.getInt("owner_id"));
			out.println("2");
			response.sendRedirect("restaurant_owner_dashboard.jsp"); 
		} else {
			out.println("Invalid username or password so redirecting to login page in 2 seconds! ");
			response.setHeader("Refresh", "2; URL=restaurant_owner_login.jsp");
		}
		
		conn.close();
	} catch (Exception e) {
		out.println(e);
	}
%>


</body>
</html>