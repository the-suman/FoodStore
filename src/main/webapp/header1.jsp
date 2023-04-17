<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header1</title>
<link
	href="bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand "> <img src="logo.png"
				style="border-radius: 10px" height="50" width="130" />
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
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search Items">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				&nbsp;
				<div class="d-grid gap-2 d-md-block">
					<button class="btn btn-secondary fw-bold" type="button">Login</button>
					<button class="btn btn-secondary fw-bold" type="button">Sign Up</button>
				</div>
			</div>
		</div>
	</nav>
	<script
		src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
