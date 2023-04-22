<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
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
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<div id="carouselExampleCaptions" class="carousel slide"
		data-mdb-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-mdb-target="#carouselExampleCaptions"
				data-mdb-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-mdb-target="#carouselExampleCaptions"
				data-mdb-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-mdb-target="#carouselExampleCaptions"
				data-mdb-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/momos.jpg"
					class="d-block w-100" alt="Wild Landscape" />
				<div class="carousel-caption d-none d-md-block">
					<h5>First slide label</h5>
					<p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="img/eggRoll.jpg"
					class="d-block w-100" alt="Camera" />
				<div class="carousel-caption d-none d-md-block">
					<h5>Second slide label</h5>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="img/friedChicken.jpg"
					class="d-block w-100" alt="Exotic Fruits" />
				<div class="carousel-caption d-none d-md-block">
					<h5>Third slide label</h5>
					<p>Praesent commodo cursus magna, vel scelerisque nisl
						consectetur.</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-mdb-target="#carouselExampleCaptions" data-mdb-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-mdb-target="#carouselExampleCaptions" data-mdb-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>


	<!-- <section>
		<div class="row">
			<div class="style='width:100% height:100px'">
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
						<div class="carousel-item active height:32rem">
							<img src="img/BG.jpg" class="d-block w-100">
							<div class="carousel-caption d-none d-md-block">
								<h5>First slide label</h5>
								<p>Some representative placeholder content for the first
									slide.</p>
							</div>
						</div>
						<div class="carousel-item height:32rem">
							<img src="img/momos.jpg" class="d-block w-100">
							<div class="carousel-caption d-none d-md-block">
								<h5>Second slide label</h5>
								<p>Some representative placeholder content for the second
									slide.</p>
							</div>
						</div>
						<div class="carousel-item height:32rem">
							<img src="img/chawmin.jpg" class="d-block w-100">
							<div class="carousel-caption d-none d-md-block">
								<h5>Third slide label</h5>
								<p>Some representative placeholder content for the third
									slide.</p>
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
			</div>
		</div>
	</section> -->
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