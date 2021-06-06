<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>${title }</title>
<meta content="" name="description">
<meta content="" name="keywords">

<%@include file="./CommonHeaderLinks.jsp"%>

<link rel="stylesheet" href=' <c:url value="/component/css/LogInSignUp.css" />' type="text/css">


</head>

<body
	style="background: url('component/img/workerbackground.jpg'); background-repeat: no-repeat; background-position: center; background-size: cover;">
	<!-- ======= Header ======= -->
	<header id="header">
		<div class="container d-flex">

			<div class=" mr-auto">
				<!-- <h1 class="text-light"><span>Worker Provider</span></h1> -->
			</div>
			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li class="active"><a href="${pageContext.servletContext.contextPath}/home">Home</a></li>
				</ul>
			</nav>
			<!-- .nav-menu -->
		</div>
	</header>





	<div class="container d-flex justify-content-center ">



		<div class="card mt-5" style="width: 26rem; background: linear-gradient(0deg, rgba(34,40,40,0.44611347957151615) 24%, rgba(51,51,54,0.28644961402529767) 68%);">
			<div class="card-header" style="background: linear-gradient(45deg, #003679, transparent);">
				<div class="container text-center ">
					<h3 class="text-white">
						<strong><em>Log IN</em></strong>
					</h3>
				</div>

			</div>

			<div class="card-body" style="background: linear-gradient(45deg, #0b2366, transparent);">
			<c:url value="/wSignIn" var="workerSignIn"></c:url>
			
				<form:form action="${workerSignIn }"  modelAttribute="workerSignIn" cssClass="workerForm" enctype="multipart/form-data">

					<div class="form-group">
						<label class="workerLabel" for="exampleFormControlInput1">Worker Email :</label>
						<form:input path="username" cssClass="form-control inpt" id="frm_email" placeholder="Enter your Email" cssStyle="color:#07a64c" />
						<form:errors path="username" cssClass="error"></form:errors>
						<span class="error_form " id="email_error_message" style="margin-top: 2px"></span>
					</div>

					<div class="form-group">
						<label class="workerLabel" for="exampleFormControlInput1">Worker Password :</label>
						<form:input type="password" path="password" cssClass="form-control inpt" id="frm_password" placeholder="Enter your Password"
							cssStyle="color:#07a64c" />
						<form:errors path="password" cssClass="error"></form:errors>
						<span class="error_form " id="password_error_message" style="margin-top: 2px"></span>
					</div>


					<div class="container text-center">
						<p style="color: ${style}">${msg}</p>
					</div>

					<div class="container text-center mt-4 mb-4">
						<button type="submit" class="btn btn-outline-success">Log In</button>
					</div>




				</form:form>
			</div>
		</div>




	</div>


	<%@include file="./CommonScripts.jsp"%>
	<script src="<c:url value="/component/js/WorkerJs.js" />"></script>
</body>

</html>