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
	CartItem cartItem = (CartItem) request.getAttribute("cartitem");

	Item item = (Item) request.getAttribute("item");
	ItemService itemService = new ItemServiceImpl();
	itemService.updateItem(item);
	String description = item.getDescription();

	%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<jsp:include page="header.jsp" />
	<%
	String message = request.getParameter("message");
	%>
	<div class="container">
		<div class="row"
			style="margin-top: 5px; margin-left: 2px; margin-right: 2px;">
			<form action="./UpdateProductSrv" method="post"
				class="col-md-6 col-md-offset-3"
				style="border: 2px solid black; border-radius: 10px; background-color: #FFE5CC; padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<div class="form-group">
						<img src="<%=FoodUtil.showImage(item.getImage())%>"
							alt="Product Image" height="100px" />
						<h2 style="color: green;">Product Update Form</h2>
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
					<input type="hidden" name="pid" class="form-control"
						value="<%=item.getItemId()%>" id="last_name" required>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Product Name</label> <input type="text"
							placeholder="Enter Product Name" name="name" class="form-control"
							value="<%=item.getName()%>" id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<%
						String itemtype = item.getType().toString();
						%>
						<label for="producttype">Item Type</label> <select name="type"
							id="producttype" class="form-control" required>
							<option value="DRINKS"
								<%="DRINKS".equalsIgnoreCase(itemtype) ? "selected" : ""%>>MOBILE</option>
							<option value="DESSERT"
								<%="DESSERT".equalsIgnoreCase(itemtype) ? "selected" : ""%>>TV</option>
							<option value="INDIAN"
								<%="INDIAN".equalsIgnoreCase(itemtype) ? "selected" : ""%>>CAMERA</option>
							<option value="CHINESE"
								<%="CHINESE".equalsIgnoreCase(itemtype) ? "selected" : ""%>>LAPTOP</option>
							<option value="CONTINENTAL"
								<%="CONTINENTAL".equalsIgnoreCase(itemtype) ? "selected" : ""%>>TABLET</option>
							<%-- <option value="speaker"
								<%="speaker".equalsIgnoreCase(itemtype) ? "selected" : ""%>>SPEAKER</option> --%>
							<option value="other"
								<%="other".equalsIgnoreCase(itemtype) ? "selected" : ""%>>Some
								Other Appliances</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="last_name">Product Description</label>
					<textarea name="info" class="form-control text-align-left"
						id="last_name" required><%=item.getDescription()%></textarea>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Unit Price</label> <input type="number"
							value="<%=item.getPrice()%>"
							placeholder="Enter Unit Price" name="price" class="form-control"
							id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Stock Quantity</label> <input type="number"
							value="<%=item.getQty()%>"
							placeholder="Enter Stock Quantity" class="form-control"
							id="last_name" name="quantity" required>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-4" style="margin-bottom: 2px;">
						<button formaction="adminViewProduct.jsp" class="btn btn-danger">Cancel</button>
					</div>
					<div class="col-md-4">
						<button type="submit" class="btn btn-success">Update
							Product</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>