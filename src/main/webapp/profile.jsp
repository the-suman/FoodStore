<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.foodstore.util.*, com.foodstore.enums.*"
	import="com.foodstore.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
	User user = FoodUtil.getCurrentUser(request);
	%>

	<div class="container-fluid bg-secondary">
		<div class="row">
			<div class="col">
				<nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
					<ol class="breadcrumb mb-0">
						<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
						<li class="breadcrumb-item"><a href="profile.jsp">User
								Profile</a></li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-4">
				<div class="card mb-4">
					<div class="card-body text-center">
						<img src="img/profile.jpg" class="rounded-circle img-fluid"
							style="width: 150px;">
						<h5 class="my-3">
							Hello
							<%=user.getfName()%>
							here!!
						</h5>
						<!-- <p class="text-muted mb-1">Full Stack Developer</p>
						<p class="text-muted mb-4">Bay Area, San Francisco, CA</p> -->
					</div>
				</div>
				<div class="card mb-4 mb-lg-0">
					<div class="card-body p-0">
						<ul class="list-group list-group-flush rounded-3">

							<li
								class="list-group-item d-flex justify-content-between align-items-center p-3">
								<h1>My Profile</h1>
							</li>
							<!-- <li
								class="list-group-item d-flex justify-content-between align-items-center p-3">
								<i class="fab fa-github fa-lg" style="color: #333333;"></i>
								<p class="mb-0">mdbootstrap</p>
							</li> -->
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-8">
				<div class="card mb-4">
					<div class="card-body">
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Full Name</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0"><%=user.getfName()%>
									<%=user.getlName()%></p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Email</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0"><%=user.getEmail()%>
								</p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Phone</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0"><%=user.getMob()%>
								</p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Address ID</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0"><%=user.getAddressId()%>
								</p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">User ID</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0"><%=user.getUserId()%>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="card mb-4 mb-md-0">
							<div class="card-body">
								<p class="mb-4">
									<span class="text-primary font-italic me-1">Order Status</span>

								</p>
								<p class="mb-1" style="font-size: .77rem;">Web Design</p>
								<div class="progress rounded" style="height: 5px;">
									<div class="progress-bar" role="progressbar" style="width: 80%"
										aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<p class="mt-4 mb-1" style="font-size: .77rem;">Website
									Markup</p>
								<div class="progress rounded" style="height: 5px;">
									<div class="progress-bar" role="progressbar" style="width: 72%"
										aria-valuenow="72" aria-valuemin="0" aria-valuemax="100">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card mb-4 mb-md-0">
							<div class="card-body">
								<p class="mb-4">
									<span class="text-primary font-italic me-1">assigment</span>
									Transaction Status
								</p>
								<p class="mb-1" style="font-size: .77rem;">Web Design</p>
								<div class="progress rounded" style="height: 5px;">
									<div class="progress-bar" role="progressbar" style="width: 80%"
										aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">
									</div>
								</div>
								<p class="mt-4 mb-1" style="font-size: .77rem;">Website
									Markup</p>
								<div class="progress rounded" style="height: 5px;">
									<div class="progress-bar" role="progressbar" style="width: 72%"
										aria-valuenow="72" aria-valuemin="0" aria-valuemax="100">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--  Include the footer to the page-->
	<%@ include file="footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>