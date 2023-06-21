<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/food_delivery_system"; // change to your database URL
    String uname = "root"; // change to your MySQL username
    String pwd = "MySQL@411681"; // change to your MySQL password
	Connection conn=null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(url, uname, pwd);
        
      
    } catch (Exception e) {
        out.println("Database connection failed: " + e.getMessage());
    }
%>
 <% 
        if (request.getMethod().equals("POST")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String phone_number = request.getParameter("phone_number");
            String name=request.getParameter("uname");
            String address=request.getParameter("address");
            String payment=request.getParameter("payment");
            if (username != null && password != null && email != null && phone_number != null) {
                try {
                    // Check if user already exists in database
                    String query = "SELECT COUNT(*) AS count FROM users WHERE username=?";
                    PreparedStatement stmt = conn.prepareStatement(query);
                    stmt.setString(1, username);
                    ResultSet rs = stmt.executeQuery();
                    rs.next();
                    int count = rs.getInt("count");
                    if (count == 0) {
                        // Insert new user into database
                        query = "INSERT INTO users (username, password, email, phone_number) VALUES (?, ?, ?, ?)";
                        stmt = conn.prepareStatement(query);
                        stmt.setString(1, username);
                        stmt.setString(2, password);
                        stmt.setString(3, email);
                        stmt.setString(4, phone_number);   
                   
                        int result = stmt.executeUpdate();
                        stmt.close();
                        query="Select * from users where username=?";
                        PreparedStatement s=conn.prepareStatement(query);
                        s.setString(1, username);
                        ResultSet r=s.executeQuery();
                        r.next();
                        int userId=r.getInt("user_id");
                        s.close();
                        query="Insert into customers(name,address,payment_method,user_id)values(?,?,?,?)";
                        PreparedStatement st=conn.prepareStatement(query);
                        st.setString(1, name);
                        st.setString(2,address);
                        st.setString(3,payment);
                        st.setInt(4,userId);
                        int result2=st.executeUpdate();
                        st.close();
                        if (result > 0&&result2>0) {
                            // Redirect to login page
                         	out.println("Successfully Registered, Go at bottom of page and click on log in");
                            /* response.sendRedirect("login.jsp"); */
                        } else {
                            out.println("Error: User could not be created.");
                        }
                    } else {
                        out.println("Error: Username already exists. Kindly enter different username");
                    }
                } catch (SQLException e) {
                    out.println("Error: " + e.getMessage());
                }
            } else {
                out.println("Error: Please fill out all fields.");
            }
        }
    conn.close();
    %>
<html>
<head>
<meta charset="UTF-8">
<title>Food Delivery System - Signup</title>
 <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
      }
      
      h1 {
        color: #0066cc;
        text-align: center;
      }
      
      form {
        width: 400px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 5px;
      }
      
      label {
        display: block;
        margin-bottom: 10px;
        color: #666;
      }
      
      input[type="text"],
      input[type="password"],
      input[type="email"],
      input[type="tel"],
      select {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        font-family: Arial, sans-serif;
      }
      
      input[type="submit"] {
        display: block;
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 5px;
        background-color: #0066cc;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
      }
      
      input[type="submit"]:hover {
        background-color: #0052a3;
      }
      
      a {
        color: #008080;
        text-decoration: none;
      }
      
      a:hover {
        text-decoration: underline;
      }
          nav {
      background-color: #0066cc;
      color: white;
      display: flex;
      justify-content: center;
      padding: 10px;
    }
    nav a {
      color: white;
      text-decoration: none;
      margin-left: 20px;
    }
    nav a:hover {
      text-decoration: underline;
    }
    </style>


</head>
<body>
    <h1>Signup</h1>
    <form action="signup.jsp" method="POST">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required > <br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required ><br>
        <label for="phone_number">Phone Number:</label>
      
        	<input type="text" id="phone_number" name="phone_number" required><br><br>
        <label for="uname">Name:</label>
         <input type="text" id="uname" name="uname" required ><br>
           <label for="address">Address:</label>
         <input type="text" id="address" name="address" required ><br>
           <label for="payment">Payment Method:</label>
           <select name="payment" id="payment" required>
           		<option value="Credit_Card"> Credit Card</option>
           		<option value="Debit_Card"> Debit Card</option>
           		<option value="UPI"> UPI</option>
           		<option value="Cash"> Cash</option>
           </select><br>
         <!-- <input type="text" id="payment" name="payment" required><br> -->
        <input type="submit" value="Signup">
       
    </form>
	<form action="login.jsp">

		<input type="submit" value="Login">
	</form>
 
   
    
    <%-- Include database connection code --%>
<%--     <%@ include file="dbconnect.jsp" %> --%>


    <%-- Check if form is submitted and process user input --%>
   
   
</body>
</html>
