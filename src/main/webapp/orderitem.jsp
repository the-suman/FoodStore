<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.foodstore.model.*, com.foodstore.service.*, 
	com.foodstore.service.impl.*, com.foodstore.util.*, com.foodstore.enums.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>Food Item</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/133ab84eeb.js"></script>
<link href="css/styles.css" rel="stylesheet">
</head>
<body>
	<%
	User user = FoodUtil.getCurrentUser(request);
	
	OrderItemHistory orderItem = (OrderItemHistory) request.getAttribute("orderitemhistory");

	String description = orderItem.getDescription();

	if (description == null)
		description = "";
	description = description.substring(0, Math.min(description.length(), 50));
	if (description.length() == 50)
		description += ".. <a href='#' style='text-decoration:none; font-size:12px;'>View Details</a>";
	%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


	<div class="card mb-3">
		<div class="card-body">
			<div class="d-flex justify-content-between">
				<div class="d-flex flex-row align-items-center">
					<div>
						<img src="<%=FoodUtil.showImage(orderItem.getImage())%>"
							class="img-fluid rounded-3" alt="Shopping item"
							style="width: 65px;">
					</div>
					<div class="ms-3">
						<h5><%=orderItem.getName()%></h5>
						<p class="small mb-0"><%=description%></p>
					</div>
				</div>
				<div class="d-flex flex-row align-items-center">

					<div class="d-flex mr-2 mx-3 my-1"style="">
					
						<h5 class="fw-normal mb-0 mx-4">Qty: <%=orderItem.getQty()%></h5>
					</div>
					
					<div style="">
						<h5 class="mb-0">
							Price: $<%=orderItem.getUnitPrice()%></h5>
					</div>
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>