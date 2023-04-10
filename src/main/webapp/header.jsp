<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-primary">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav fw-bold">
					
					<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="x" %>
					<x:choose>
						<x:when test="${!isLoggedIn}">
							<li class="nav-item mr-2"><a class="nav-link" aria-current="page" href="index.jsp">Home</a>
							</li>
							<li class="nav-item mr-4 pr-4 pl-4"><a class="nav-link" href="#">Sign Up</a>
							</li>
							<li class="nav-item mr-4 pr-4 pl-4"><a class="nav-link" href="login.jsp">Login</a>
							</li>
						</x:when>
						<x:otherwise>
							<li class="nav-item mr-2"><a class="nav-link" aria-current="page" href="index.jsp">Home</a>
							</li>
							<li class="nav-item  pr-4 pl-4"><a class="nav-link" href="items">Menu</a>
							</li>
							<li class="nav-item mr-4 pr-4 pl-4"><a class="nav-link" href="logOut.jsp">LogOut</a>
							</li>
							<li class="nav-item mr-4 pr-4 pl-4"><a class="nav-link" href="errorThrower.jsp">Error</a>
							</li>
						</x:otherwise>
					</x:choose>
					
					
				</ul>
			</div>
	</nav>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" ></script>
</html>