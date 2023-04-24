<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.foodstore.util.FoodUtil, com.foodstore.enums.Role"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodKart</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
	<%
	boolean isLoggedInAsCustomer = FoodUtil.isLoggedIn(request, Role.CUSTOMER);
	boolean isLoggedInAsAdmin = FoodUtil.isLoggedIn(request, Role.ADMIN);
	request.setAttribute("isLoggedInAsCustomer", isLoggedInAsCustomer);
	request.setAttribute("isLoggedInAsAdmin", isLoggedInAsAdmin);
	System.out.println(isLoggedInAsCustomer);
	%>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:choose>
		<c:when test="${isLoggedInAsCustomer}">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
				<div class="container-fluid">
					<a class="navbar-brand " href="index.jsp"> <img
						src="img/logo.png" class="border-radius: 10px" height="50"
						width="130" />
					</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item"><button class="btn btn-dark fw-bold"
									type="button" onclick="location.href='items.jsp'">Menu</button></li>
							<li class="nav-item"><button class="btn btn-dark fw-bold"
									type="button">Restaurant</button></li>
							<li class="nav-item"><button class="btn btn-dark fw-bold"
									type="button">About Us</button></li>
							<li class="nav-item"><button class="btn btn-dark fw-bold"
									onclick="location.href='cart.jsp'" type="button">
									<i class="fa fa-shopping-cart" style="font-size: 21px;"></i> <span
										class='badge badge-warning'
										style='font-size: 12px; background: #ff0000; color: #fff; padding: 0 5px; vertical-align: top; margin-left: -11px;'>
										1 </span>
								</button></li>
						</ul>
						<form class="d-flex">
							<input class="form-control me-2" type="search"
								placeholder="Search" aria-label="Search Items">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
						&nbsp;
						<div class="d-grid gap-2 d-md-block">
							<button class="btn btn-secondary fw-bold" type="button"
								onclick="location.href='profile.jsp'">Profile</button>
							<button class="btn btn-secondary fw-bold"
								onclick="location.href='logout'" type="button">Logout</button>
						</div>
					</div>
				</div>
			</nav>

		</c:when>
		<c:when test="${isLoggedInAsAdmin}">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
				<div class="container-fluid">
					<a class="navbar-brand " href="index.jsp"> <img
						src="img/logo.png" class="border-radius: 10px" height="50"
						width="130" />
					</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item"><button class="btn btn-dark fw-bold"
									type="button">Menu</button></li>
							<li class="nav-item"><button class="btn btn-dark fw-bold"
									type="button">Restaurant</button></li>
							<li class="nav-item"><button class="btn btn-dark fw-bold"
									type="button">About Us</button></li>
						</ul>
						<form class="d-flex">
							<input class="form-control me-2" type="search"
								placeholder="Search" aria-label="Search Items">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
						&nbsp;
						<div class="d-grid gap-2 d-md-block">
							<button class="btn btn-secondary fw-bold" type="button"
								onclick="location.href='profile.jsp'">Profile</button>
							<button class="btn btn-secondary fw-bold"
								onclick="location.href='logout'" type="button">Logout</button>
						</div>
					</div>
				</div>
			</nav>

		</c:when>
		<c:otherwise>
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
				<div class="container-fluid">
					<a class="navbar-brand " href="index.jsp"> <img
						src="img/logo.png" style="border-radius: 10px" height="50"
						width="130" />
					</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item"><button class="btn btn-dark fw-bold"
									type="button">About Us</button></li>
						</ul>
						<form class="d-flex">
							<input class="form-control me-2" type="search"
								placeholder="Search" aria-label="Search Items">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
						&nbsp;
						<div class="d-grid gap-2 d-md-block">
							<button class="btn btn-secondary fw-bold"
								onclick="location.href='login.jsp'" type="button">Login</button>
							<button class="btn btn-secondary fw-bold"
								onclick="location.href='register.jsp'" type="button">Sign
								Up</button>
						</div>
					</div>
				</div>
			</nav>

		</c:otherwise>
	</c:choose>

	<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>