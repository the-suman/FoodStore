<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.foodstore.util.*, com.foodstore.service.*, com.foodstore.service.impl.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>