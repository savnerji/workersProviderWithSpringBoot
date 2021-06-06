



<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>${title}</title>
<meta content="" name="description">
<meta content="" name="keywords">





<%@include file="./CommonHeaderLinks.jsp"%>

<link rel="stylesheet" href=' <c:url value="/component/css/style.css" />' type="text/css">

</head>

<body>



	<!-- ======= Header ======= -->
	<header id="header">
		<div class="container d-flex">

			<div class=" mr-auto">
				<img class="img-fluid logo" alt="logo" src='<c:url value="/component/img/logo/logo.png"></c:url>' style="height: 28px; width: 291px;">

			</div>

			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<%-- <c:if test="${not empty usr }">
						<li class="active"><a href="${pageContext.servletContext.contextPath}/UserHome">Home</a></li>
					</c:if> --%>



					<c:choose>
						<c:when test="${not empty usr}">
							<li class="active"><a href="${pageContext.servletContext.contextPath}/User/UserHome">Home</a></li>
						</c:when>
						<c:otherwise>
							<li class="active"><a href="${pageContext.servletContext.contextPath}/home">Home</a></li>
						</c:otherwise>
					</c:choose>


				<li><a href="${pageContext.servletContext.contextPath}/about">About Us</a></li>

					<li class="drop-down"><a href="#">Services</a>

						<ul>
							<li><a href="${pageContext.servletContext.contextPath}/service/MECHANIC">MECHANIC</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/ELECTRICIAN">ELECTRICIAN</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/PLUMBING">PLUMBING</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/COOKING">COOKING</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/CARPENTER">CARPENTER</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/TUTOR">TUTOR</a></li>
						</ul></li>


					<%-- 	<li><a href="${pageContext.servletContext.contextPath}/LogOut">Log
							Out</a></li> --%>
					<li><a href="${pageContext.servletContext.contextPath}/contact">Contact</a></li>
					
					<c:if test="${not empty usr }">
						<li><a href="${pageContext.servletContext.contextPath}/logout">Log Out</a></li>
					</c:if>


				</ul>
			</nav>
			<!-- .nav-menu -->

		</div>
	</header>
	<!-- End Header -->



	<main id="main">

		<c:if test="${serviceName == 'MECHANIC' }">
			<!-- ======= About Section ======= -->
			<section id="about" class="about">
				<div class="container">

					<div class="row mt-5">
						<div class="col-lg-6">
							<img src='<c:url value="/component/img/services/mechanic.png"/>' class="img-fluid" alt="" style="height: auto; width: auto;">

						</div>
						<div class="col-lg-6 pt-4 pt-lg-0 content">
							<h3>We have solution for your all Mechanic Problems.</h3>
							<p class="font-italic">We provide you a greate Service for your Mechanic issue's .</p>
							<ul>
								<li><i class="icofont-check-circled"></i> Conduct regular maintainance in machinery, systems, and automative vehicles.</li>
								<li><i class="icofont-check-circled"></i> Meet with clients to better understand their concerns and identify the issue.</li>
								<li><i class="icofont-check-circled"></i> Assemble mechanincal components according to specifications.</li>
								<li><i class="icofont-check-circled"></i> Offer consultation on maintainance and preventative procedures to machine and vehicle users.</li>
								<li><i class="icofont-check-circled"></i> Examine machines and oversee diagnostic tests to determine functionality problems.</li>

							</ul>


							<!-- 	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
								minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
								voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
								deserunt mollit anim id est laborum.</p> -->

							<div class="container text-center">
								<div class="buttonA" id="button-3">
									<div id="circle"></div>
									<a id="Link" href="${pageContext.servletContext.contextPath}/User/ActiveService/Mechanic"><strong>Active Service</strong></a>
								</div>
							</div>

						</div>
					</div>

				</div>
			</section>
			<!-- End About Section -->


		</c:if>



		<c:if test="${serviceName == 'ELECTRICIAN' }">
			<!-- ======= About Section ======= -->
			<section id="about" class="about">
				<div class="container">

					<div class="row mt-5">
						<div class="col-lg-6">
							<img src='<c:url value="/component/img/services/electrician.png"/>' class="img-fluid" alt="" style="height: auto; width: auto;">

						</div>
						<div class="col-lg-6 pt-4 pt-lg-0 content">
							<h3>We have solution for your all house Electric Problems.</h3>
							<p class="font-italic">We provide you a greate Service for uour Electric issue's .</p>
							<ul>
								<li><i class="icofont-check-circled"></i> Electricians specializing in construction primarily install wiring systems into new homes.</li>
								<li><i class="icofont-check-circled"></i> Electricians specializing in maintenance fix and upgrade existing electrical systems and repair
									electrical equipment.</li>
								<li><i class="icofont-check-circled"></i>They make needed repairs as quickly as possible in order to minimize inconvenience.</li>
								<li><i class="icofont-check-circled"></i>They Replace items such as circuit breakers, fuses, switches.</li>

							</ul>


							<div class="container text-center">
								<div class="buttonA" id="button-3">
									<div id="circle"></div>
									<a id="Link" href="${pageContext.servletContext.contextPath}/User/ActiveService/Electrician"><strong>Active Service</strong></a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</section>
			<!-- End About Section -->
		</c:if>


		<c:if test="${serviceName == 'PLUMBING' }">
			<!-- ======= About Section ======= -->
			<section id="about" class="about">
				<div class="container">

					<div class="row mt-5">
						<div class="col-lg-6">
							<img src='<c:url value="/component/img/services/plumber.png"/>' class="img-fluid" alt="" style="height: auto; width: auto;">

						</div>
						<div class="col-lg-6 pt-4 pt-lg-0 content">
							<h3>We have solution for your all Plumbing Problems.</h3>
							<p class="font-italic">We provide you a greate Service fpr uour plumbing issue's .</p>
							<ul>
								<li><i class="icofont-check-circled"></i> Reading and specifications to determine layout of water supply, waste, and venting systems.</li>
								<li><i class="icofont-check-circled"></i> Installing, repairing and maintaining domestic plumbing fixtures and systems.</li>
								<li><i class="icofont-check-circled"></i> Testing pipes for leaks using air and water pressure gauges.</li>
							</ul>
							<p>Locating and marking positions for pipe connections, passage holes, and fixtures in walls and floors.</p>

							<div class="container text-center">
								<div class="buttonA" id="button-3">
									<div id="circle"></div>
									<a id="Link" href="${pageContext.servletContext.contextPath}/User/ActiveService/Plumber"><strong>Active Service</strong></a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</section>
			<!-- End About Section -->
		</c:if>


		<c:if test="${serviceName == 'COOKING' }">
			<!-- ======= About Section ======= -->
			<section id="about" class="about">
				<div class="container">

					<div class="row mt-5">
						<div class="col-lg-6">
							<img src='<c:url value="/component/img/services/chef.png"/>' class="img-fluid" alt="" style="height: auto; width: auto;">

						</div>
						<div class="col-lg-6 pt-4 pt-lg-0 content">
							<h3>We have solution for your all Plumbing Problems.</h3>
							<p class="font-italic">We provide you a great Service of .</p>
							<ul>
								<li><i class="icofont-check-circled"></i> People looking for a skilled Cook to prepare delicious meals for them can book here.</li>
								<li><i class="icofont-check-circled"></i> Cook experienced in using various ingredients and cooking techniques are available here.</li>
								<li><i class="icofont-check-circled"></i> Makes adjustments to food items to accommodate guests with allergies or specific diet concerns.</li>
								<li><i class="icofont-check-circled"></i> Communicates with owner about how to improve meal service.</li>
								<li><i class="icofont-check-circled"></i> Maintain cleaning and hygiene along with preparing delicious meals.</li>
							</ul>
							<!-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
								minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
								voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
								deserunt mollit anim id est laborum.</p> -->

							<div class="container text-center">
								<div class="buttonA" id="button-3">
									<div id="circle"></div>
									<a id="Link" href="${pageContext.servletContext.contextPath}/User/ActiveService/Cooking"><strong>Active Service</strong></a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</section>
			<!-- End About Section -->
		</c:if>


		<c:if test="${serviceName == 'CARPENTER' }">
			<!-- ======= About Section ======= -->
			<section id="about" class="about">
				<div class="container">

					<div class="row mt-5">
						<div class="col-lg-6">
							<img src='<c:url value="/component/img/services/carpenter.png"/>' class="img-fluid" alt="" style="height: auto; width: auto;">

						</div>
						<div class="col-lg-6 pt-4 pt-lg-0 content">
							<h3>We have solution for your all carpentery Problems.</h3>
							<p class="font-italic">We provide you a great Service for your carpentery issue's .</p>
							<ul>
								<li><i class="icofont-check-circled"></i> Follow blueprints and building plans to meet the needs of clients.</li>
								<li><i class="icofont-check-circled"></i> Install structures and fixtures, such as windows and molding.</li>
								<li><i class="icofont-check-circled"></i> Construct building frameworks, including walls, floors, and doorframes.</li>
								<li><i class="icofont-check-circled"></i> Inspects ceiling or floor tile, wall coverings, siding, glass, or woodwork to detect broken or
									damaged structures.</li>
								<li><i class="icofont-check-circled"></i> Follows established safety rules and regulations and maintaining a safe and clean environment.</li>
							</ul>
							<!-- 	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
								minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
								voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
								deserunt mollit anim id est laborum.</p> -->

							<div class="container text-center">
								<div class="buttonA" id="button-3">
									<div id="circle"></div>
									<a id="Link" href="${pageContext.servletContext.contextPath}/User/ActiveService/Carpenter"><strong>Active Service</strong></a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</section>
			<!-- End About Section -->
		</c:if>


		<c:if test="${serviceName == 'TUTOR' }">
			<!-- ======= About Section ======= -->
			<section id="about" class="about">
				<div class="container">

					<div class="row mt-5">
						<div class="col-lg-6">
							<img src='<c:url value="/component/img/services/tutor.png"/>' class="img-fluid" alt="" style="height: auto; width: auto;">

						</div>
						<div class="col-lg-6 pt-4 pt-lg-0 content">
							<h3>We have solution for your all Children studie's Problems.</h3>
							<p class="font-italic">We provide you a great Service for your Child's studies issue's .</p>
							<ul>
								<li><i class="icofont-check-circled"></i> Communicate clearly and appropriately with parents and students on all manners of topics.</li>
								<li><i class="icofont-check-circled"></i> Provide all of the students with an opportunity to ask questions no matter the depth.</li>
								<li><i class="icofont-check-circled"></i> Help to develop their study skills and techniques.</li>
								<li><i class="icofont-check-circled"></i> Provide exam tips where necessary.</li>
								<li><i class="icofont-check-circled"></i> Build up their confidence both academically and socially.</li>
							</ul>
							<!-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
								minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
								voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
								deserunt mollit anim id est laborum.</p> -->

							<div class="container text-center">
								<div class="buttonA" id="button-3">
									<div id="circle"></div>
									<a id="Link" href="${pageContext.servletContext.contextPath}/User/ActiveService/Tutor"><strong>Active Service</strong></a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</section>
			<!-- End About Section -->
		</c:if>









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
							<li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
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
							A108 Adam Street <br> New York, NY 535022<br> United States <br> <br> <strong>Phone:</strong> +1 5589 55488 55<br> <strong>Email:</strong>
							info@example.com<br>
						</p>

					</div>

					<div class="col-lg-4 col-md-6 footer-info">
						<h3>About Workers Providers</h3>
						<p>Service Provider is a platform to provide solution to all maintainance and servicing works at your homes and offices quickly,
							proffesionally and conveniently.</p>

					</div>

				</div>
			</div>
		</div>


	</footer>

	<!-- <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a> -->

	<%@include file="./CommonScripts.jsp"%>



</body>

</html>