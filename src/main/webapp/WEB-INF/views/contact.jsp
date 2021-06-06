<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Contact - Eterna Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<%@include file="./CommonHeaderLinks.jsp"%>
</head>

<body>



	<!-- ======= Header ======= -->
	<header id="header">
		<div class="container d-flex">

			<div class="logo mr-auto">
				<img class="img-fluid logo" alt="logo" src='<c:url value="component/img/logo/logo.png"></c:url>' style="height: 28px; width: 291px;">
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

					<li class="active"><a href="${pageContext.servletContext.contextPath}/contact">Contact</a></li>
				</ul>
			</nav>
			<!-- .nav-menu -->

		</div>
	</header>
	<!-- End Header -->

	<main id="main " class="mt-5">



		<!-- ======= Contact Section ======= -->
		<section id="contact " class="contact">
			<div class="container">

				<div class="row">
					<div class="col-lg-6">
						<div class="info-box mb-4">
							<i class="bx bx-map"></i>
							<h3>Our Address</h3>
							<p>Somewhere in india..</p>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="info-box  mb-4">
							<i class="bx bx-envelope"></i>
							<h3>Email Us</h3>
							<p>workersproviders@gmail.com</p>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="info-box  mb-4">
							<i class="bx bx-phone-call"></i>
							<h3>Call Us</h3>
							<p>+91 123654789</p>
						</div>
					</div>

				</div>

				<div class="row">

					<!-- <div class="col-lg-6 ">
            <iframe class="mb-4 mb-lg-0" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" style="border:0; width: 100%; height: 384px;" allowfullscreen></iframe>
          </div> -->

					<div class="col-lg-6">
						<form:form action="connectUs" method="post" cssClass="contact-form" id="contact_form">
							<div class="form-row">
								<div class="col form-group">
									<input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4"
										data-msg="Please enter at least 4 chars" required/>
									<div class="validate"></div>
								</div>
								<div class="col form-group">
									<input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email"
										data-msg="Please enter a valid email" required/>
									<div class="validate"></div>
								</div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4"
									data-msg="Please enter at least 8 chars of subject"required />
								<!-- 	<div class="validate"></div> -->
							</div>
							<div class="form-group">
								<textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"
									id="message" required></textarea>
								<div class="validate"></div>
							</div>


							<input type="hidden" value="${pageContext.request.contextPath}" id="baseUrl">

							<!-- <div class="mb-3">
								<div class="loading">Loading</div>
								<div class="error-message"></div>
								<div class="sent-message">Your message has been sent. Thank you!</div>
							</div> -->
							<div class="text-center">
								<button type="submit">Send Message</button>
							</div>
						</form:form>




					</div>

				</div>

			</div>
		</section>
		<!-- End Contact Section -->

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

	<%@include file="./CommonScripts.jsp"%>S
	<script src="<c:url value="/component/js/Ajax.js" />"></script>

</body>

</html>