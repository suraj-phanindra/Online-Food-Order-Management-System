<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="profile.css">
</head>
</html>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String email = request.getParameter("email");
String phone_number = request.getParameter("phone_number");
String restaurant_name = request.getParameter("restaurant_name");
String address = request.getParameter("address");
int rating = Integer.parseInt(request.getParameter("rating"));

try {
    // Connect to the MySQL database
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");

    //Check if the username already exists
    PreparedStatement pst = con.prepareStatement("SELECT * FROM restaurant_owner WHERE username=?");
    pst.setString(1, username);
    ResultSet rs = pst.executeQuery();
    if (rs.next()) {
        // Username already exists
        out.println("Username already exists, try with different one");
        %>
        <nav>
        <ul>
        <li> <a href="rest_signup.jsp">Signup</a></li>
        <li> <a href="restaurant_owner_login.jsp">Login</a></li>
        </ul>
      
      
       </nav>
       <% 
        
       /*  response.sendRedirect("rest_signup.jsp?error=Username already exists"); */
        con.close();
        return;
    }

    // Insert data into the "restaurants" table
    String query = "INSERT INTO restaurants (restaurant_id, name, address, phone_number, rating) VALUES (?, ?, ?, ?, ?)";
    PreparedStatement pstmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
    pstmt.setInt(1, 0);
    pstmt.setString(2, restaurant_name);
    pstmt.setString(3, address);
    pstmt.setString(4, phone_number);
    pstmt.setInt(5, rating);
    pstmt.executeUpdate();

    ResultSet generatedKeys = pstmt.getGeneratedKeys();
    generatedKeys.next();
    int restaurant_id = generatedKeys.getInt(1);
    


    // Insert data into the "restaurant_owner" table
    query = "INSERT INTO restaurant_owner (username, password, email, phone_number,restaurant_id) VALUES (?, ?, ?, ?,?)";
    pstmt = con.prepareStatement(query);
    pstmt.setString(1, username);
    pstmt.setString(2, password);
    pstmt.setString(3, email);
    pstmt.setString(4, phone_number);
    pstmt.setInt(5, restaurant_id);
    pstmt.executeUpdate();

    // Insert data into the "restaurant_owners" table
   /*  query = "INSERT INTO restaurant_owners (restaurant_id) VALUES (?)";
    pstmt = con.prepareStatement(query);
    pstmt.setInt(1, restaurant_id);
    pstmt.executeUpdate();
 */
 out.println("Succssfully added");

    /* response.sendRedirect("login.jsp?success=Registration successful"); */
    con.close();
} catch (Exception e) {
    out.println(e.getMessage());
}
%>

   <nav>
        <ul>
   
        <li> <a href="restaurant_owner_login.jsp">Login</a></li>
        </ul>
      
      
       </nav>

