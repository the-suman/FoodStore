<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.foodstore.util.*, com.foodstore.service.*, com.foodstore.service.impl.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>FoodKart</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link href="css/styles.css" rel="stylesheet">
<style>
body {
	background-color: #525252;
}
</style>
</head>

<body>
	<jsp:include page="header.jsp" flush="true" />

	<div class="container">

		<div
			style="font-family: Sans-serif; background-color: rgb(248, 249, 250); padding: 18px; color: black">
			<br>
			<h2 style="font-family: Sans-serif; color: black; text-align:center;">About Us !</h2>
			<h2 style="font-family: Sans-serif; text-align: center;">
				Welcome To <span id="W_Name1">FoodKart</span>
			</h2>
			<p>
				<span id="W_Name2">FoodKart</span> is a Professional <span
					id="W_Type1">Online Food Ordering Platform</span> Platform. Here we
				will only provide you with interesting content that you will enjoy
				very much. We are committed to providing you the best of <span
					id="W_Type2">Online Food Ordering Platform</span>, with a focus on
				reliability and <span id="W_Spec">Orders food online, many
					varieties of foods available, Order oriental and continental foods
					at cheapest rate, spice foods available, order from different
					restaurants in your location</span>. we strive to turn our passion for <span
					id="W_Type3">Online Food Ordering Platform</span> into a thriving
				website. We hope you enjoy our <span id="W_Type4">Online Food
					Ordering Platform</span> as much as we enjoy giving them to you.
			</p>
			<p>I will keep on posting such valuable anf knowledgeable
				information on my Website for all of you. Your love and support
				matters a lot.</p>
			<p style="font-weight: bold; text-align: center;">
				Thank you For Visiting Our Site<br>
				<br> <span
					style="color: blue; font-size: 16px; font-weight: bold; text-align: center;">Have
					a great day !</span>
			</p>
		</div>
		<br>
		<br>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>