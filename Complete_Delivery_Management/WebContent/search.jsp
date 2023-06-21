<%@page import="com.dms.Restaurant"%>
<%@page import="com.dms.RestaurantRepository"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%-- <%
    String location = request.getParameter("location");
    String cuisine = request.getParameter("cuisine");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
    RestaurantRepository restaurantRepository =new RestaurantRepository(conn);
    List<Restaurant> restaurants = restaurantRepository.searchRestaurants(location, cuisine);
%> --%>
<html>
<head>
    <title>Search</title>
    <link rel="stylesheet" type="text/css" href="search.css">
</head>
<% String location=" ";
	try{
   	location = request.getParameter("location");
	}
	catch(Exception e){
		out.println(e.getMessage());
	}
	 String locationDefault = "Enter location"; // replace "Enter location" with your desired default value
	  String locationValue = location == null ? locationDefault : location;
 /*    String cuisine = request.getParameter("cuisine"); */
    %>
    <form method="get">
    <label for="location">Search on basis of Location:</label>
    <%-- <input type="text" id="location" name="location" value="<%= locationValue %>"> --%>
    <input type="text" id="location" name="location" value="<%= locationValue %>" onfocus="if(this.value == '<%= locationDefault %>') { this.value = ''; }" onblur="if(this.value == '') { this.value = '<%= locationDefault %>'; }">
<%--     <label for="cuisine">Cuisine:</label>
    <input type="text" id="cuisine" name="cuisine" value="<%= cuisine %>"> --%>
    <button type="submit">Search</button>
</form>
<% String name=" ";
	try{
   	name = request.getParameter("name");
	}
	catch(Exception e){
		out.println(e.getMessage());
	}
	 String nameDefault = "Enter Name"; // replace "Enter location" with your desired default value
	  String nameValue = name == null ? nameDefault : name;
 /*    String cuisine = request.getParameter("cuisine"); */
    %>
 <form method="get">
    <label for="name">Search on basis of Name:</label>
    <%-- <input type="text" id="location" name="location" value="<%= locationValue %>"> --%>
    <input type="text" id="name" name="name" value="<%= nameValue %>" onfocus="if(this.value == '<%= nameDefault %>') { this.value = ''; }" onblur="if(this.value == '') { this.value = '<%= nameDefault %>'; }">
<%--     <label for="cuisine">Cuisine:</label>
    <input type="text" id="cuisine" name="cuisine" value="<%= cuisine %>"> --%>
    <button type="submit">Search</button>
</form>
<% 
	
    Connection conn = null;
    RestaurantRepository restaurantRepository = null;
    List<Restaurant> restaurants=null;
    List<Restaurant> restbnm=null;
    try{
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
    }
    catch(Exception e){
    	out.println(e.getMessage());
    }
    try {
 		
      
       
        restaurantRepository = new RestaurantRepository(conn);
        
        restaurants = restaurantRepository.searchRestaurants(location);
       /*  restaurants = restaurantRepository.searchRestaurants(location, cuisine); */
	   
    } catch (SQLException e) {
        // handle the exception
             out.println("Error message: " + e.getMessage());
        out.println("Error code: " + e.getErrorCode());
        out.println("SQL state: " + e.getSQLState());
        out.println("An error occurred while connecting to the database.");
        e.printStackTrace();
    } /* finally {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    } */
    try {
 		
        
        
        restaurantRepository = new RestaurantRepository(conn);
        
        restbnm = restaurantRepository.searchRestaurantsByName(name);
       /*  restaurants = restaurantRepository.searchRestaurants(location, cuisine); */
	   
    } catch (SQLException e) {
        // handle the exception
             out.println("Error message: " + e.getMessage());
        out.println("Error code: " + e.getErrorCode());
        out.println("SQL state: " + e.getSQLState());
        out.println("An error occurred while connecting to the database.");
        e.printStackTrace();
    }
%>



 <%if(restaurants==null){ %>
	 <p></p>
<%} else if (restaurants.isEmpty()) { %>
    <p></p>
<% } else { %>
    <ul>
    <% out.println("Restaurants based on Search by Location : ");for (Restaurant restaurant : restaurants) { %>
        <li><a href="restaurant.jsp?restaurant_id=<%= restaurant.getId() %>"><%= restaurant.getName() %></a></li>
    <% out.println("Hover over name of restaurant to see menu Items");} %>
    </ul>
<%  /* out.println("<script>");
out.println("document.getElementsByName('location')[0].value = '" + location + "';");
out.println("</script>"); */
} %>


 <%if(restbnm==null){ %>
	 <p></p>
<%} else if (restbnm.isEmpty()) { %>
    <p></p>
<% } else { %>
    <ul>
    <% out.println("Restaurants based on Search by Name : ");for (Restaurant restaurant : restbnm) { %>
        <li><a href="restaurant.jsp?restaurant_id=<%= restaurant.getId() %>"><%= restaurant.getName() %></a></li>
    <% out.println("Hover over name of restaurant to see menu Items");} %>
    </ul>
<%  /* out.println("<script>");
out.println("document.getElementsByName('location')[0].value = '" + location + "';");
out.println("</script>"); */
} %>
<%if(restaurants==null&&restbnm==null){ %>
	<p>An error occurred while searching for restaurants.</p>
	<%} %>
	<%if(restaurants.isEmpty()&&restbnm.isEmpty()){ %>
	<p>No Restaurant found, kindly refer to database if you don't know about location and name</p>
	<%} %>
<%if(restaurants.isEmpty()) %>
<nav class="navbar">

<a href="home.jsp">Back to Home</a><br>
 <a href="logout.jsp">Logout</a>



</nav>

</html>