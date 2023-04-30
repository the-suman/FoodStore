<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.foodstore.util.*, com.foodstore.enums.*, 
	com.foodstore.model.*, com.foodstore.service.impl.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>FoodKart</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/133ab84eeb.js"></script>
<link href="css/styles.css" rel="stylesheet">
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css"
	rel="stylesheet" type='text/css'>
</head>
<body>
	<%
	boolean isLoggedInAsCustomer = FoodUtil.isLoggedIn(request, Role.CUSTOMER);
	boolean isLoggedInAsAdmin = FoodUtil.isLoggedIn(request, Role.ADMIN);
	request.setAttribute("isLoggedInAsCustomer", isLoggedInAsCustomer);
	request.setAttribute("isLoggedInAsAdmin", isLoggedInAsAdmin);
	User user = FoodUtil.getCurrentUser(request);
	int cartQty = 0;
	if (user != null) {
		cartQty = new CartServiceImpl().getCartItemsByUserId(user.getUserId()).size();
	}
	request.setAttribute("cartQty", cartQty);
	%>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:choose>
		<c:when test="${isLoggedInAsCustomer}">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
				<div class="container-fluid">
					<a class="navbar-brand " href="index.jsp"> <img
						src="img/logo.png" style="border-radius: 10px" height="40"
						width="110" />
					</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav gap-2">
							<li class="nav-item"><button class="btn btn-dark fw-bold"
									type="button" onclick="location.href='items.jsp'">Menu</button></li>
							<li class="nav-item dropdown"><a
								class="btn btn-dark fw-bold dropdown-toggle" href="items.jsp"
								id="navbarDarkDropdownMenuLink" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> Recipies </a>
								<ul class="dropdown-menu dropdown-menu-dark"
									aria-labelledby="navbarDarkDropdownMenuLink">
									<li><a class="dropdown-item" href="items.jsp?type=dessert">Desserts</a></li>
									<li><a class="dropdown-item" href="items.jsp?type=drinks">Drinks</a></li>
									<li><a class="dropdown-item" href="items.jsp?type=indian">Indian</a></li>
									<li><a class="dropdown-item" href="items.jsp?type=chinese">Chinese</a></li>
									<li><a class="dropdown-item"
										href="items.jsp?type=continental">Continental</a></li>
								</ul></li>
							<li class="nav-item">
								<form class="navbar-form d-flex mt-2 mt-lg-auto" role="search"
									action="items.jsp" method="get">
									<input class="form-control me-2" type="search" name="search"
										placeholder="Search" aria-label="Search Items" required>
									<button class="btn btn-outline-success" type="submit">Search</button>
								</form>
							</li>

						</ul>
						<ul class="navbar-nav gap-2 ms-auto">
							<li class="nav-item"><button class="btn btn-dark fw-bold"
									onclick="location.href='cart.jsp'" type="button">
									<i class="fa fa-shopping-cart" style="font-size: 21px;"></i>
									<c:if test="${cartQty > 0 }">
										<span class='badge badge-warning'
											style='font-size: 12px; background: #ff0000; color: #fff; padding: 0 5px; vertical-align: top; margin-left: -11px;'>
											<%=cartQty%>
										</span>
									</c:if>
								</button></li>
							<li class="nav-item"><button class="btn btn-dark fw-bold"
									type="button" onclick="location.href='orders.jsp'"><i class="fa fa-shopping-bag fa-fw"></i> Orders</button></li>

							<li class="nav-item"><button class="btn btn-dark fw-bold"
									type="button" onclick="location.href='about.jsp'">
									<i class="fa fa-info-circle fa-fw"></i> About
								</button></li>
							<li>
								<button class="btn btn-dark fw-bold" type="button"
									onclick="location.href='profile.jsp'">
									<i class="fa fa-user fa-fw"></i> Profile
								</button>
							</li>
							<li>
								<button class="btn btn-dark fw-bold"
									onclick="location.href='logout'" type="button">
									<i class="fa fa-sign-out fa-fw"></i> Logout
								</button>
							</li>
						</ul>
					</div>
				</div>
			</nav>

		</c:when>
		<c:when test="${isLoggedInAsAdmin}">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
				<div class="container-fluid">
					<a class="navbar-brand " href="index.jsp"> <img
						src="img/logo.png" style="border-radius: 10px" height="40"
						width="110" />
					</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav gap-2">
							<li class="nav-item"><button class="btn btn-dark fw-bold"
									type="button" onclick="location.href='items.jsp'">Menu</button></li>
							<li class="nav-item dropdown"><a
								class="btn btn-dark fw-bold dropdown-toggle" href="items.jsp"
								id="navbarDarkDropdownMenuLink" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> Recipies </a>
								<ul class="dropdown-menu dropdown-menu-dark"
									aria-labelledby="navbarDarkDropdownMenuLink">
									<li><a class="dropdown-item" href="items.jsp?type=dessert">Desserts</a></li>
									<li><a class="dropdown-item" href="items.jsp?type=drinks">Drinks</a></li>
									<li><a class="dropdown-item" href="items.jsp?type=indian">Indian</a></li>
									<li><a class="dropdown-item" href="items.jsp?type=chinese">Chinese</a></li>
									<li><a class="dropdown-item"
										href="items.jsp?type=continental">Continental</a></li>
								</ul></li>
							<li class="nav-item">
								<form class="navbar-form d-flex mt-2 mt-lg-auto" role="search"
									action="items.jsp" method="get">
									<input class="form-control me-2" type="search" name="search"
										placeholder="Search" aria-label="Search Items" required>
									<button class="btn btn-outline-success" type="submit">Search</button>
								</form>
							</li>
						</ul>
						<ul class="navbar-nav gap-2 ms-auto">

							<li class="nav-item"><button class="btn btn-dark fw-bold"
									type="button" onclick="location.href='vieworders.jsp'">
									<i class="fa fa-shopping-bag fa-fw"></i> Orders
								</button></li>

							<li class="nav-item dropdown"><a
								class="btn btn-dark dropdown-toggle fw-bold" href="items.jsp"
								id="navbarDarkDropdownAdminMenuLink" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"><i
									class="fa fa-server fa-fw"></i> Inventory Actions </a>
								<ul class="dropdown-menu dropdown-menu-dark"
									aria-labelledby="navbarDarkDropdownAdminMenuLink">
									<li><a class="dropdown-item" href="listitem.jsp">List
											Food Item</a></li>
									<li><a class="dropdown-item" href="additem.jsp">Add
											Food Item</a></li>
									<li><a class="dropdown-item" href="updateitem.jsp">Update
											Food Item</a></li>
									<li><a class="dropdown-item" href="removeitem.jsp">Remove
											Food Item</a></li>
								</ul></li>
							<li>
								<button class="btn btn-dark fw-bold" type="button"
									onclick="location.href='profile.jsp'">
									<i class="fa fa-user fa-fw"></i> Profile
								</button>
							</li>
							<li>
								<button class="btn btn-dark fw-bold"
									onclick="location.href='logout'" type="button">
									<i class="fa fa-sign-out fa-fw"></i> Logout
								</button>
							</li>
						</ul>
					</div>
				</div>
			</nav>

		</c:when>
		<c:otherwise>
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
				<div class="container-fluid">
					<a class="navbar-brand " href="index.jsp"> <img
						src="img/logo.png" style="border-radius: 10px" height="40"
						width="110" />
					</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav gap-2">
							<li class="nav-item"><button class="btn btn-dark fw-bold"
									type="button" onclick="location.href='items.jsp'">Menu</button></li>
							<li class="nav-item dropdown"><a
								class="btn btn-dark fw-bold dropdown-toggle" href="items.jsp"
								id="navbarDarkDropdownMenuLink" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> Recipies </a>
								<ul class="dropdown-menu dropdown-menu-dark"
									aria-labelledby="navbarDarkDropdownMenuLink">
									<li><a class="dropdown-item" href="items.jsp?type=dessert">Desserts</a></li>
									<li><a class="dropdown-item" href="items.jsp?type=drinks">Drinks</a></li>
									<li><a class="dropdown-item" href="items.jsp?type=indian">Indian</a></li>
									<li><a class="dropdown-item" href="items.jsp?type=chinese">Chinese</a></li>
									<li><a class="dropdown-item"
										href="items.jsp?type=continental">Continental</a></li>
								</ul></li>
							<li class="nav-item">
								<form class="navbar-form d-flex mt-2 mt-lg-auto" role="search"
									action="items.jsp" method="get">
									<input class="form-control me-2" type="search" name="search"
										placeholder="Search" aria-label="Search Items" required>
									<button class="btn btn-outline-success" type="submit">Search</button>
								</form>
							</li>
						</ul>
						<ul class="navbar-nav gap-2 ms-auto">
							<li class="nav-item"><button class="btn btn-dark fw-bold"
									type="button" onclick="location.href='about.jsp'">
									<i class="fa fa-info-circle fa-fw"></i> About
								</button></li>
							<li>
								<button class="btn btn-dark fw-bold"
									onclick="location.href='login.jsp'" type="button">
									<i class="fa fa-sign-in fa-fw"></i> Login
								</button>
							</li>
							<li>
								<button class="btn btn-dark fw-bold"
									onclick="location.href='register.jsp'" type="button">
									<i class="fa fa-user-plus fa-fw"></i> SignUp
								</button>
							</li>
						</ul>
					</div>
				</div>
			</nav>

		</c:otherwise>
	</c:choose>
</body>
</html>