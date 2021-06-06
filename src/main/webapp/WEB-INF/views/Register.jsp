


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
<style>
.error {
	color: #a30d24;
	font-weight: lighter;
	font-size: 13px;
}
</style>

</head>



<body class=" "
	style="background: url('component/img/signInback.jpg'); background-repeat: no-repeat; background-position: center; background-size: cover;">
	<header id="header" style="height: 45px">
		<div class="container d-flex">

			<div class=" mr-auto">
				<img class="img-fluid logo" alt="logo" src='<c:url value="component/img/logo/logo.png"></c:url>'>
			</div>
			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li class="active"><a href="${pageContext.servletContext.contextPath}/home">Home</a></li>
				</ul>
			</nav>
			<!-- .nav-menu -->
		</div>
	</header>
	<i class="bi bi-eye text-white"></i>
	<div class="container">
		<div class="row">
			<div class="col-md-6 mx-auto p-0">
				<div class="carda mt-3">
					<div class="login-box"
						style="background: url('component/img/back.jpg'); background-repeat: no-repeat; background-position: center; background-size: cover;">
						<div class="login-snip">




							<div class="container text-center">
								<h3 class="text-white mt-1">Sign Up</h3>
							</div>
							<div class="hr"></div>

							<div class="container text-center">
								<h3 style="color: red; font-size: 18px;">${emailExistMsg}</h3>
							</div>

							<div class="login-space">

								<!-- //form for the sign up  -->
								<div class="sign-up-form">
									<form:form action="signUp" method="post" modelAttribute="User" id="signUpForm">
										<div class="group">
											<label for="user" class="label">Username:</label>
											<form:input path="Name" id="userName" type="text" cssClass="input" placeholder="Create your Username" />
											<form:errors path="Name" cssClass="error"></form:errors>
											<span class="error_form " id="usrname_error_message" style="margin-top: 2px"></span>
										</div>
										<div class="group">
											<label for="pass" class="label">Email:</label>
											<form:input path="Email" id="usrEmail" type="email" cssClass="input" data-type="email" placeholder="Create your Email" />
											<form:errors path="Email" cssClass="error"></form:errors>
											<span class="error_form " id="eml_error_message" style="margin-top: 2px"></span>
										</div>
										<div class="group">
											<label for="pass" class="label">Contact Number:</label>
											<form:input path="Contact" id="userContact" cssClass="input" data-type="" placeholder="Enter your Contact number" />
											<form:errors path="Contact" cssClass="error"></form:errors>
											<span class="error_form " id="cont_error_message" style="margin-top: 2px"></span>
										</div>

										<div class="group">
											<label for="pass" class="label">Your City:</label>
											<form:input path="city" id="userCity" cssClass="input" data-type="" placeholder="Enter your city " />
											<form:errors path="city" cssClass="error"></form:errors>
											<span class="error_form " id="City_error_message" style="margin-top: 2px"></span>
										</div>



										<div class="group">
											<label for="pass" class="label">Password:</label>
											<form:input path="Password" id="userPassword" type="password" cssClass="input " placeholder="Enter your Password" />
											<span class="fa fa-fw fa-eye text-white eyeIconAtSignup" id="eye-icon" onclick="passwordIconSignUpToggler()" aria-hidden="true"></span>
											<form:errors path="Password" cssClass="error" style="    margin-left: -22px;"></form:errors>
											<span class="error_form " id="pass_error_message" style="margin-top: 2px;"></span>
										</div>
										<form:hidden path="role" value="ROLE_USER" />

										<div class="group">
											<!-- <input type="submit" class="button" value="Sign Up"> -->

											<div class="p-2 conatiner text-center" style="margin-top: -18px;">
												<button class="completeBtn" type="submit" style="padding: 4px 13px 4px 13px; border: 1px solid #e6573f;">Register</button>
											</div>
										</div>

									</form:form>
									<div class="hr"></div>



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

<script src="<c:url value="/component/js/MyJs.js" />"></script>

</html>
