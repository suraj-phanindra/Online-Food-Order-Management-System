<%@page import="com.dms.CustomerRepository"%>
<%@page import="com.dms.Order"%>
<%@page import="com.dms.OrderRepository"%>
<%@page import="com.dms.MenuItem"%>
<%@page import="com.dms.MenuItemRepository"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%@page import="java.sql.*" %>
<%
    // Retrieve the restaurant ID from the session
    int restaurantId = (int) session.getAttribute("restaurant_id");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
    // Get the menu items of the restaurant
    MenuItemRepository menuItemRepository = new MenuItemRepository(conn);
    List<MenuItem> menuItems = menuItemRepository.getMenuItemsByRestaurantId(restaurantId);

    // Get the orders of the restaurant
    OrderRepository orderRepository = new OrderRepository(conn);
    List<Order> orders = orderRepository.getOrdersByRestaurantId(restaurantId);
    
    CustomerRepository customerRepository = new CustomerRepository(conn);
	
    // Calculate the total revenue and number of orders
    double totalRevenue = 0;
    int numOrders = 0;
    double averageRevenue=0;
    
    //for order analysis
    int orderId=0;
    String date=null;
   	String custName=null;
   	String itemName=null;
   	int orderQuant=0;
   	double orderRevenue=0;
    
    //for menu_item analysis
    int menuId=0;
    String menuName=null;
    double menuPrice=0;
    int menuOrders=0;
    double menuRevenue=0;
   
    
    try{
		String sql="Select sum(quantity) as total_quantity, sum(total_price) as total_sum from orders where restaurant_id=?";
    	try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, restaurantId);
//			statement.setString(2, "%" + cuisine + "%");
			try (ResultSet resultSet = stmt.executeQuery()) {
				while (resultSet.next()) { 
					numOrders=resultSet.getInt("total_quantity");
					totalRevenue=resultSet.getDouble("total_sum");
				 }
			}
		}
	}
	catch(Exception e){
		out.println(e.getMessage());
	}
    if(numOrders!=0){
    averageRevenue=totalRevenue/numOrders;
    }

     try{
    	String sql="Select count(*) as count from restaurant_analytics where restaurant_id=?";
    	PreparedStatement stmt=conn.prepareStatement(sql);
    	stmt.setInt(1, restaurantId);
    	ResultSet rs=stmt.executeQuery();
    	rs.next();
    	int count=rs.getInt("count");
    	
    	if(count==0){
    		String query = "INSERT INTO restaurant_analytics (restaurant_id, order_count, revenue, average_order_price) VALUES (?, ?, ?, ?)";
    		/* sql="Insert into restaurant_analytics(restaurant_id,order_count,revenue,average_order_price) values(?,?,?,?)"; */
    		PreparedStatement st=conn.prepareStatement(query);
    	
    		st.setInt(1, restaurantId);
    		st.setInt(2, numOrders);
    		st.setDouble(3, totalRevenue);
    		st.setDouble(4, averageRevenue);
    		int result=st.executeUpdate();
    	}
    }
    catch(Exception e){
    	out.println(e.getMessage());
    }
%>

<html>
<head>
<title>Analytics</title>

<link rel="stylesheet" type="text/css" href="restaurant.css">


</head>


<body>

<h1>Analytics</h1>

<h2>Summary</h2>
<table>
    <tr>
        <td>Total Revenue:</td>
            <td><%=String.format("$%.2f", totalRevenue)%></td>
  
    </tr>
    <tr>
        <td>Number of Orders:</td>
             <td><%=numOrders%></td>
    
    </tr>
     <tr>
        <td>Average Order Price:</td>
             <td><%=String.format("$%.2f", averageRevenue) %></td>
    
    </tr>
</table>

