<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>Login Form</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link href="css/styles.css" rel="stylesheet">
</head>
<body>
	<%
	String height = request.getParameter("height");
	String parentClass = request.getParameter("class");
	if (height == null || height.isBlank()) {
		height = "300px";
	}
	if (parentClass == null || parentClass.isBlank()) {
		parentClass = "";
	}
	%>

	<section class="<%=parentClass%>">
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<div id="carouselExampleCaptions" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active" data-interval="500">
					<img src="img/biryani.jpg" class="d-block w-100" alt="Food Item"
						height="<%=height%>">
					<div class="carousel-caption d-none d-md-block">
						<h5>Chicken Briyani</h5>
						<p>Buy the spicy Briyani which is one of the best choice of
							our customer.</p>
					</div>
				</div>
				<div class="carousel-item" data-interval="500">
					<img src="img/friedChicken.jpg" class="d-block w-100"
						alt="Food Item" height="<%=height%>">
					<div class="carousel-caption d-none d-md-block">
						<h5>Fried Chicken</h5>
						<p>Take it once and you will thank us later.</p>
					</div>
				</div>
				<div class="carousel-item" data-interval="500">
					<img src="img/pizza.jpg" class="d-block w-100" alt="Food Item"
						height="<%=height%>">
					<div class="carousel-caption d-none d-md-block">
						<h5>Margerata Pizza</h5>
						<p>Pizza offers ending soon, buy at Rs 99 only.</p>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

	</section>
</body>
</html>