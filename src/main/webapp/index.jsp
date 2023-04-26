<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.foodstore.util.*, com.foodstore.service.*, com.foodstore.service.impl.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>FoodKart</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link href="css/styles.css" rel="stylesheet">
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
		<jsp:param name="height" value="510px" />
		
	</jsp:include>
	<%-- <jsp:param name="class" value="container-lg" /> --%>
	
	<%@ include file="footer.jsp"%>
</body>
</html>