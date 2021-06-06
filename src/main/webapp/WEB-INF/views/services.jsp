<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Services - Eterna Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<%@include file="./CommonHeaderLinks.jsp"%>


</head>

<body>




	<!-- ======= Header ======= -->
	<header id="header">
		<div class="container d-flex">

			<div class="logo mr-auto">
				<h1 class="text-light">
					<img class="img-fluid logo" alt="logo" src='<c:url value="component/img/logo/logo.png"></c:url>' style="height: 28px; width: 291px;">
				</h1>
				<!-- Uncomment below if you prefer to use an image logo -->
				<!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
			</div>

			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<c:choose>
						<c:when test="${Role == 'ROLE_USER'}">
							<li><a href="${pageContext.servletContext.contextPath}/User/UserHome">Home</a></li>
						</c:when>

						<c:otherwise>

							<c:choose>
								<c:when test="${Role == 'ROLE_WORKER'}">
									<li><a href="${pageContext.servletContext.contextPath}/Worker/workerHomePage">Home</a></li>

								</c:when>

								<c:otherwise>
									<li><a href="${pageContext.servletContext.contextPath}/home">Home</a></li>
								</c:otherwise>

							</c:choose>


							<%-- <a href="${pageContext.servletContext.contextPath}/Worker/workerHomePage">Home</a> --%>
						</c:otherwise>

					</c:choose>

					<li><a href="${pageContext.servletContext.contextPath}/about">About Us</a></li>



					<li class="active"><a href="services.html">Services</a></li>
					<li><a href="contact.html">Contact</a></li>

				</ul>
			</nav>
			<!-- .nav-menu -->

		</div>
	</header>
	<!-- End Header -->

	<main id="main">

	

		<!-- ======= Services Section ======= -->
		<section id="services" class="services mt-5">
			<div class="container">

				<div class="section-title" data-aos="fade-up">
					<h2>Our Services</h2>
				</div>

				<div class="row">
					<div class="col-lg-4 col-md-6 d-flex align-items-stretch">

						<div class="icon-box" onmouseenter="move(1)" onmouseleave="nomove(1)">
							<div class="text-center mb-4">
								<img class="" alt="" src="component/img/services/carpenter.png" style="height: 160px; width: 160px; border-radius: 50%; top: 10px;">
							</div>

							<!-- 	<div class="icon">
								<i class="bx bxl-dribbble"></i>
							</div> -->
							<h4>
								<a class="anchr" href="${pageContext.servletContext.contextPath}/service/CARPENTER">Carpentry </a>
							</h4>
							<p id="p1" style="font-size: 1em">We provide
								carpentry service at your home. So don't wait..</p>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
						<div class="icon-box" onmouseenter="move(2)" onmouseleave="nomove(2)">

							<div class="text-center mb-4">
								<img class="" alt="" src="component/img/services/chef.png" style="height: 160px; width: 160px; border-radius: 50%; top: 10px;">
							</div>
							<!-- <div class="icon">
								<i class="bx bx-file"></i>
							</div> -->
							<h4>
								<a class="anchr" href="${pageContext.servletContext.contextPath}/service/COOKING">Cooking</a>
							</h4>
							<p id="p2">We provide
								cooking service at your home. So don't wait..</p>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
						<div class="icon-box" onmouseenter="move(3)" onmouseleave="nomove(3)">

							<div class="text-center mb-4">
								<img class="" alt="" src="component/img/services/electrician.png" style="height: 160px; width: 160px; border-radius: 50%; top: 10px;">
							</div>
							<!-- 	<div class="icon">
								<i class="bx bx-tachometer"></i>
							</div> -->
							<h4>
								<a class="anchr" href="${pageContext.servletContext.contextPath}/service/ELECTRICIAN">Electrician</a>
							</h4>
							<p id="p3">We provide
								Electricians at your home. So don't wait..</p>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4">
						<div class="icon-box" onmouseenter="move(4)" onmouseleave="nomove(4)">

							<div class="text-center mb-4">
								<img class="" alt="" src="component/img/services/mechanic.png" style="height: 160px; width: 160px; border-radius: 50%; top: 10px;">
							</div>
							<!-- <div class="icon">
								<i class="bx bx-world"></i>
							</div> -->
							<h4>
								<a class="anchr" href="${pageContext.servletContext.contextPath}/service/MECHANIC">Mechanic</a>
							</h4>
							<p id="p4">We provide
								mechanic service at your home. So don't wait..</p>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4">
						<div class="icon-box" onmouseenter="move(5)" onmouseleave="nomove(5)">

							<div class="text-center mb-4">
								<img class="" alt="" src="component/img/services/tutor.png" style="height: 160px; width: 160px; border-radius: 50%; top: 10px;">
							</div>
							<!-- 	<div class="icon">
								<i class="bx bx-slideshow"></i>
							</div> -->
							<h4>
								<a class="anchr" href="${pageContext.servletContext.contextPath}/service/TUTOR">Personal Tutor</a>
							</h4>
							<p id="p5">We provide
								personal tutor at your home. So don't wait..</p>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4">
						<div class="icon-box" onmouseenter="move(6)" onmouseleave="nomove(6)">

							<div class="text-center mb-4">
								<img class="" alt="" src="component/img/services/plumber.png" style="height: 160px; width: 160px; border-radius: 50%; top: 10px;">
							</div>
							<!-- <div class="icon">
								<i class="bx bx-arch"></i>
							</div> -->
							<h4>
								<a class="anchr" href="${pageContext.servletContext.contextPath}/service/PLUMBING">Plumbing</a>
							</h4>
							<p id="p6">We provide
								plumbers at your home. So don't wait..</p>
						</div>
					</div>

				</div>

			</div>
		</section>
		<!-- End Services Section -->

		
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer">



		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-4 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>

							<c:choose>
								<c:when test="${Role == 'ROLE_USER'}">
									<li><i class="bx bx-chevron-right"></i><a href="${pageContext.servletContext.contextPath}/User/UserHome">Home</a></li>
								</c:when>

								<c:otherwise>

									<c:choose>
										<c:when test="${Role == 'ROLE_WORKER'}">
											<li><i class="bx bx-chevron-right"></i><a href="${pageContext.servletContext.contextPath}/Worker/workerHomePage">Home</a></li>

										</c:when>

										<c:otherwise>
											<li><i class="bx bx-chevron-right"></i><a href="${pageContext.servletContext.contextPath}/home">Home</a></li>
										</c:otherwise>

									</c:choose>


									<%-- <a href="${pageContext.servletContext.contextPath}/Worker/workerHomePage">Home</a> --%>
								</c:otherwise>

							</c:choose>


							<li><i class="bx bx-chevron-right"></i><a href="${pageContext.servletContext.contextPath}/about">About Us</a></li>

							<li class="active"><i class="bx bx-chevron-right"></i><a href="${pageContext.servletContext.contextPath}/contact">Contact</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="${pageContext.servletContext.contextPath}/services">Services</a></li>
							<!-- <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li> -->
						</ul>
					</div>

					<!-- 	<div class="col-lg-3 col-md-6 footer-links">
						<h4>Our Services</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
						</ul>
					</div> -->

					<div class="col-lg-4 col-md-6 footer-contact">
						<h4>Contact Us</h4>
						<p>
							AB Street <br> Somewhere, <br> India <br> <br> <strong>Phone:</strong> 123567890 <br> <strong>Email:</strong>
							email@example.com<br>
						</p>

					</div>

					<div class="col-lg-4 col-md-6 footer-info">
						<h3>About WorkersProvider</h3>
						<p>Workers Provider is a platform to provide solution to all maintainance and servicing works at your homes and offices quickly,
							proffesionally and conveniently.</p>
						<!-- 	<div class="social-links mt-3">
							<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a href="#"
								class="instagram"><i class="bx bxl-instagram"></i></a> <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a> <a href="#"
								class="linkedin"><i class="bx bxl-linkedin"></i></a>
						</div> -->
					</div>
				</div>
			</div>
		</div>


	</footer>
	<!-- End Footer -->

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

	<%@include file="./CommonScripts.jsp"%>

</body>

</html>