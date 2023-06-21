<%@page import="com.dms.MenuItem"%>
<%@page import="com.dms.MenuItemRepository"%>
<%@page import="com.dms.Order"%>
<%@page import="com.dms.OrderRepository"%>
<%@page import="com.dms.Restaurant"%>
<%@page import="com.dms.RestaurantRepository"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%
// Get restaurant ID and menu item ID from query parameters
int restaurantId =(int)(session.getAttribute("restaurant_id")); //Integer.ParseINT is giving error
/* int menuItemId = (int)(session.getAttribute("menu_item_id"));
out.println(menuItemId); */
int customerId=(int)session.getAttribute("customer_id");
/* int quantity=(int)session.getAttribute("quantity");  */
/* int quantity=1,totalPrice=1; */

    // Get quantity value from query parameter
   /*  int quantity=0;
    try{
  quantity = Integer.parseInt(request.getParameter("quantity"));
    }
	catch(Exception e){
		out.println("Error in quantity orders  ");
		out.println(e.getMessage());
	} */
	int menuItemId=0;
	try{
		menuItemId=Integer.parseInt(request.getParameter("menu_item_id"));
		out.println(menuItemId);
	}
	catch(Exception e){
		out.println("ye bhi wrong ");
		out.println(e.getMessage());
	}
	int quantity=0;
    try{ quantity = (int) session.getAttribute("quantity_" + menuItemId); // retrieve the quantity value using the unique name for the menu item
    }
    catch(Exception e){
		out.println("ye bhi wrong 2 ");
		out.println(e.getMessage());
    }


Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
// Retrieve restaurant and menu item from database
RestaurantRepository restaurantRepository = new RestaurantRepository(conn);
Restaurant restaurant = restaurantRepository.getRestaurantById(restaurantId);

MenuItemRepository menuItemRepository = new MenuItemRepository(conn);
MenuItem menuItem = menuItemRepository.getMenuItemById(menuItemId);

double totalPrice=0;
try{
totalPrice=menuItem.getPrice() * quantity;
}
catch(Exception e){
	out.println("Ye bhi wrong 3 ");
	out.println(e.getMessage());
}

// Create new order and save to database
Order order=null;
try{
/* order = new Order(restaurant.getId(), menuItem.getItemId()); */
order =new Order(restaurantId,menuItemId,customerId,quantity,totalPrice);
/* order=new Order(restaurantId,menuItemId,customerId,quantity,totalPrice); */

}
catch(Exception e){
	out.println("error in order ");
	out.println(e.getMessage());
}
OrderRepository orderRepository=null;
try{
	out.println("1");
 orderRepository = new OrderRepository(conn);
 out.println("2");
orderRepository.createOrder(order);
out.println("3");
}
catch(Exception e){
	out.println("error in Creating order ");
	out.println(e.getMessage());
}
// Retrieve all orders for this restaurant
List<Order>orders=null;
try{
orders=orderRepository.getOrdersByRestaurantId(restaurantId);
}
catch(Exception e){
	out.println("error in orderS ");
	out.println(e.getMessage());
}
/* List<Order> orders = orderRepository.getOrdersByRestaurantId(restaurantId); */
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
</head>
<body>
    <h1>Order Confirmation</h1>
    <p>Thank you for your order!</p>
    <p>Restaurant: <%= restaurant.getName() %></p>
  <%
  String menuItemName = "";
  try {
    menuItemName = menuItem.getName();
  } catch(Exception e) {
    out.println(e.getMessage());
  }
%>
<p>Menu Item: <%= menuItemName %></p>
  
   <%
   double menuItemPrice=0;
   try{
	   menuItemPrice=menuItem.getPrice();
   }
   catch(Exception e){
	   out.println(e.getMessage());
   }
   %>
    <p>Price: $<%= menuItemPrice %></p>

<h2>All Orders</h2>
<table>
    <thead>
        <tr>
            <th>Order ID</th>
            <th>Restaurant</th>
            <th>Menu Item</th>
            <th>Quantity</th>
            <th>Total Cost</th>
         <!--    <th>Status</th> -->
        </tr>
    </thead>
    <tbody>
        <% try{for (Order o : orders) { %>
            <tr>
                <td><%= o.getOrderId() %></td>
                <td><%= restaurantRepository.getRestaurantById(restaurantId).getName() %></td>
                <td><%= menuItemRepository.getMenuItemById(menuItemId).getName() %></td>
               <%--  <td>$<%= menuItemRepository.getMenuItemById(o.getMenuItemId()).getPrice() %></td> --%>
               <td><%=o.getQuantity() %></td>
               <td>$<%=o.getTotalPrice() %></td>
             
                
            </tr>
        <% }
        }
        catch(Exception e){
        out.println(e.getMessage());}%>
    </tbody>
</table>

<a href="search.jsp">Back to Search</a>
</body>
</html>






