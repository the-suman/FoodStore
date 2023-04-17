<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.foodstore.util.*, com.foodstore.service.*, com.foodstore.service.impl.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<style>
body {
	background-image: url('cake.jpg');
	background-size: cover;
	height: 1000px;
}
</style>
</head>

<body>
	<%@ include file="header2.jsp"%>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="x"%>
	<%
	out.println("REquest"+ request);
	Cookie cookie = new Cookie("sessionIdForCUSTOMER" , "123456789");

	// set the max age for the cookie
	cookie.setMaxAge(600); // Expires after 10 MIN

	// add the cookie to the response
	response.addCookie(cookie);
	%>
	<%@ include file="loginForm.jsp"%>

	<%-- <%@ include file="register.jsp" %> 
 --%>

	<%-- <x:if test="${isLoggedIn}">
	<%@ include file="home.jsp" %>
</x:if>
<x:if test="${!isLoggedIn}">
	<%@ include file="loginForm.jsp" %>
</x:if>
 --%>

	<%@ include file="footer.jsp"%>
	<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>