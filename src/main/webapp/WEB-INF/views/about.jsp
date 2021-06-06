<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>About</title>
<meta content="" name="description">
<meta content="" name="keywords">



<%@include file="./CommonHeaderLinks.jsp"%>

</head>

<body>

	<!-- ======= Top Bar ======= -->
	<section id="topbar" class="d-none d-lg-block">
		<div class="container d-flex"></div>
	</section>

	<!-- ======= Header ======= -->
	<header id="header">
		<div class="container d-flex">

			<div class="logo mr-auto">
				<img class="img-fluid mt-2 logo" alt="logo" src='<c:url value="component/img/logo/logo.png"></c:url>' style="height: 28px; width: 291px;">
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

				 	<li><a href="${pageContext.servletContext.contextPath}/contact">Contact</a></li> 

				</ul>
			</nav>
			<!-- .nav-menu -->

		</div>
	</header>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<!-- <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">Home</a></li>
          <li>About Us</li>
        </ol>
        <h2>About Us</h2>

      </div>
    </section> -->
		<!-- End Breadcrumbs -->

		<!-- ======= About Section ======= -->
		<section id="about" class="about">
			<div class="container">

				<div class="container  mt-5 ">
					<h2 style="font-family: Zen Dots, sans-sarif">
						<strong><em>About Us</em></strong>
					</h2>
				</div>


				<div class="row mt-5">
					<div class="col-lg-6">
						<img src='<c:url value="component/img/about.jpg"></c:url>' class="img-fluid" alt="" style="height: 600px;">

					</div>
					<div class="col-lg-6 pt-4 pt-lg-0 content">
						<h3 style="font-family: Dancing Script, sans-sarif">Complete satisfactory service....</h3>

						<ul class=" mt-3">
							<li>
								<!-- <i class="icofont-check-circled"></i> -->Service Provider is a platform to provide solution to all maintainance and servicing works at
								your homes and offices quickly, proffesionally and conveniently. We commit you not to bring any sort of unproffesionalism. We promise you to
								provide good service and trust to your doorsteps. We deliever your work by verified and qualified proffesionals only. We provide services of
								Plumber, Electrician, Cook, Carpenter,Tutor, Mecahnic.


							</li>


						</ul>
						<p>We pride ourselves on understanding our clients concerns and supplying the friendliest, most approachable and most conscientious service
							in Indore.</p>

						<p>Our Brand Promise is created to give you confidence that Workers Provider will deliver on service, quality and brand. We value our
							customers and want to provide you with the best so we follow our Brand Promise to do just that:</p>

						<ul>
							<li><i class="icofont-check-circled"></i>We will keep you inform all the time.</li>
							<li><i class="icofont-check-circled"></i>We will come up on time.</li>
							<li><i class="icofont-check-circled"></i>We will maintain standard of customer service.</li>
							<li><i class="icofont-check-circled"></i>We will listen all your problems and provide solutions.</li>
						</ul>


					</div>
				</div>

			</div>
		</section>
		<!-- End About Section -->





		<!-- ======= Testimonials Section ======= -->
		<section id="testimonials" class="testimonials">
			<div class="container">

				<div class="section-title">
					<h2>Team</h2>
					<!-- <p>We are a team is a of individuals (human or non-human) working together to achieve their goal..</p> -->
				</div>

				<div class="row">

						<div class="col-lg-6">
						<div class="testimonial-item mt-4 mt-lg-0">
							<img src="assets/img/team/testimonials-2.jpg" class="testimonial-img" alt="">
							
						
							<h3 class="mt-4 img-fluid text-wrap text-center">Vaibhav Savner</h3>
							
							
							
							 <h4 class="mt-2 text-center">Backend Developer</h4>
							<!--  <p>
								<i class="bx bxs-quote-alt-left quote-icon-left"></i> Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid
								cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa. <i
									class="bx bxs-quote-alt-right quote-icon-right"></i>
							</p>  -->
						</div>
					</div>

					<div class="col-lg-6">
						<div class="testimonial-item mt-4 mt-lg-0">
							<img src="assets/img/team/testimonials-2.jpg" class="testimonial-img" alt="">
							
						
							<h3 class="mt-4 img-fluid text-wrap text-center">Shruty Chouhan</h3>
							
							
							
							 <h4 class="mt-2 text-center">Backend Developer</h4>
							<!--  <p>
								<i class="bx bxs-quote-alt-left quote-icon-left"></i> Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid
								cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa. <i
									class="bx bxs-quote-alt-right quote-icon-right"></i>
							</p>  -->
						</div>
					</div>

						<div class="col-lg-6 mt-3" >
						<div class="testimonial-item mt-4 mt-lg-0">
							<img src="assets/img/team/testimonials-2.jpg" class="testimonial-img" alt="">
							
						
							<h3 class="mt-4 img-fluid text-wrap text-center">Shruty Chouhan</h3>
							
							
							
							 <h4 class="mt-2 text-center">Backend Developer</h4>
							<!--  <p>
								<i class="bx bxs-quote-alt-left quote-icon-left"></i> Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid
								cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa. <i
									class="bx bxs-quote-alt-right quote-icon-right"></i>
							</p>  -->
						</div>
					</div>

					<div class="col-lg-6 mt-3">
						<div class="testimonial-item mt-4 mt-lg-0">
							<img src="assets/img/team/testimonials-2.jpg" class="testimonial-img" alt="">
							
						
							<h3 class="mt-4 img-fluid text-wrap text-center">Shruty Chouhan</h3>
							
							
							
							 <h4 class="mt-2 text-center">Backend Developer</h4>
							<!--  <p>
								<i class="bx bxs-quote-alt-left quote-icon-left"></i> Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid
								cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa. <i
									class="bx bxs-quote-alt-right quote-icon-right"></i>
							</p>  -->
						</div>
					</div>



				</div>

			</div>
		</section>
		<!-- End Testimonials Section -->

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer">

		<!--     <div class="footer-newsletter">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <h4>Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
          </div>
          <div class="col-lg-6">
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>
          </div>
        </div>
      </div>
    </div> -->

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