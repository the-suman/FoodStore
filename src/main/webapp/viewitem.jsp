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
	String uri = request.getRequestURI();
	String pagename = uri.substring(uri.lastIndexOf("/") + 1);
	session.setAttribute("currentpage", pagename);
	FoodUtil.validateCommonPageAccess(request);
	
	String itemId= request.getParameter("id");
	Item item = new ItemServiceImpl().getProductDetails(itemId);
	if(item == null){
		return;
	}
	%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<jsp:include page="header.jsp" />
	<%
	String message = request.getParameter("message");
	%>
	<div class="container">
		<div class="row justify-content-center my-2 mx-2 p-1">
			<form action="./updateitem" method="post"
				class="col-md-6 "
				style="border: 2px solid black; border-radius: 10px; background-color: #FFE5CC; padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<div class="form-group">
						<img src="<%=FoodUtil.showImage(item.getImage())%>"
							alt="Product Image" height="100px" />
						<h2 style="color: green;">Product Details</h2>
					</div>

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
				<div class="row">
					<input type="hidden" readonly name="itemid" class="form-control"
						value="<%=item.getItemId()%>" id="last_name" readonly>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Product Name</label> <input type="text"
							placeholder="Enter Product Name" name="name" class="form-control"
							value="<%=item.getName()%>" id="last_name" readonly>
					</div>
					<div class="col-md-6 form-group">
						<%
						String itemtype = item.getType().toString();
						%>
						<label for="last_name">Item Type </label> 
						<input type="text" name="itemid" class="form-control"
						value="<%=itemtype %>" id="last_name" readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="last_name">Product Description</label>
					<textarea name="description" class="form-control text-align-left"
						id="last_name" readonly><%=item.getDescription()%></textarea>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Unit Price</label> <input type="number"
							value="<%=item.getPrice()%>"
							placeholder="Enter Unit Price" name="price" class="form-control"
							id="last_name" readonly>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Stock Quantity</label> <input type="number"
							value="<%=item.getQty()%>"
							placeholder="Enter Stock Quantity" class="form-control"
							id="last_name" name="qty" readonly>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Store Id</label> <input type="text"
							value="<%=item.getStoreId()%>"
							placeholder="Enter Store Id" class="form-control"
							id="last_name" name="storeid" readonly>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Vegetarian Type</label> <input type="number"
							value="<%=item.getVegeterian() %>"
							placeholder="Enter Vegeterian Type" class="form-control"
							id="last_name" name="vegeterian" readonly>
					</div>
				</div>
				
			</form>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>