<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, java.io.*"
	import="com.foodstore.util.*, com.foodstore.enums.*"
	import="com.foodstore.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>My Profile</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link href="css/styles.css" rel="stylesheet">
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

						<%-- <img src="ShowImage"
							class="rounded-circle img-fluid"
							<%session.setAttribute("image", user.getImage());%> 
							style="width: 150px;"> --%>
						<%-- <img src="<%=FoodUtil.showImage(user.getImage())%>"
							class="rounded-circle img-fluid"
							style="width: 150px; height: 160px;"> --%>

						<div class="d-flex justify-content-center my-1">
							<div
								class="container-profilepic card rounded-circle overflow-hidden">
								<div class="photo-preview card-img w-100 h-100">
									<img src="<%=FoodUtil.showImage(user.getImage())%>"
										class="rounded-circle img-fluid"
										style="width: 150px; height: 160px;">
								</div>
								<div
									class="middle-profilepic text-center card-img-overlay d-none flex-column justify-content-center">
									<div class="text-profilepic text-success">
										<label class="form-label m-0 p-0" for="customFile2"> <i
											class="fas fa-camera fa-2x"></i><br /> <span
											class="text-profilepic">Change it</span>

										</label>
										<form action="uploadProfilePhoto" method="post"
											enctype="multipart/form-data">
											<input type="hidden" name="userid"
												value="<%=user.getUserId()%>" /> <input type="file"
												name="image" class="form-control d-none" id="customFile2"
												onchange="form.submit()" />
										</form>

									</div>
								</div>
							</div>
						</div>
						<h5 class="my-3">
							Hello
							<%=user.getfName()%>, welcome!!
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
</body>
</html>