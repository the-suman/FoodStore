<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
	<div class="container mt-5">
		<div class="row  offset-md-4">
			<div class="col-md-6 bg-light"
				style="border-radius: 10px; border: 2px solid black">
				<div class="text-center fw-bold">
					<h4 class="text-primary">LOGIN INTO FOODKART</h4>
				</div>
				<form>
					<!-- Email input -->
					<div class="form-outline mb-4 mt-4">
						<input type="email" id="form2Example1" class="form-control"
							placeholder="Enter Email address" />
					</div>

					<!-- Password input -->
					<div class="form-outline mb-4">
						<input type="password" id="form2Example2" class="form-control"
							placeholder="Enter Password" />

					</div>

					<!-- Usertype input -->
					<div class="form-outline mb-4 fw-bold">
						<label>Login As</label> <select name="role"><option
								value="ADMIN">ADMIN</option>
							<option value="CUSTOMER" selected="selected">CUSTOMER</option>
						</select>
					</div>

					<!-- 2 column grid layout for inline styling -->
					<div class="row mb-4">
						<div class="col d-flex justify-content-center">
							<!-- Checkbox -->
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="form2Example31" checked /> <label class="form-check-label"
									for="form2Example31"> Remember me </label>
							</div>
						</div>
						<div class="col">
							<!-- Simple link -->
							<a href="#!">Forgot password?</a>
						</div>
					</div>

					<!-- Submit button -->


					<!-- Register buttons -->
					<div class="text-center">
						<input type="submit" value="SignIn" style="width: 100%"
							class="btn btn-primary input-block-level " />
						<p>
							Not a member? <a href="#!">Register</a>
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
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>