<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.foodstore.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>
<%@ include file="header.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="x" %>

<%
	out.println(DBUtil.getConnection());
	
%>

<%-- <x:if test="${isLoggedIn}">
	<%@ include file="home.jsp" %>
</x:if>
<x:if test="${!isLoggedIn}">
	<%@ include file="loginForm.jsp" %>
</x:if> --%>

<%@ include file="footer.jsp"  %>
</body>
</html>