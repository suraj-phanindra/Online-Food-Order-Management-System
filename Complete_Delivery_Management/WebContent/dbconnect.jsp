<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/food_delivery_system"; // change to your database URL
    String username = "your_username"; // change to your MySQL username
    String password = "your_password"; // change to your MySQL password

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, username, password);
        out.println("Database connection successful");
        conn.close();
    } catch (Exception e) {
        out.println("Database connection failed: " + e.getMessage());
    }
%>
