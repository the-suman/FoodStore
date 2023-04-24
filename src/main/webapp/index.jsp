<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.foodstore.util.*, com.foodstore.service.*, com.foodstore.service.impl.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodKart</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<style>
/* body {
	background-image: url('img/cake.jpg');
	background-size: cover;
} */
</style>
</head>

<body>

	<jsp:include page="header.jsp" flush="true" />
	<jsp:include page="slideshow.jsp">
		<jsp:param name="height" value="500px" />
		<jsp:param name="class" value="container pt-2" />
	</jsp:include>

	<%@ include file="footer.jsp"%>
	<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>