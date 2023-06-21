<%@page import="com.dms.Customer"%>
<%@page import="com.dms.CustomerRepository"%>
<%@page import="com.dms.MenuItem"%>
<%@page import="com.dms.MenuItemRepository"%>
<%@page import="com.dms.Restaurant"%>
<%@page import="com.dms.RestaurantRepository"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>

<%@ page import="java.sql.*" %>
<%
    // Get restaurant ID from query parameter
    int restaurantId = Integer.parseInt(request.getParameter("restaurant_id"));
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
RestaurantRepository restaurantRepository =new RestaurantRepository(conn);
    // Retrieve restaurant and menu items from database
/*     RestaurantRepository restaurantRepository = new RestaurantRepository(); */
    Restaurant restaurant = restaurantRepository.getRestaurantById(restaurantId);
    MenuItemRepository menuItemRepository = new MenuItemRepository(conn);
    List<MenuItem> menuItems = menuItemRepository.getMenuItemsByRestaurantId(restaurantId);
    int restaurant_id=restaurant.getId();
    session.setAttribute("restaurant_id", restaurant_id);
    CustomerRepository customerRepository=new CustomerRepository(conn);
    int userId=(int)session.getAttribute("user_id");
    Customer customer=customerRepository.getCustomerByUserId(userId);
    session.setAttribute("customer_id", customer.getCustomerId());
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Details</title>
    <link rel="stylesheet" type="text/css" href="restaurant.css">
    
</head>
<body>
    <h1><%= restaurant.getName() %></h1>
    <p>Location: <%= restaurant.getAddress() %></p>
    <p>Phone: <%= restaurant.getPhoneNumber() %></p>
    <p>Rating: <%= restaurant.getRating() %>/5</p>

    <h2>Menu Items</h2>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Quantity</th>
                
            </tr>
        </thead>
        <tbody>
            <% for (MenuItem menuItem : menuItems) { %>
                <tr>
                    <td><%= menuItem.getName() %></td>
                    <td><%= menuItem.getDescription() %></td>
                    <td><%= menuItem.getPrice() %></td>
                    <td><form method="post" action="place_order.jsp"> 
                    <input type="hidden" name="menu_item_id" value="<%= menuItem.getItemId() %>">
                    <input type="number" name="quantity" required min=1>
                      <input type="submit" value="Place Order">
                    </form>
                   </td>
                </tr>
            <% } %>
        </tbody>
    </table>
    
	<!-- <a href="orders.jsp">Click here to order from this restaurant</a> -->

    <nav>
		<ul>
			<li><a href="search.jsp">Back To Search</a></li>
			<li><a href="view_orders.jsp">View All Orders</a></li>
			<li><a href="logout.jsp">Logout</a>
	
		</ul>
	</nav>
</body>
</html>
