<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link href="css/styles.css" rel="stylesheet">
</head>
<style>
body {
	background-color: #525252;
}

.centered-form {
	margin-top: 60px;
}

.centered-form .panel {
	background: rgba(255, 255, 255, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
}
</style>
<body>
	<%@ include file="header.jsp"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<div class="container mt-5 align-center">
		<div class="row centered-form">
			<div class="col-xs-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class=" text-center panel-title">Registration Form</h3>
					</div>
					<!-- Show error Message -->
					<c:if test="${not empty param.errorMessage}">
						<div class="text-center my-3 ">
							<label class="text-danger"><%=request.getParameter("errorMessage")%></label>
						</div>
					</c:if>
					<!-- <div>
						<input type="checkbox" checked data-toggle="toggle"
							data-on="Ready" data-off="Not Ready" data-onstyle="success"
							data-offstyle="danger">
					</div> -->
					<div class="panel-body">
						<form role="form" action="register" method="post">
							<div class="row mb-2 px-2">
								<!-- User type input -->
								<div class="btn-group btn-group-toggle mx-2 "
									data-toggle="buttons">
									<label class="btn btn-success active"> <input
										type="radio" name="usertype" value="CUSTOMER"
										autocomplete="off" checked> Register As Customer
									</label> <label class="btn btn-info"> <input type="radio"
										name="usertype" value="ADMIN" autocomplete="off">Register
										As Admin
									</label>
								</div>
							</div>
							<div class="row mb-2 px-2">

								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="text" name="fname" id="first_name"
											class="form-control input-sm" placeholder="First Name">
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="text" name="lname" id="last_name"
											class="form-control input-sm" placeholder="Last Name">
									</div>
								</div>
							</div>
							<div class="form-group mb-2 px-2">
								<input type="email" name="email" id="email"
									class="form-control input-sm" placeholder="Email Address">
							</div>

							<div class="form-group mb-2 px-2">
								<input type="text" name="mob" id="mob"
									class="form-control input-sm" placeholder="Mobile Number">
							</div>

							<div class="row mb-2 px-2">
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="password" name="password" id="password"
											class="form-control input-sm" placeholder="Password">
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="password" name="password_confirmation"
											id="password_confirmation" class="form-control input-sm"
											placeholder="Confirm Password">
									</div>
								</div>
							</div>
							<div class="row mb-2 px-2 ">
								<div
									class="col-xs-6 col-sm-6 col-md-6 offset-xs-5 offset-sm-5 offset-md-5">
									<input type="submit" value="Register Me"
										class="btn btn-info btn-block mb-2 px-2 text-centered ">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>