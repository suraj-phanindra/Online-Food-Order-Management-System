<%@ page import="java.sql.*" %>
<%
  String url = "jdbc:mysql://localhost:3306/food_delivery_system";
  String user = "root";
  String password = "MySQL@411681";
  Connection conn = null;
  PreparedStatement stmt = null;

  try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);
    
    // Get data from the form
    int restaurantId = (int)session.getAttribute("restaurant_id");
    String itemName = request.getParameter("name");
    String itemDescription = request.getParameter("description");
    double itemPrice = (Double.parseDouble(request.getParameter("price")));

    // Prepare the SQL statement
    String sql = "INSERT INTO menu_items (restaurant_id, name, description, price) VALUES (?, ?, ?, ?)";
    stmt = conn.prepareStatement(sql);
    stmt.setInt(1, restaurantId);
    stmt.setString(2, itemName);
    stmt.setString(3, itemDescription);
    stmt.setDouble(4, itemPrice);

    // Execute the statement
    int rowsAffected = stmt.executeUpdate();
    
    if (rowsAffected > 0) {
      out.println("Item added successfully");
    } else {
      out.println("Item not added");
    }
  } catch (SQLException ex) {
    out.println("SQL Exception: " + ex.getMessage());
  } catch (ClassNotFoundException ex) {
    out.println("Class Not Found Exception: " + ex.getMessage());
  } finally {
    try {
      if (stmt != null) {
        stmt.close();
      }
      if (conn != null) {
        conn.close();
      }
    } catch (SQLException ex) {
      out.println("SQL Exception: " + ex.getMessage());
    }
  }
 
%>

<html>
	<head>
	<title>AddMenuItem Status</title>
	  <link rel="stylesheet" type="text/css" href="restaurant.css">
	</head>

</html>
 <br>
 <nav>
 	<ul>
 		<li>  <a href="menu_management.jsp">Back to Menu Management</a>  </li>
 		<li>  <a href="restaurant_owner_dashboard.jsp">Go to Dashboard</a>  </li>
 		<li> <a href="rest_logout.jsp">Logout</a>  </li>
 	</ul>
 
 </nav>

  
 
