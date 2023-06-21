<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout Page</title>
</head>

</html>
<%
    // Invalidate the session and redirect to the login page
    session.invalidate();
    response.sendRedirect("restaurant_owner_login.jsp");
%>