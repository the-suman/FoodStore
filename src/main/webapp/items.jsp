<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.foodstore.model.*, com.foodstore.service.*, 
	com.foodstore.service.impl.*, com.foodstore.util.*, com.foodstore.enums.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>Food Items</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/133ab84eeb.js"></script>
<link href="css/styles.css" rel="stylesheet">
</head>
<body>
	<!--  Set the current page name and validate the user role-->

	<%
	String uri = request.getRequestURI();
	String pagename = uri.substring(uri.lastIndexOf("/") + 1);
	session.setAttribute("currentpage", pagename);
	/* FoodUtil.validateUserPageAccess(request, Role.CUSTOMER); */

	ItemService itemService = new ItemServiceImpl();
	/* Item item = itemService.getItemById("ec5007fb-ba15-4f43-add4-76edc7522122"); */
	//List<Item> items = itemService.getAllItems();
	/* String type = request.getParameter("type"); */
	List<Item> itemsOfDrinks = itemService.getItemsByType(FoodType.DRINKS.toString());
	List<Item> itemsOfDessert = itemService.getItemsByType(FoodType.DESSERT.toString());
	List<Item> itemsOfIndian = itemService.getItemsByType(FoodType.INDIAN.toString());
	List<Item> itemsOfChinese = itemService.getItemsByType(FoodType.CHINESE.toString());
	List<Item> itemsOfContinental = itemService.getItemsByType(FoodType.CONTINENTAL.toString());

	List<Item> searchItems = new ArrayList<Item>();

	String search = request.getParameter("search");
	String type = request.getParameter("type");
	String message = "All Products";
	if (search != null) {
		searchItems = itemService.searchItems(search);
		message = "Showing Results for '" + search + "'";

	} else if (type != null) {
		searchItems = itemService.getItemsByType(type);
		message = "Showing Results for '" + type + "'";
	}
	boolean check = search != null || type != null;
	request.setAttribute("check", check);
	if (searchItems.isEmpty()) {
		message = "No items found for the search '" + (search != null ? search : type) + "'";
	}
	%>

	<%@ include file="header.jsp"%>
	<%@ include file="slideshow.jsp"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:if test="${check}">
		<section>
			<div class="container my-2 ">
				<header class="mb-2 text-center fw-bold">
					<p><%=message%></p>
				</header>
				<div class="row">
					<%
					for (Item item : searchItems) {
					%>
					<%
					request.setAttribute("item", item);
					%>
					<jsp:include page="item.jsp" />
					<%
					}
					%>
				</div>
				<hr />
				<p class="text-center text-secondary fw-bold">Explore more items
					below</p>
				<hr />
			</div>
		</section>
	</c:if>

	<section>
		<div class="container my-5">
			<header class="mb-4">
				<h2>Chinese</h2>
			</header>
			<div class="row">
				<jsp:include page="item.jsp" />
				<%
				for (Item item : itemsOfChinese) {
				%>
				<%
				request.setAttribute("item", item);
				%>
				<jsp:include page="item.jsp" />
				<%
				}
				%>
			</div>
		</div>

		<div class="container my-5">
			<header class="mb-4">
				<h2>Continental</h2>
			</header>
			<div class="row">

				<%-- <jsp:include page="item.jsp" /> --%>
				<%
				for (Item item : itemsOfContinental) {
				%>
				<%
				request.setAttribute("item", item);
				%>
				<jsp:include page="item.jsp" />
				<%
				}
				%>
			</div>
		</div>

		<div class="container my-5">
			<header class="mb-4">
				<h2>Indian</h2>
			</header>
			<div class="row">

				<%-- <jsp:include page="item.jsp" /> --%>
				<%
				for (Item item : itemsOfIndian) {
				%>
				<%
				request.setAttribute("item", item);
				%>
				<jsp:include page="item.jsp" />
				<%
				}
				%>
			</div>
		</div>

		<div class="container my-5">
			<header class="mb-4">
				<h2>Desserts</h2>
			</header>
			<div class="row">

				<%-- <jsp:include page="item.jsp" /> --%>
				<%
				for (Item item : itemsOfDessert) {
				%>
				<%
				request.setAttribute("item", item);
				%>
				<jsp:include page="item.jsp" />
				<%
				}
				%>
			</div>
		</div>

		<div class="container my-5">
			<header class="mb-4">
				<h2>Drinks</h2>
			</header>
			<div class="row">

				<%-- <jsp:include page="item.jsp" /> --%>
				<%
				for (Item item : itemsOfDrinks) {
				%>
				<%
				request.setAttribute("item", item);
				%>
				<jsp:include page="item.jsp" />
				<%
				}
				%>
			</div>
		</div>

	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>