
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
<style>
.error {
	color: #a30d24;
	font-weight: bold;
}
</style>

</head>



<body class=" " style="background: url('component/img/signInback.jpg'); background-repeat: no-repeat; background-position: center; background-size: cover;">
	<header id="header" style="height: 45px">
		<div class="container d-flex">

			<div class=" mr-auto">
				<!-- <h1 class="text-light"><span>Worker Provider</span></h1> -->
			</div>
			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li class="active"><a
						href="${pageContext.servletContext.contextPath}/home">Home</a></li>
				</ul>
			</nav>
			<!-- .nav-menu -->
		</div>
	</header>

	<i class="bi bi-eye text-white"></i>
	<div class="container">



		<div class="row">
			<div class="col-md-6 mx-auto p-0">
				<div class="carda mt-5 my-5">
					<div class="login-box"
						style="background: url('component/img/back.jpg'); background-repeat: no-repeat; background-position: center; background-size: cover;">
						<div class="login-snips">

							<div class="container text-center">
								
								<h3 class=" " style="color: #abebdc"><strong><em>Please Sign In For Active Your Service</em></strong></h3>
								<div class="hr"></div>
									
									<p>If not registered than Please.. <a href="${pageContext.servletContext.contextPath}/register" style="color: #fce8e8;text-decoration: underline;">Register.</a></p>

							</div>

							<div class="login-space">
								<div class="login">
								<c:url value="signInPage" var="loginUrl"></c:url>
									<form:form action="${loginUrl}" method="post" modelAttribute="User"
										>
										<div class="group">
											<label for="user" class="label">Email:</label>
											<form:input path="username" id="frm_email" cssClass="input my-2"
												placeholder="Enter your Email" />

											<form:errors path="username" cssClass="error mt-1"></form:errors>
											<span class="error_form " id="email_error_message"
												style="margin-top: 2px"></span>
										</div>

										<div class="group">
											<label for="pass" class="label">Password</label>
											<form:input path="password" id="frm_password" type="password"
												cssClass="input my-2" placeholder="Enter your password" />
											<form:errors path="password" cssClass="error mt-1"></form:errors>
											<span class="error_form" id="password_error_message"></span>
										</div>

										<div class="group">
											<button type="submit" class="button mt-4" value="">Sign
												In</button>
										</div>
									</form:form>
									<div class="hr"></div>
									<div class="foot">
										<div class="container text-center">
											<h3 style="color: #bd0d22">${msg }</h3>
										</div>
									</div>




								</div>

							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<%@include file="./CommonScripts.jsp"%>
<link rel="stylesheet"
	href=' <c:url value="/component/css/LogInSignUp.css" />'
	type="text/css">
<script src="<c:url value="/component/js/MyJs.js" />"></script>