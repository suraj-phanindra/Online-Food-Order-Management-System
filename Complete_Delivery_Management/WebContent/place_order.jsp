<%@page import="com.dms.MenuItem"%>
<%@page import="com.dms.MenuItemRepository"%>
<%@page import="com.dms.OrderRepository"%>
<%@page import="com.dms.Order"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Placed</title>
<link rel="stylesheet" type="text/css" href="view_order.css">
</head>
<body>
	<%
// Get form data
int menuItemId = Integer.parseInt(request.getParameter("menu_item_id"));
int quantity = Integer.parseInt(request.getParameter("quantity"));

session.setAttribute("menu_item_id", menuItemId);
session.setAttribute("quantity", quantity);
//Get customer and restaurant IDs from session
int customerId = (int) session.getAttribute("customer_id");
int restaurantId = (int) session.getAttribute("restaurant_id");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
MenuItemRepository menuItemRepository = new MenuItemRepository(conn);
MenuItem menuItem = menuItemRepository.getMenuItemById(menuItemId);
double totalPrice=0;
try{
totalPrice=menuItem.getPrice() * quantity;
}
catch(Exception e){
	out.println("TotalPrice error ");
	out.println(e.getMessage());
}

//Create a new order and set its properties


/* try{
	String query="Insert into restaurant_orders(order_id,restaurant_id,delivery_address,order_status) values(?,?,?,?)";
    PreparedStatement stmt = conn.prepareStatement(query);
    stmt.setInt(1, orderId);
    stmt.setInt(2, restaurantId);
    stmt.setString(3, delivery_address);
    stmt.setString(4, order_status);   

    int result = stmt.executeUpdate();
  
    stmt.close();
}
catch(Exception e){
	out.println(e.getMessage());
} */

Order order = new Order(restaurantId, menuItemId, customerId, quantity, totalPrice);

//Add the order to the database
OrderRepository orderRepository = new OrderRepository(conn);
orderRepository.createOrder(order);

//Retrieve data from the orders and customers tables
/* response.sendRedirect("merge.jsp"); */
int orderId = 0;
try{
	String query="Select * from orders order by order_time desc limit 1";
	 PreparedStatement statement = conn.prepareStatement(query);
	 ResultSet resultSet = statement.executeQuery();
	 while(resultSet.next()){
		 orderId=resultSet.getInt("order_id");
	 }
}
catch(Exception e){
	out.println(e.getMessage());
}
order.setOrderId(orderId);

String deliveryAddress = null;
String orderStatus = null;

try {
 String query = "SELECT * FROM orders JOIN customers ON orders.customer_id = customers.customer_id WHERE orders.order_id = ?";
 PreparedStatement statement = conn.prepareStatement(query);
 statement.setInt(1, orderId);
 ResultSet resultSet = statement.executeQuery();

 while (resultSet.next()) { 
     deliveryAddress = resultSet.getString("address");
     orderStatus = resultSet.getString("order_status");
 }

 resultSet.close();
 statement.close();
} catch(Exception e) {
 out.println(e.getMessage());
}

//Insert data into the restaurant_orders table
try {
 String query = "INSERT INTO restaurant_orders (order_id, restaurant_id, delivery_address, order_status) VALUES (?, ?, ?, ?)";
 PreparedStatement statement = conn.prepareStatement(query);
 statement.setInt(1, orderId);
 statement.setInt(2, restaurantId);
 statement.setString(3, deliveryAddress);
 statement.setString(4, orderStatus);
 int result = statement.executeUpdate();
 statement.close();
} catch(Exception e) {
 out.println(e.getMessage());
}


//Display confirmation message
out.println("Order placed for " + quantity + " of menu item " + menuItem.getName() + " so Total Cost= "+order.getTotalPrice());
%>

<br>
<br>
<nav class="navbar">
		<ul>
			
			<li><a href="search.jsp">Order More Food</a></li>
			<li><a href="view_orders.jsp">View All Orders</a></li>
			<li><a href="home.jsp">Home</a>
			<li><a href="logout.jsp">Logout</a>
		</ul>
	</nav>

</body>
</html>