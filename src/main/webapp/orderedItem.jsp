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
	User user = FoodUtil.getCurrentUser(request);
	CartItem cartItem = (CartItem) request.getAttribute("cartitem");
	
	Item item = (Item) request.getAttribute("item");

	String description = item.getDescription();

	if (description == null)
		description = "";
	description = description.substring(0, Math.min(description.length(), 50));
	if (description.length() == 50)
		description += ".. <a href='#' style='text-decoration:none; font-size:12px;'>View Details</a>";
	%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	
	<div class="card shadow-0 border mb-4">
		<div class="card-body">
			<div class="row">
				<div class="col-md-2">
					<img src="<%=FoodUtil.showImage(item.getImage())%>"
						class="img-fluid" alt="Phone">
				</div>
				<div
					class="col-md-2 text-center d-flex justify-content-center align-items-center">
					<p class="text-muted mb-0"><%=item.getName()%></p>
				</div>
				<%-- <div
					class="col-md-2 text-center d-flex justify-content-center align-items-center">
					<p class="text-muted mb-0 small"><%=description%></p>
				</div> --%>
				
				<div
					class="col-md-2 text-center d-flex justify-content-center align-items-center">
					<p class="text-muted mb-0 small"><%=cartItem.getQty()%></p>
				</div>
				<div
					class="col-md-2 text-center d-flex justify-content-center align-items-center">
					<p class="text-muted mb-0 small">$<%=item.getPrice()%></p>
				</div>
				<div
					class="col-md-2 text-center d-flex justify-content-center align-items-center">
					<p class="text-muted mb-0">Order Placed</p>
				</div>
			</div>
			<hr class="mb-4" style="background-color: #e0e0e0; opacity: 1;">
			<div class="row d-flex align-items-center">
				<div class="col-md-2">
					<p class="text-muted mb-0 small">Track Order</p>
				</div>
				<div class="col-md-10">
					<div class="progress" style="height: 6px; border-radius: 16px;">
						<div class="progress-bar" role="progressbar"
							style="width: 65%; border-radius: 16px; background-color: #a8729a;"
							aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<div class="d-flex justify-content-around mb-1">
						<p class="text-muted mt-1 mb-0 small ms-xl-5">Out for delivary</p>
						<p class="text-muted mt-1 mb-0 small ms-xl-5">Delivered</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>