<h2>Menu Item Analytics of Ordered Menu Items</h2>
<table>
    <tr>
        <th>Item Name</th>
        <th>Price</th>
        <th>Number of Orders</th>
        <th>Revenue</th>
    </tr>
      <%for(MenuItem item: menuItems){
    
    	menuId=item.getItemId();
    	
    	
    	try{
    		String query="Select sum(quantity) as total_quantity ,sum(total_price) as total_revenue from orders join menu_items on orders.menu_item_id=menu_items.item_id where menu_items.item_id= ? group by menu_item_id ";
        	try (PreparedStatement statement = conn.prepareStatement(query)) {
    			statement.setInt(1,menuId);
//    			statement.setString(2, "%" + cuisine + "%");
    			try (ResultSet resultSet = statement.executeQuery()) {
    				while (resultSet.next()) { %>
    				
    				<tr>
    					<td><%=item.getName() %></td>
    					<td><%=item.getPrice() %></td>
    					<td><%=resultSet.getString("total_quantity") %></td>
    					<td><%=resultSet.getString("total_revenue") %></td>
    					
    					
    					
    				</tr>
    				<%
    				menuName=item.getName();
    				menuPrice=item.getPrice();
    				menuOrders=(Integer.parseInt(resultSet.getString("total_quantity")));
    				menuRevenue= Double.parseDouble(resultSet.getString("total_revenue"));
    				}
    			}
    		}
    	}
    	catch(Exception e){
    		out.println(e.getMessage());
    	}
    	
    	
    	   try{
    	    	String sql="Select count(*) as count from menu_analytics where item_id=?";
    	    	PreparedStatement stmt=conn.prepareStatement(sql);
    	    	stmt.setInt(1, menuId);
    	    	ResultSet rs=stmt.executeQuery();
    	    	rs.next();
    	    	int count=rs.getInt("count");
    	    	
    	    	if(count==0){
    	    		String query = "INSERT INTO menu_analytics (item_id, item_name,item_price,total_orders,total_revenue) VALUES (?, ?, ?, ?,?)";
    	    		/* sql="Insert into restaurant_analytics(restaurant_id,order_count,revenue,average_order_price) values(?,?,?,?)"; */
    	    		PreparedStatement st=conn.prepareStatement(query);
    	    	
    	    		st.setInt(1, menuId);
    	    		st.setString(2, menuName);
    	    		st.setDouble(3, menuPrice);
    	    		st.setInt(4, menuOrders);
    	    		st.setDouble(5, menuRevenue);
    	    		int result=st.executeUpdate();
    	    	}
    	    /* 	else{
    	    		String query="Update menu_analytics set item_name=?,item_price=?,total_orders=?,total_revenue=? where item_id=?";
    	    		PreparedStatement sta=conn.prepareStatement(query);
        	    	
    	    
    	    		sta.setString(1, menuName);
    	    		sta.setDouble(2, menuPrice);
    	    		sta.setInt(3, menuOrders);
    	    		sta.setDouble(4, menuRevenue);
    	    		sta.setInt(5,menuId);
    	    		int result=sta.executeUpdate();
    	    	} */
    	    }
    	    catch(Exception e){
    	    	out.println(e.getMessage());
    	    }
      }
    %>
    
</table>


       <h2>Order Analytics</h2>
<table>
    <tr>
        <th>Order ID</th>
        <th>Date and Time</th>
        <th>Customer Name</th>
        <th>Items</th>
        <th>Quantity</th>
        <th>Total Price</th>
    </tr>
    <%for(Order order: orders){
    	orderId=order.getOrderId();
    	try{
    		String query="Select * from orders join menu_items on orders.menu_item_id=menu_items.item_id join customers on orders.customer_id=customers.customer_id where orders.order_id=?";
        	try (PreparedStatement statement = conn.prepareStatement(query)) {
    			statement.setInt(1,orderId);
//    			statement.setString(2, "%" + cuisine + "%");
    			try (ResultSet resultSet = statement.executeQuery()) {
    				while (resultSet.next()) { %>
    				
    				<tr>
    					<td><%=resultSet.getInt("orders.order_id") %></td>
    					<td><%=resultSet.getString("orders.order_time") %></td>
    					<td><%=resultSet.getString("customers.name") %></td>
    					<td><%=resultSet.getString("menu_items.name") %></td>
    					<td><%=resultSet.getInt("orders.quantity") %></td>
    					<td><%=resultSet.getDouble("orders.total_price") %></td>
    				</tr>
    				
    				<% 
    				 orderId=resultSet.getInt("orders.order_id");
	    		     date=resultSet.getString("orders.order_time");
	    		   	custName=resultSet.getString("customers.name");
	    		   	itemName=resultSet.getString("menu_items.name");
	    		   	orderQuant=resultSet.getInt("orders.quantity");
	    		   	orderRevenue=resultSet.getDouble("orders.total_price");
    				
    				}
    			}
    		}
    	}
    	catch(Exception e){
    		out.println(e.getMessage());
    	}
    	
    	//updating database
    	 try{
    	    	String sql="Select count(*) as count from order_analytics where order_id=?";
    	    	PreparedStatement stmt=conn.prepareStatement(sql);
    	    	stmt.setInt(1, orderId);
    	    	ResultSet rs=stmt.executeQuery();
    	    	rs.next();
    	    	int count=rs.getInt("count");
    	    	
    	    	if(count==0){
    	    		 
    	    		String query = "INSERT INTO order_analytics (order_id, date, customer_name,items,quantity,total_revenue) VALUES (?, ?, ?, ?, ?, ?)";
    	    		/* sql="Insert into restaurant_analytics(restaurant_id,order_count,revenue,average_order_price) values(?,?,?,?)"; */
    	    		PreparedStatement st=conn.prepareStatement(query);
    	    	
    	    		st.setInt(1, orderId);
    	    		st.setString(2, date);
    	   			st.setString(3, custName);
    	    		st.setString(4, itemName);
    	    		st.setInt(5, orderQuant);
    	    		st.setDouble(6, orderRevenue);
    	    		int result=st.executeUpdate();
    	    	}
    	    }
    	    catch(Exception e){
    	    	out.println(e.getMessage());
    	    }
    	
    	
    }
    
    %>
    

</table>    
<br>
<nav>
<ul>
<li> <a href="restaurant_owner_dashboard.jsp">Back to Dashboard</a></li>
<li> 
<a href="rest_logout.jsp">Logout</a>     </li>
</ul>



</nav>
      
</body>

</html>
		