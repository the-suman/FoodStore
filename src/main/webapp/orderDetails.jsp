<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, java.io.*"
	import="com.foodstore.util.*, com.foodstore.enums.*"
	import="com.foodstore.model.*, com.foodstore.service.impl.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>My Profile</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/133ab84eeb.js"></script>
<link href="css/styles.css" rel="stylesheet">
</head>
<body>
	<%
	
	%>
	<!--  Include the header to the page -->
	<jsp:include page="header.jsp" flush="true" />
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<div class="text-center"
		style="color: green; font-size: 24px; font-weight: bold;">Order
		Details</div>
	<div class="container">
		<div class="table-responsive ">
			<table class="table table-hover table-sm">
				<thead class="table-dark">
					<th>Picture</th>
					<th>Product Name</th>
					<th>OrderId</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Time</th>
					<th>Status</th>
				</thead>
				<tbody>
					<tr>
						<td>Alfreds Futterkiste</td>
						<td>Maria Anders</td>
						<td>Germany</td>
					</tr>
					<tr>
						<td>Centro comercial Moctezuma</td>
						<td>Francisco Chang</td>
						<td>Mexico</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!--  Include the footer to the page-->
	<%@ include file="footer.jsp"%>
</body>
</html>