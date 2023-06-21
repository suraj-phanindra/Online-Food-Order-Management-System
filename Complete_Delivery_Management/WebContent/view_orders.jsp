<%@page import="com.dms.MenuItemRepository"%>
<%@page import="com.dms.RestaurantRepository"%>
<%@page import="com.dms.OrderRepository"%>
<%@page import="com.dms.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.sql.*" %>
<%/* int restaurantId =(int)(session.getAttribute("restaurant_id"));  */
/* int menuItemId=(int)session.getAttribute("menu_item_id"); */
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");

int customerId=0;
try{
customerId=(int)session.getAttribute("customer_id");
}
catch(Exception e){
	out.println("Nothing");
	out.println(e.getMessage());
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Orders</title>
<link rel="stylesheet" type="text/css" href="view_order.css">

</head>
<body>

<h2>All Orders</h2>
<table>
    <thead>
        <tr>
            <th>Order ID</th>
            <th>Restaurant</th>
            <th>Menu Item</th>
            <th>Quantity</th>
            <th>Total Cost</th>
            <th>Status</th> 
        </tr>
    </thead>
    <tbody>
    	<%	try{
    		String sql="SELECT * FROM orders o JOIN customers c ON o.customer_id = c.customer_id JOIN restaurants r ON o.restaurant_id = r.restaurant_id JOIN menu_items m ON o.menu_item_id = m.item_id where c.customer_id=?";

    		try (PreparedStatement statement = conn.prepareStatement(sql)) {
    			statement.setInt(1,customerId);
//    			statement.setString(2, "%" + cuisine + "%");
    			try (ResultSet resultSet = statement.executeQuery()) {
    				while (resultSet.next()) { %>
    				
    				<tr>
    					<td><%=resultSet.getInt("o.order_id") %></td>
    					<td><%=resultSet.getString("r.name") %></td>
    					<td><%=resultSet.getString("m.name") %></td>
    					<td><%=resultSet.getInt("o.quantity") %></td>
    					<td><%=resultSet.getDouble("o.total_price") %></td>
    					<td><%=resultSet.getString("o.order_status") %></td>
    				</tr>
    				<% }
    			}
    		}
    		
    /* 	orders=orderRepository.getOrdersByRestaurantId(restaurantId); */
    	}
    	catch(Exception e){
    		out.println("error in SQL ");
    		out.println(e.getMessage());
    	}%>
    
    
    </tbody>
</table>
<nav class="navbar">
<ul>
<li><a href="home.jsp">Home Page</a></li>
<li><a href="search.jsp">Order More</a></li>
<li><a href="logout.jsp">Logout</a></li>
</ul>

</nav>
</body>
</html>