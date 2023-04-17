<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta name=”viewport” content=”width=device-width, initial-scale=1.0">-->
<meta charset="UTF-8">
<title>Header2</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
		<div class="container-fluid">
			<a class="navbar-brand "> <img src="logo.png"
				class="border-radius: 10px" height="50" width="130" />
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
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search Items">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				&nbsp;
				<div class="d-grid gap-2 d-md-block">
					<button class="btn btn-secondary fw-bold" type="button">Profile</button>
					<button class="btn btn-secondary fw-bold" type="button">Logout</button>
				</div>
			</div>
		</div>
	</nav>
	<script src="bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
