<%@page import="com.dms.MenuItem"%>
<%@page import="com.dms.MenuItemRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%
int restaurant_id = (int) session.getAttribute("restaurant_id");
/* out.println(restaurant_id); */
try {
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
MenuItemRepository menuItemRepository = new MenuItemRepository(conn);

/* if (request.getParameter("submit") != null) {
	String name = request.getParameter("name");
	String description = request.getParameter("description");
	Double price = Double.parseDouble(request.getParameter("price"));
	menuItemRepository.createMenuItem(new MenuItem(name, description, price, restaurant_id));
} */

List<MenuItem> menuItems = menuItemRepository.getMenuItemsByRestaurantId(restaurant_id);
conn.close();
%>

<!DOCTYPE html>
<html>
<head>
	<title>Menu Management</title>
	<style>
		h1 {
			text-align: center;
			color: #333;
			font-size: 2.5rem;
			margin-bottom: 2rem;
		}
		
		form {
			margin-bottom: 2rem;
		}
		
		label {
			display: block;
			font-weight: bold;
			margin-bottom: 0.5rem;
		}
		
		input[type="text"],
		textarea,
		input[type="number"] {
			padding: 0.5rem;
			border: 1px solid #ccc;
			border-radius: 4px;
			width: 100%;
			margin-bottom: 1rem;
		}
		
		input[type="submit"] {
			background-color: #333;
			color: #fff;
			padding: 0.5rem 1rem;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}
		
		input[type="submit"]:hover {
			background-color: #555;
		}
		
		table {
			width: 100%;
			border-collapse: collapse;
			margin-bottom: 2rem;
		}
		
		th,
		td {
			padding: 0.5rem;
			border: 1px solid #ccc;
			text-align: left;
		}
		
		th {
			background-color: #333;
			color: #fff;
		}
		
	nav {
  background-color: #333;
  overflow: hidden;
}

nav ul {
  margin: 0;
  padding: 0;
  list-style: none;
}

nav li {
  float: left;
}

nav li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

nav li a:hover {
  background-color: #111;
}
	</style>
</head>
<body>
	<h1>Menu Management</h1>
	<h2>Add New Item</h2>
	<!-- <form method="post">
		<label>Name:</label>
		<input type="text" name="name" required><br><br>
		<label>Description:</label>
		<input type="text" name="description" required><br><br>
		<label>Price:</label>
		<input type="number" step="0.01" name="price" required><br><br>
		<input type="submit" name="submit" value="Add Item">
	</form> -->
	
 <form action="addMenuItem.jsp" method="post">
        <h2>Add Menu Item</h2>
     <%--    <label for="restaurant">Restaurant:</label>
        <select name="restaurant">
            <c:forEach var="restaurant" items="${restaurants}">
                <option value="${restaurant.restaurant_id}">${restaurant.name}</option>
            </c:forEach>
        </select><br> --%>
        <label for="name">Name:</label>
        <input type="text" name="name" required><br>
        <label for="description">Description:</label>
        <textarea name="description" required></textarea><br>
        <label for="price">Price:</label>
        <input type="number" step="1" name="price" required><br>
        <input type="submit" value="Add">
    </form>
	<br><br>
	<h2>Menu Items</h2>
	<table>
		<tr>
			<th>Name</th>
			<th>Description</th>
			<th>Price</th>
		</tr>
		<%
		for (MenuItem menuItem : menuItems) {
		%>
		<tr>
			<td><%= menuItem.getName() %></td>
			<td><%= menuItem.getDescription() %></td>
			<td><%= menuItem.getPrice() %></td>
		</tr>
		<%
		}
		%>
	</table>
	<br>
	<nav>
		<ul>
			<li>	<a href="restaurant_owner_dashboard.jsp">Go Back to Dashboard</a> </li>
			<li> <a href="rest_logout.jsp">Logout</a> </li>
		</ul>
	</nav>

</body>
</html>
<%
} catch (Exception e) {
out.println(e);
}
%>

