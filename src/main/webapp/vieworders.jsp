<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, java.io.*"
	import="com.foodstore.util.*, com.foodstore.enums.*"
	import="com.foodstore.model.*, com.foodstore.service.* ,com.foodstore.service.impl.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>My Profile</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/133ab84eeb.js"></script>
<link href="css/styles.css" rel="stylesheet">
</head>
<body>
	<%
	String uri = request.getRequestURI();
	String pagename = uri.substring(uri.lastIndexOf("/") + 1);
	session.setAttribute("currentpage", pagename);
	FoodUtil.validateCommonPageAccess(request);

	
	OrderService os = new OrderServiceImpl();
	%>
	<!--  Include the header to the page -->
	<jsp:include page="header.jsp" flush="true" />

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<div class="text-center"
		style="color: green; font-size: 24px; font-weight: bold;">Order
		Details</div>
	<div class="container">
		<div class="table-responsive ">
			<table class="table table-hover table-sm">
				<thead class="table; text-white" style="background-color: #67034e; border: 3px solid black;">
					<tr>
						<th>OrderId</th>
						<th>TransactionId</th>
						<th>User Email Id</th>
						<th>Action</th>
						<th>Status</th>
						
					</tr>
				</thead>

				<%
					OrderServiceImpl orderdao = new OrderServiceImpl();
					List<OrderBean> orders = new ArrayList<OrderBean>();
					orders = orderdao.getAllOrders();
					int count=0;
					for(OrderBean order: orders){
						String transId = order.getTransactionId();
						String orderId = order.getOrderId();
						String userId = order.getUserId();
						Double totalAmount = order.getAmount();
						String orderStatus = order.getOrderStatus();
					
					%>
				<tbody>
					<tr>
						<th><a href="vieworderdetail.jsp?orderid=<%=orderId %>"><%=orderId %></a></th>
						<th><%=transId %></th>
						<th><%=userId %></th>
						<th><%=totalAmount %></th>
						<th><%=orderStatus %></th>
						
					</tr>
				</tbody>
				
				<%
				} 
				%>
				
			</table>
		</div>
	</div>

	<!--  Include the footer to the page-->
	<%@ include file="footer.jsp"%>
</body>
</html>