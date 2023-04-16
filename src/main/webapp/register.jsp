<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
	<div class="container mt-5 align-center">
		<div class="row centered-form">
			<div class="col-xs-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class=" text-center panel-title">Registration Form</h3>
					</div>
					<div class="panel-body">
						<form role="form">
							<div class="row mb-2 px-2">
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="text" name="first_name" id="first_name"
											class="form-control input-sm" placeholder="First Name">
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="text" name="last_name" id="last_name"
											class="form-control input-sm" placeholder="Last Name">
									</div>
								</div>
							</div>
							<div class="form-group mb-2 px-2">
								<input type="email" name="email" id="email"
									class="form-control input-sm" placeholder="Email Address">
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>