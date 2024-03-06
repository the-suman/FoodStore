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

	String orderId = request.getParameter("orderid");
	OrderService os = new OrderServiceImpl();
	List<OrderHistory> orders = os.getAllOrderDetailsByOrderId(orderId);
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
						<th>Amount</th>
						<th>Date</th>
						<th>Time</th>
						<th>Status</th>
					</tr>
				</thead>

				<%
				for (OrderHistory order : orders) {
				%>
				<tbody style="border: 3px solid black;">
					<tr style="background-color: #eddce8;">
						<td><%=order.getOrderId()%></td>
						<td><%=order.getPaymentId()%></td>
						<td>$<%=order.getTotalAmount()%></td>
						<td><%=order.getDate()%></td>
						<td><%=order.getTime()%></td>
						<td><%=order.getOrderStatus()%></td>
					</tr>
					<%
					for (OrderItemHistory orderItem : order.getItems()) {
						request.setAttribute("orderitemhistory", orderItem);
					%>
					<tr>
						<td colspan="6"><jsp:include page="orderitem.jsp" /></td>
					</tr>
					<%
					}
					%>
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