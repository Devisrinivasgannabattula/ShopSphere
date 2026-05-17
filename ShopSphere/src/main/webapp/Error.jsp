<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center><h1>
	<% 
	String msg=(String)request.getAttribute("msg");
	response.sendError(404,msg);
	%>
	<%= msg%>
	<a href="AddProduct.html">Add Product</a><br><br>
	<a href="view1">View Product</a><br><br>
	<a href="Logout">Logout</a><br><br>
</h1>

</body>
</html>