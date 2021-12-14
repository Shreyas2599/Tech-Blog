<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorry! Something went wrong</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



<link href="css/mystyle.css" rel="stylesheet" type="text/css" />

</head>
<body>


	<div class="container text-center">
		<img src="img/error.png" class="img-fluid mt-5">
		<h3 class="display-3">Sorry! Something went wrong ....</h3>
		<p><%=exception %></p>
		<a href="index.jsp" class="btn btn-outline-primary mt-3">Home</a>


	</div>


</body>
</html>