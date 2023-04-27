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
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link href="css/styles.css" rel="stylesheet">
</head>
<body>
	<%
	User user = FoodUtil.getCurrentUser(request);
	Item item = (Item) request.getAttribute("item");
	if (item == null)
		item = new ItemServiceImpl().getItemById("ec5007fb-ba15-4f43-add4-76edc7522121");
	int cartQty = new CartServiceImpl().getCartItemQuantity(user.getUserId(), item.getItemId());
	request.setAttribute("cartQty", cartQty);
	String description = item.getDescription();
	if (description == null)
		description = "";
	description = description.substring(0, Math.min(description.length(), 50));
	if (description.length() == 50)
		description += ".. <a href='#' style='text-decoration:none; font-size:12px;'>View Details</a>";
	%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


	<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 d-flex">
		<div class="card w-100 my-2 shadow-2-strong">
			<img src="<%=FoodUtil.showImage(item.getImage())%>"
				class="card-img-top" style="aspect-ratio: 1/1" height="180px">
			<div class="card-body d-flex flex-column">
				<div class="d-flex">
					<h5 class="card-title me-auto"><%=item.getName()%>
					</h5>
					<a href="wishlist.jsp?action=add&id=<%=item.getItemId()%>"
						class="btn btn-light border px-1 pt-1 icon-hover"> <i
						class="fas fa-heart fa-lg text-secondary px-1"></i>
					</a>
				</div>

				<p class="card-text">
					<%=description%></p>
				<div class="d-flex">
					<p class="card-text me-auto">
						&#8377;
						<%=item.getPrice()%></p>
					<div class="flex-row">
						<c:if test="${cartQty > 0 }">
							<a href="cartupdate?action=minus&id=<%=item.getItemId()%>"
								type="button" class="btn btn-danger py-0 px-1"> <span
								class="fa fa-minus"></span>
							</a>
							<span class="fw-bold">${cartQty}</span>
							<a href="cartupdate?action=plus&id=<%=item.getItemId()%>"
								type="button" class="btn btn-info px-1 py-0"> <span
								class="fa fa-plus"></span>
							</a>
						</c:if>
					</div>

				</div>
				<div class="card-footer d-flex ps-1 pe-1">
					<c:choose>
						<c:when test="${sessionScope.ROLE == 'ADMIN'}">
							<a href="updateitem.jsp?id=<%=item.getItemId()%>"
								class="btn btn-primary shadow-0  me-auto" style="">Update</a>
							<a href="listorders.jsp?id=<%=item.getItemId()%>"
								class="btn btn-success shadow-0" style="">View Orders</a>
						</c:when>
						<c:when test="${cartQty > 0}">
							<a href="cartupdate?action=remove&id=<%=item.getItemId()%>"
								class="btn btn-danger shadow-0  me-auto" style="">Remove </a>
							<a href="cart.jsp" class="btn btn-success shadow-0" style="">
								Checkout Now</a>
						</c:when>
						<c:otherwise>
							<a href="cartupdate?action=add&id=<%=item.getItemId()%>"
								class="btn btn-primary shadow-0  me-auto" style="">Add to
								cart</a>
							<a href="cartupdate?action=buy&id=<%=item.getItemId()%>"
								class="btn btn-success shadow-0" style="">Buy Now</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</body>
</html>