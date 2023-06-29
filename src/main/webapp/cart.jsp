<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.foodstore.util.*, com.foodstore.enums.*"
	import="com.foodstore.model.*"
	import="com.foodstore.service.*, com.foodstore.service.impl.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>Cart Items</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/133ab84eeb.js"></script>
<link href="css/styles.css" rel="stylesheet">
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
	List<CartItem> cartItems = cartService.getCartItemsByUserId(userId);
	session.setAttribute("cartitems", cartItems);
	int cartQty = cartItems.size();
	//cartService.getCartItemQuantity(userId, itemId);
	%>

	<section class="h-100 h-custom" style="background-color: #eee;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col">
					<div class="card">
						<div class="card-body p-4">

							<div class="row">

								<%
								if (cartItems == null || cartItems.size() == 0) {
								%>
								<div class="col-lg-12">
									<h5 class="mb-3">
										<a href="items.jsp" class="text-body"><i
											class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a>
									</h5>
									<hr>
								</div>
								<div class="card mb-3">
									<div class="card-body">

										<div class="d-flex justify-content-between">
											<div class="d-flex flex-row align-items-center">
												<div>
													<img src="img/noimage.jpg" class="img-fluid rounded-3"
														alt="Shopping item" style="width: 65px;">
												</div>
												<div class="ms-3">
													<h5>No Items in the cart</h5>
													<p class="small mb-0">Please add some item to continue.</p>
												</div>
											</div>

										</div>
									</div>
								</div>
								<%
								} else {
								%>
								<div class="col-lg-7">
									<h5 class="mb-3">
										<a href="items.jsp" class="text-body"><i
											class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a>
									</h5>
									<hr>

									<div
										class="d-flex justify-content-between align-items-center mb-4">
										<div>
											<p class="mb-1">Shopping cart</p>
											<p class="mb-0">
												You have
												<%=cartQty%>
												items in your cart
											</p>
										</div>
										<div>
											<p class="mb-0">
												<span class="text-muted">Sort by:</span> <a href="#!"
													class="text-body">price <i
													class="fas fa-angle-down mt-1"></i></a>
											</p>
										</div>
									</div>
									<%
									for (CartItem cartItem : cartItems) {
										Item item = new ItemServiceImpl().getItemById(cartItem.getItemId());
										request.setAttribute("cartitem", cartItem);
										request.setAttribute("item", item);
										totalPrice += (item.getPrice()*cartItem.getQty());
									%>

									<jsp:include page="cartitem.jsp" />

									<%
									}
									%>

								</div>




								<div class="col-lg-5">
									<div class="card bg-primary text-white rounded-3">
										<div class="card-body">
											<div
												class="d-flex justify-content-between align-items-center mb-4">
												<h5 class="mb-0">Card details</h5>
												<img src="<%=FoodUtil.showImage(user.getImage())%>"
													class="img-fluid rounded-3" style="width: 45px;"
													alt="Avatar">
											</div>

											<p class="small mb-2">Card type</p>
											<a href="#!" type="submit" class="text-white"><i
												class="fab fa-cc-mastercard fa-2x me-2"></i></a> <a href="#!"
												type="submit" class="text-white"><i
												class="fab fa-cc-visa fa-2x me-2"></i></a> <a href="#!"
												type="submit" class="text-white"><i
												class="fab fa-cc-amex fa-2x me-2"></i></a> <a href="#!"
												type="submit" class="text-white"><i
												class="fab fa-cc-paypal fa-2x"></i></a>

											<form class="mt-4" method="post" action="placeorder">
												<div class="form-outline form-white mb-4">
													<input type="text" id="typeName"
														class="form-control form-control-lg" name="CardHolderName" size="17"
														placeholder="Cardholder's Name" /> <label
														class="form-label" for="typeName">Cardholder's
														Name</label>
												</div>

												<div class="form-outline form-white mb-4">
													<input type="text" id="typeText"
														class="form-control form-control-lg" name="CardNumber" size="17"
														placeholder="1234 5678 9012 3457" minlength="19"
														maxlength="19" /> <label class="form-label"
														for="typeText">Card Number</label>
												</div>

												<div class="row mb-4">
													<div class="col-md-6">
														<div class="form-outline form-white">
															<input type="text" id="typeExp"
																class="form-control form-control-lg" name="DateOfExp"
																placeholder="MM/YYYY" size="7" id="exp" minlength="7"
																maxlength="7" /> <label class="form-label"
																for="typeExp">Expiration</label>
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-outline form-white">
															<input type="password" id="typeText"
																class="form-control form-control-lg" name="cvvNumber"
																placeholder="&#9679;&#9679;&#9679;" size="1"
																minlength="3" maxlength="3" /> <label
																class="form-label" for="typeText">Cvv</label>
														</div>
													</div>
												</div>



												<hr class="my-4">
												<input type="hidden" name="amount" value="<%=totalPrice %>">
												<div class="d-flex justify-content-between">
													<p class="mb-2">Subtotal</p>
													<p class="mb-2">
														$<%=totalPrice%></p>
												</div>

												<div class="d-flex justify-content-between">
													<p class="mb-2">Shipping</p>
													<p class="mb-2">
														$<%=0.00%></p>
												</div>

												<div class="d-flex justify-content-between mb-4">
													<p class="mb-2">Total(Incl. taxes)</p>
													<p class="mb-2">
														$<%=totalPrice%></p>
												</div>
												
												<button type="submit" class="btn btn-info btn-block btn-lg">
													<div class="d-flex justify-content-between">
														<span>$<%=totalPrice%></span> <span> &nbsp; Checkout <i
															class="fas fa-long-arrow-alt-right ms-2"></i></span>
													</div>
												</button>
											</form>
										</div>
									</div>
								</div>
								<%
								}
								%>
							</div>
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