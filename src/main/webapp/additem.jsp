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
	%>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<jsp:include page="header.jsp" />
	<%
	String message = request.getParameter("message");
	%>
	<div class="container">
		<div class="row justify-content-center my-2 mx-2 p-1">
			<form action="./AddItemServlet" method="post" enctype="multipart/form-data" class="col-md-6 "
				style="border: 2px solid black; border-radius: 10px; background-color: #FFE5CC; padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<h2 style="color: green;">Product Addition Form</h2>

					<%
					if (message != null) {
					%>
					<p style="color: blue;">
						<%=message%>
					</p>
					<%
					}
					%>
				</div>
				<div></div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Item Name</label> <input type="text"
							placeholder="Enter Product Name" name="name" class="form-control"
							id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="producttype">Item Type</label> <select name="type"
							id="producttype" class="form-control" required>
							<option value="DRINKS">DRINKS</option>
							<option value="DESSERT">DESSERT</option>
							<option value="INDIAN">INDIAN</option>
							<option value="CHINESE">CHINESE</option>
							<option value="CONTINENTAL">CONTINENTAL</option>
							<option value="other">Some Other Appliances</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="last_name">Item Description</label>
					<textarea name="description" class="form-control" id="last_name" required></textarea>
				</div>
				<div class="col-md-6 form-group">
						<label for="last_name">Vegeterian Type</label> <input type="number"
							placeholder="Enter Vegeterian Type" name="vegeterian" class="form-control"
							id="last_name" required>
					</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Unit Price</label> <input type="number"
							placeholder="Enter Unit Price" name="price" class="form-control"
							id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Stock Quantity</label> <input type="number"
							placeholder="Enter Stock Quantity" name="qty"
							class="form-control" id="last_name" required>
					</div>
				</div>
				<div>
					<div class="col-md-12 form-group my-2">
						<label for="last_name">Item Image</label> <input type="file"
							placeholder="Select Image" name="image" class="form-control"
							id="last_name" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 text-center" style="margin-bottom: 2px;">
						<button type="reset" class="btn btn-danger">Reset</button>
					</div>
					<div class="col-md-6 text-center">
						<button type="submit" class="btn btn-success">Add Item</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>