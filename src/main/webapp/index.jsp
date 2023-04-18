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
	<%-- <%@ include file="header.jsp"%> --%>
	
	<jsp:include page="header.jsp" flush="true"/>
		
	<label style="min-height:800px;">User Home</label>
	

	<%@ include file="footer.jsp"%>
	<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>