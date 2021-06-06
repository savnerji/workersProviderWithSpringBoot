
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
</style>

</head>

<!-- background: linear-gradient(45deg, rgb(82 106 193), rgb(33, 32, 98)); -->

<body class=" " style="background: url('component/img/signInback.jpg'); background-repeat: no-repeat; background-position: center; background-size: cover;">
	<!-- ======= Header ======= -->
	<header id="header">
		<div class="container d-flex">

			<div class=" mr-auto">
				<!-- <h1 class="text-light"><span>Worker Provider</span></h1> -->

			</div>

			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li class="active"><a href="${pageContext.servletContext.contextPath}/home">Home</a></li>

					<%-- <li><a href="${pageContext.servletContext.contextPath}/about">About</a></li> --%>

				<%-- 	<li class="drop-down"><a href="#">Services</a>

						<ul>
							<li><a href="${pageContext.servletContext.contextPath}/service/MECHANIC">MECHANIC</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/ELECTRICIAN">ELECTRICIAN</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/PLUMBING">PLUMBING</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/COOKING">COOKING</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/CARPENTER">CARPENTER</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/TUTOR">TUTOR</a></li>
						</ul></li> --%>


				<%-- 	<li class="drop-down"><a href="#">Sign In as</a>
						<ul>
							<li id="registerlink"><a href="${pageContext.servletContext.contextPath}/Worker/workerHomePage">Worker</a></li>
							<li id="registerlink" class=""><a href="${pageContext.servletContext.contextPath}/User/UserHome">User</a></li>

						</ul></li> --%>

					<%-- <li class="drop-down"><a href="#">Sign up as</a>
						<ul>
							<li id="registerlink" class=""><a href="${pageContext.servletContext.contextPath}/WorkerSignUP">Worker </a></li>
							<li id="registerlink"><a href="${pageContext.servletContext.contextPath}/register">User </a></li>
						</ul></li> --%>

					<!-- <li><a href="#">Contact</a></li>
					<li><a href="#">Team</a></li> -->

				</ul>
			</nav>
			<!-- .nav-menu -->

		</div>
	</header>
	<!-- End Header -->

	<i class="bi bi-eye text-white"></i>
	




		<!-- ====modal for forgot password====== -->


		<div class="container mt-5"></div>


		<!-- Modal -->
		<div class=" " id="forgotPassword" tabindex="-1" aria-labelledby="exampleModalCenterTitle">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header  " style="background: linear-gradient(45deg, #212062, #0037ff61);">
						<div class="container text-center">
							<!-- <h5 class="modal-title text-white">Update Your Availability Status</h5> -->
						</div>

						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" style="background: aliceblue">
						<div class="container text-center">

							<c:choose>

								<c:when test="${not empty otpSendingError}">
									<div class="alert alert-danger" role="alert">
										<p class="text-center">${otpSendingError }</p>
									</div>

									<a href="${pageContext.servletContext.contextPath}/User/UserHome" class="btn text-white"
										style="background: linear-gradient(45deg, #0037ff61, #212062);">Try again. </a>
								</c:when>

								<c:otherwise>

									<c:choose>
										<c:when test="${not empty sentOTP }">
											<div class="alert alert-success" role="alert">
												<p class="text-center">${sentOTP }</p>
											</div>
											<!-- ===form for forgot pasword == -->

											<form action="verify_otp" method="POST">
												<div class="form-group">
													<input name="otp" type="text" class="form-control" placeholder="Please enter OTP.." required>
												</div>


												<button type="submit" class="btn text-white" style="background: linear-gradient(45deg, #0037ff61, #212062);">Verify OTP.</button>
											</form>
											<!-- ===form for  forgot pasword== -->
										</c:when>

										<c:otherwise>

										<c:choose>
											<c:when test="${not empty otpInvalid }">
												<div class="alert alert-danger" role="alert">
													<p class="text-center">${otpInvalid }</p>
												</div>
												<!-- ===form for forgot pasword == -->

												<form action="verify_otp" method="POST">
													<div class="form-group">
														<input name="otp" type="text" class="form-control" placeholder="Please enter OTP.." required>
													</div>


													<button type="submit" class="btn text-white" style="background: linear-gradient(45deg, #0037ff61, #212062);">Verify OTP.</button>
												</form>
												<!-- ===form for  forgot pasword== -->
											</c:when>
										
										</c:choose>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>





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