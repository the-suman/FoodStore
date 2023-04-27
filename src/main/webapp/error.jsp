<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>Error Page</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/133ab84eeb.js"></script>
<link href="css/styles.css" rel="stylesheet">
</head>
<body>

	<%@ include file="header.jsp"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<div class="text-center" style="min-height: 400px;">
		<!-- Show Error Message -->
		<c:if test="${not empty param.errorCode}">
			<div class="text-center my-3 ">
				<label class="text-danger"><%=request.getParameter("errorCode")%></label>
			</div>
		</c:if>

		<c:choose>
			<c:when test="${not empty param.errorMessage}">
				<div class="text-center my-3 ">
					<label class="text-danger"><%=request.getParameter("errorMessage")%></label>
				</div>
			</c:when>
			<c:otherwise>
				<div class="text-center my-3 ">
					<label class="text-danger">Something Went Wrong!!</label>
				</div>
			</c:otherwise>
		</c:choose>

	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>