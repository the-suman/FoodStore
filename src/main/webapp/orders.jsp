<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, java.io.*"
	import="com.foodstore.util.*, com.foodstore.enums.*"
	import="com.foodstore.model.*, com.foodstore.service.impl.*, com.foodstore.service.*"%>
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
	<!--  Set the current page name and validate the user role-->
	<%
	String uri = request.getRequestURI();
	String pagename = uri.substring(uri.lastIndexOf("/") + 1);
	session.setAttribute("currentpage", pagename);
	FoodUtil.validateCommonPageAccess(request);
	%>

	<!--  Include the header to the page -->
	<jsp:include page="header.jsp" flush="true" />

	<%
	double totalPrice = 0;
	User user = FoodUtil.getCurrentUser(request);
	CartService cartService = new CartServiceImpl();
	String userId = user.getUserId();
	//String itemId = request.getParameter("itemId");
	List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartitems");

	int cartQty = cartItems.size();
	//cartService.getCartItemQuantity(userId, itemId);
	String orderId = request.getParameter("orderid");
	String transactionId = request.getParameter("transactionid");
	%>

	<section class="h-100 gradient-custom">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-10 col-xl-8">
					<div class="card" style="border-radius: 10px;">
						<div class="card-header px-4 py-5">
							<div class="row">

								<div class="text-center col-md-6"
									style="color: #871F78; font-size: 24px; font-weight: bold;">Order
									Placed Successfully</div>
								<h5 class="col-md-6 text-muted mb-0">
									Thanks for your Order, <span style="color: #a8729a;"><%=user.getfName()%></span>!
								</h5>
							</div>
						</div>
						<div class="card-body p-4">
							<!-- <div
								class="d-flex justify-content-between align-items-center mb-4">
								<p class="lead fw-normal mb-0" style="color: #a8729a;">Receipt</p>
								<p class="small text-muted mb-0">Receipt Voucher :
									1KAU9-84UIL</p>
							</div> -->


							<%
							for (CartItem cartItem : cartItems) {
								Item item = new ItemServiceImpl().getItemById(cartItem.getItemId());
								request.setAttribute("cartitem", cartItem);
								request.setAttribute("item", item);
								totalPrice += (item.getPrice() * cartItem.getQty());
							%>

							<jsp:include page="orderedItem.jsp" />

							<%
							}
							%>


							<div class="d-flex justify-content-between pt-2">
								<p class="fw-bold mb-0">Order Details</p>
								<p class="text-muted mb-0">
									<span class="fw-bold me-2">Total: </span> $<%=totalPrice%>
								</p>
							</div>

							<div class="d-flex justify-content-between pt-2">
								<p class="text-muted mb-0">
									<span class="fw-bold me-2">OrderId:</span>
									<%=orderId%></p>
								<p class="text-muted mb-0">
									<span class="fw-bold me-2">Discount: </span> $0.00
								</p>
							</div>

							<div class="d-flex justify-content-between">
								<p class="text-muted mb-0">
									<span class="fw-bold me-2">Order Date:</span>
									<%=new Date(System.currentTimeMillis())%></p>
								<p class="text-muted mb-0">
									<span class="fw-bold me-2">GST: </span> 0
								</p>
							</div>

							<div class="d-flex justify-content-between mb-5">
								<p class="text-muted mb-0">
									<span class="fw-bold me-2">Transaction Id:</span>
									<%=transactionId%></p>
								<p class="text-muted mb-0">
									<span class="fw-bold me-2">Delivery Charges: </span> Free
								</p>
							</div>
						</div>
						<div class="card-footer border-0 px-4 py-5"
							style="background-color: #a8729a; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
							<h5
								class="d-flex align-items-center justify-content-end text-white text-uppercase mb-0">
								Total paid: <span class="h2 mb-0 ms-2">$<%=totalPrice%></span>
							</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--  Include the footer to the page-->
	<%@ include file="footer.jsp"%>

</body>
</html>