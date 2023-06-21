<%-- Profile page --%>
<%@page import="com.dms.Customer"%>
<%@page import="com.dms.CustomerRepository"%>
<%@page import="com.dms.User"%>
<%@page import="com.dms.UserRepository"%>
<%@page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <title>Profile</title>
    <link rel="stylesheet" type="text/css" href="profile.css">
</head>

<%
    // Get the user_id from the session
    int user_id = (int) session.getAttribute("user_id");

    // Retrieve the User object from the database
/*     UserRepository userRepository = new UserRepository();
    User user = userRepository.getUserById(user_id); */

    // Retrieve the Customer object from the database
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
    CustomerRepository customerRepository = new CustomerRepository(conn);
    Customer customer = customerRepository.getCustomerByUserId(user_id);
    
    UserRepository userRepo=new UserRepository(conn);
    User userr=userRepo.getUserById(user_id);
%>

<%-- <h1>Welcome <%= user.getUsername() %>!</h1>
<form method="post">
<% if (customer != null) { %>
    <label>Name:</label>
    <input type="text" name="name" value="<%= customer.getName() %>" required><br>
    <label>Address:</label>
    <input type="text" name="address" value="<%= customer.getAddress() %>" required><br>
    <label>Payment Method:</label>
    <input type="text" name="payment_method" value="<%= customer.getPaymentMethod() %>" required><br>
      <button type="submit">Save Changes</button>
<% } else { %>
    <p>Unable to retrieve customer information.</p>
<% } %>
</form>


<%
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String paymentMethod = request.getParameter("payment_method");

    if (name != null && address != null && paymentMethod != null) {
        // Update the customer object with the new values
        customer.setName(name);
        customer.setAddress(address);
        customer.setPaymentMethod(paymentMethod);

        // Save the updated customer object to the database
        customerRepository.updateCustomer(customer);

        // Show success message
        out.println("<p>Your profile has been updated.</p>");
    }
%> --%>


<h1>Welcome <%= userr.getUsername() %>!</h1>
<form method="post" action="profile.jsp">
<% if (customer != null) { %>
    <label>Name:</label>
    <input type="text" name="name" value="<%= customer.getName() %>" required><br>
    <label>Address:</label>
    <input type="text" name="address" value="<%= customer.getAddress() %>" required><br>
    <label>Payment Method:</label>
   
    
    <input type="text" name="payment_method" value="<%= customer.getPaymentMethod() %>" required><br> 
    <label>Phone Number:</label>
    <input type="text" name="phone" value="<%=userr.getPhoneNumber() %>" required><br>
    
    <label>Email</label>
    <input type="text" name="email" value="<%=userr.getEmail() %>" required><br>
    <button type="submit">Save Changes</button>
<% } else { %>
    <p>Unable to retrieve customer information.</p>
<% } %>
</form>

<%
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String paymentMethod = request.getParameter("payment_method");
    
	String phone_number=(request.getParameter("phone"));
	
	String email=request.getParameter("email");
	
    if (name != null && address != null && paymentMethod != null&&phone_number!=null&&email!=null) {
    	
    	String query="Update users set phone_number=?,email=? where user_id=?";
    	try {
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, phone_number);
            stmt.setString(2, email);
            stmt.setInt(3, user_id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // Update the customer object with the new values
        customer.setName(name);
        customer.setAddress(address);
        customer.setPaymentMethod(paymentMethod);
    
		userr.setPassword(phone_number);
	
		userr.setEmail(email);
        // Save the updated customer object to the database
    
        userRepo.updateUser(userr);
      
        customerRepository.updateCustomer(customer);
		
        // Show success message
        out.println("<p>Your profile has been updated.</p>");

        // Set the value attribute of the corresponding input tags to the updated values
        out.println("<script>");
        out.println("document.getElementsByName('name')[0].value = '" + name + "';");
        out.println("document.getElementsByName('address')[0].value = '" + address + "';");
        out.println("document.getElementsByName('payment_method')[0].value = '" + paymentMethod + "';");
        out.println("document.getElementsByName('phone')[0].value = '" + phone_number + "';");
        out.println("document.getElementsByName('email')[0].value = '" + email + "';");
        out.println("</script>");
        
        session.setAttribute("customer", customer);//will be used in orders.jsp
        //DOubt:may be it should be present in home.jsp
       
    }
    
    conn.close();
%>
<nav>
		<ul>
	<li><a href="reset.jsp">Click Here to Reset Password</a></li>
	<li> <a href="home.jsp">Back to Home</a> </li>
	<li><a href="logout.jsp">Logout</a></li>
		</ul>
	</nav>
<!-- <a href="reset.jsp">Reset Password</a> -->

