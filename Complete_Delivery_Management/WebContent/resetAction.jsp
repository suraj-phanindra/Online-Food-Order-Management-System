<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");

try {
    Class.forName("com.mysql.jdbc.Driver");
    String dbUrl = "jdbc:mysql://localhost:3306/food_delivery_system";
    String dbUsername = "root";
    String dbPassword = "MySQL@411681";
    Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
    
    String sql = "UPDATE users SET password = ? WHERE email = ?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, password);
    stmt.setString(2, email);
    int rows = stmt.executeUpdate();
    
    if(rows > 0) {
        out.println("<h2>Password reset successfully!</h2>");
        out.println("As password is reset so you need to login again    ");
        out.println("	So redirecting to login page wait for 1 sec	");
        
        
		response.setHeader("Refresh", "2; URL=login.jsp");
        
        
    } else {
        out.println("<h2>Sorry, email not found or unable to reset password.</h2>");
        out.println("	So redirecting to login page wait for 1 sec	");
    	response.setHeader("Refresh", "2; URL=login.jsp");
    }
    
    stmt.close();
    conn.close();
} catch(Exception ex) {
    out.println("Error: " + ex.getMessage());
    ex.printStackTrace();
}
session.invalidate();
/* response.sendRedirect("login.jsp"); */
%>
<!-- <nav>
<a href="login.jsp">CLICK HERE to Log in</a>
</nav> -->
