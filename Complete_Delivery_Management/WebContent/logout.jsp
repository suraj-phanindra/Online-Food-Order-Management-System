<%-- Logout page --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // Invalidate the session and redirect to the login page
    response.setHeader("Expires","0");
    session.invalidate();
    response.sendRedirect("login.jsp");
%>

<h1>Logout successful.</h1>
