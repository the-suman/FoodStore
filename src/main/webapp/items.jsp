<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Items</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link href="css/styles.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<!--  Set the current page name and validate the user role-->
	<%
	String uri = request.getRequestURI();
	String pagename = uri.substring(uri.lastIndexOf("/") + 1);
	session.setAttribute("currentpage", pagename);
	FoodUtil.validateUserPageAccess(request, Role.CUSTOMER);
	%>

	<%@ include file="header.jsp"%>
	<%@ include file="slideshow.jsp"%>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<section>
		<div class="container my-5">
			<header class="mb-4">
				<h3>New products</h3>
			</header>
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6 d-flex">
					<div class="card w-100 my-2 shadow-2-strong">
						<img src="img/burger.jpg" class="card-img-top"
							style="aspect-ratio: 1/1">
						<div class="card-body d-flex flex-column">
							<h5 class="card-title">BURGER</h5>
							<p class="card-text">Rs.250</p>
							<div
								class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
								<a href="#!" class="btn btn-primary shadow-0 me-1" style="">Add
									to cart</a> <a href="#!"
									class="btn btn-light border px-2 pt-2 icon-hover"><i
									class="fas fa-heart fa-lg text-secondary px-1"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6 d-flex">
					<div class="card w-100 my-2 shadow-2-strong">
						<img src="img/pizza.jpg" class="card-img-top"
							style="aspect-ratio: 1/1">
						<div class="card-body d-flex flex-column">
							<h5 class="card-title">CHEESE PIZZA</h5>
							<p class="card-text">Rs.300</p>
							<div
								class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
								<a href="#!" class="btn btn-primary shadow-0 me-1" style="">Add
									to cart</a> <a href="#!"
									class="btn btn-light border px-2 pt-2 icon-hover"><i
									class="fas fa-heart fa-lg text-secondary px-1"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6 d-flex">
					<div class="card w-100 my-2 shadow-2-strong">
						<img src="img/samosa.jpg" class="card-img-top"
							style="aspect-ratio: 1/1">
						<div class="card-body d-flex flex-column">
							<h5 class="card-title">INDIAN- SAMOSA</h5>
							<p class="card-text">Rs.20</p>
							<div
								class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
								<a href="#!" class="btn btn-primary shadow-0 me-1" style="">Add
									to cart</a> <a href="#!"
									class="btn btn-light border px-2 pt-2 icon-hover"><i
									class="fas fa-heart fa-lg text-secondary px-1"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6 d-flex">
					<div class="card w-100 my-2 shadow-2-strong">
						<img src="img/dosa2.jpg" class="card-img-top"
							style="aspect-ratio: 1/1">
						<div class="card-body d-flex flex-column">
							<h5 class="card-title">South Inidan DOSA</h5>
							<p class="card-text">Rs.90</p>
							<div
								class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
								<a href="#!" class="btn btn-primary shadow-0 me-1" style="">Add
									to cart</a> <a href="#!"
									class="btn btn-light border px-2 pt-2 icon-hover"><i
									class="fas fa-heart fa-lg text-secondary px-1"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="footer.jsp"%>
	<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>