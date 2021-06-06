
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

<style>
.error {
	color: #a30d24;
	font-weight: bold;
}

.group input {
	border: none;
	padding: 20px 20px;
	border-radius: 25px;
	background: rgba(255, 255, 255, .1);
}
</style>

</head>



<body class=" "
	style="background: url('component/img/signInback.jpg'); background-repeat: no-repeat; background-position: center; background-size: cover;">
	<header id="header" style="height: 63px">
		<div class="container d-flex">

			<div class=" mr-auto mt-3">
				<img class="img-fluid logo" alt="logo" src='<c:url value="component/img/logo/logo.png"></c:url>' >

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
				<div class="carda mt-3 my-5">
					<div class="login-box"
						style="background: url('component/img/back.jpg'); background-repeat: no-repeat; background-position: center; background-size: cover;">
						<div class="login-snips">

							<div class="container text-center">

								<h3 class=" text-white">Sign In</h3>
								<div class="hrr"></div>


							</div>

							<div class="login-space">
								<div class="login">
									<c:url value="/signIN" var="loginUrl" />
									<c:if test="${not empty errorMessage }">
										<div class="container text-center">
											<p style="color: #ba0f0f">${errorMessage}</p>
										</div>
									</c:if>

									<form:form action="${loginUrl}" method="post" modelAttribute="User">

										<div class="group">
											<label for="user" class="label">Email:</label>
											<form:input path="username" id="frm_email" cssClass="signIninput my-2" placeholder="Enter your Email" />

											<form:errors path="username" cssClass="error mt-1"></form:errors>
											<span class="error_form " id="email_error_message" style="margin-top: 2px"></span>
										</div>

										<div class="group mt-3">
											<label for="pass" class="label">Password</label>
											<form:input path="password" id="frm_password" type="password" cssClass="signIninput my-2 " placeholder="Enter your password" />

											<span class="fa fa-fw fa-eye  text-white" id="eye-icon" onclick="passwordTogller()" aria-hidden="true"
												style="position: relative; display: flex; left: 320px; bottom: 42px; z-index: 2; cursor: pointer;"></span>

											<form:errors path="password" cssClass="error mt-1"></form:errors>
											<span class="error_form" id="password_error_message"></span>
										</div>



										<div class="group">
											<!-- <input type="submit" class="button" value="Sign Up"> -->

											<div class="p-2 conatiner text-center" style="margin-top: -14px;">
												<button class="completeBtn " type="submit" style="padding: 4px 13px 4px 13px; border: 1px solid #e6573f;width: 214px;">Sign In</button>
											</div>
										</div>


									</form:form>
									<div class="hr"></div>

									<a href="#" data-target="#forgotPassword" data-toggle="modal" class="forgotPassword">Forgot Password</a>

									<div class="foot">
										<div class="container text-center">
											<h3 style="color: ${style}">${msg }</h3>
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



	<!-- ====modal for forgot password====== -->

	<!-- Modal -->
	<div class="modal fade" id="forgotPassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header  " style="background: linear-gradient(45deg, #212062, #0037ff61);">
					<div class="container text-center">
						<!-- <h5 class="modal-title text-white">Update Your Availability Status</h5> -->
					</div>


				</div>
				<div class="modal-body" style="background: aliceblue">
					<div class="container text-center">


						<!-- ===form for forgot pasword == -->

						<form action="send_otp" method="POST">
							<div class="form-group">
								<label for="exampleInputEmail1"> Please enter your registered Email address</label> <input name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
							</div>


							<button type="submit" class="btn text-white" style="background: linear-gradient(45deg, #0037ff61, #212062);">Sent OTP</button>
						</form>
						<!-- ===form for  forgot pasword== -->
					</div>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- <!-- ====modal for forgot password======= -->




</body>
<%@include file="./CommonScripts.jsp"%>



<script src="<c:url value="/component/js/MyJs.js" />"></script>