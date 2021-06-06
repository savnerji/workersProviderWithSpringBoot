<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>${title }</title>
<meta content="" name="description">
<meta content="" name="keywords">

<%@include file="./CommonHeaderLinks.jsp"%>

<link rel="stylesheet" href=' <c:url value="/component/css/LogInSignUp.css" />' type="text/css">


</head>
<body>

	<div class="container text-center mt-5">
		<h5 class="display-1">Sorry..</h5>
		<p class="display-4">${msg}</p>

		<div class="container text-center">
			<div class="buttonA" id="button-3">
				<div id="circle"></div>
				<a id="Link" href="${pageContext.servletContext.contextPath}/User/UserHome"><strong>Go Back</strong></a>
			</div>
		</div>
	</div>

</body>
</html>