<%-- Login page --%>
<%@page import="com.dms.User"%>
<%@page import="com.dms.UserRepository"%>
<%@page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
	int user_id=-1;
    if (username != null && password != null) {
        UserRepository userRepository = new UserRepository();
        User user = userRepository.authenticateUser(username, password);

        if (user != null) {
            // User authenticated successfully, redirect to home page
            session.setAttribute("user", user);
            Connection connection=null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                PreparedStatement statement = connection.prepareStatement("SELECT user_id FROM users WHERE username = ?");
                
                statement.setString(1, username);
                
            
                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    user_id=resultSet.getInt("user_id");        
                } 
                /* statement.close(); */
            } catch (SQLException e) {
                e.printStackTrace();
         
            }
          
            session.setAttribute("user_id",user_id);
		
            response.sendRedirect("home.jsp");
          
        	connection.close(); 
        } else {
            // Invalid username or password, show error message
            out.println("<p>Invalid username or password.</p>");
            
        }
    }
%>
<%-- Login page --%>
<%@page import="com.dms.User"%>
<%@page import="com.dms.UserRepository"%>
<%@page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="login.css">
</head>
<body>
    <h1>User Login</h1>
    <form method="post">
        <label>Username:</label>
        <input type="text" name="username" required><br>
        <label>Password:</label>
        <input type="password" name="password" required><br>
        <input type="submit" value="Login">
        <p class="error">
            <% if (request.getAttribute("error") != null) {
                out.print(request.getAttribute("error"));
            } %>
        </p>
           <p>Don't have an account? <div style="display: inline-block;"><a href="signup.jsp" class="register">Register here</a></div></p>
    	<p>If you are Restaurant Owner <div style="display: inline-block;"><a href="first.jsp" class="register">Go Back to Main Page</a></div></p>
    </form>

   

    
</body>
</html>

<!-- <h1>User Login</h1>
<form method="post">
    <label>Username:</label>
    <input type="text" name="username" required><br>
    <label>Password:</label>
    <input type="password" name="password" required><br>
<input type="submit" value="Login">


			<li><<a href="signup.jsp">Register here </a>></li>
			
	



</form> -->

<%-- End of login page --%>
