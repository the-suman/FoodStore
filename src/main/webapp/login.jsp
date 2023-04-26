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
<style>
/* body {
	background-image: url('cake.jpg');
	background-size: cover;
} */
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<div class="container mt-5">
		<div class="row  offset-md-4">
			<div class="shadow-lg col-md-6 bg-light rounded-3">
				<!-- style="border-radius: 10px; border: 2px solid black" -->
				<div class="text-center fw-bold text-light my-3">
					<span
						class="bordered rounded shadow-sm py-1 d-inline px-3 bg-secondary">LOGIN
						TO FOODKART</span>
				</div>
				<!-- Show Success Message -->
				<c:if test="${not empty param.successMessage}">
					<div class="text-center my-3 ">
						<label class="text-success"><%=request.getParameter("successMessage")%></label>
					</div>
				</c:if>
				<form action="login" method="post">
					<!-- Email input -->
					<div class="form-outline my-3">
						<input type="text" id="form2Example1" class="form-control"
							name="username" placeholder="Enter Email address" />
					</div>

					<!-- Password input -->
					<div class="form-outline my-3">
						<input type="password" id="form2Example2" class="form-control"
							name="password" placeholder="Enter Password" onchange="" />

					</div>

					<!-- User type input -->
					<div class="btn-group btn-group-toggle mx-2 " data-toggle="buttons">
						<label class="btn btn-success active"> <input type="radio"
							name="usertype" value="CUSTOMER" autocomplete="off" checked>
							Login As Customer
						</label> <label class="btn btn-info"> <input type="radio"
							name="usertype" value="ADMIN" autocomplete="off">Login As
							Admin
						</label>
					</div>

					<!-- 2 column grid layout for inline styling -->
					<div class="row my-3">
						<div class="col d-flex justify-content-center">
							<!-- Checkbox -->
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									name="rememberme" id="form2Example31" checked /> <label
									class="form-check-label" for="form2Example31"> Remember
									me </label>
							</div>
						</div>
						<div class="col">
							<!-- Simple link -->
							<a href="#!">Forgot password?</a>
						</div>
					</div>

					<!-- Register buttons -->
					<div class="text-center">
						<!-- Submit button -->
						<input type="submit" value="SignIn" style="width: 100%"
							class="btn btn-primary input-block-level " />
						<!-- Show Error Message -->
						<c:if test="${not empty param.errorMessage}">
							<div class="text-center my-3 ">
								<label class="text-danger"><%=request.getParameter("errorMessage")%></label>
							</div>
						</c:if>
						<p>
							Not a member? <a href="register.jsp">Register</a>
						</p>
						<p>or sign up with:</p>
						<button type="button" class="btn btn-link btn-floating mx-1">
							<i class="fab fa-facebook-f"></i>
						</button>

						<button type="button" class="btn btn-link btn-floating mx-1">
							<i class="fab fa-google"></i>
						</button>

						<button type="button" class="btn btn-link btn-floating mx-1">
							<i class="fab fa-twitter"></i>
						</button>

						<button type="button" class="btn btn-link btn-floating mx-1">
							<i class="fab fa-github"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>

</body>
</html>