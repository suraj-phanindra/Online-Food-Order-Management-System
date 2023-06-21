<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phone_number = request.getParameter("phone_number");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");

        String query = "INSERT INTO users (username, password, email, phone_number) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        stmt.setString(2, password);
        stmt.setString(3, email);
        stmt.setString(4, phone_number);
        int result = stmt.executeUpdate();

        if(result > 0) {
            response.sendRedirect("login.jsp");
        } else {
            out.println("Error: Sign up failed.");
        }

        conn.close();
    } catch (ClassNotFoundException e) {
        out.println("Error: " + e.getMessage());
    } catch (SQLException e) {
        out.println("Error: " + e.getMessage());
    }
%>
