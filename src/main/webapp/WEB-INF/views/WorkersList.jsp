



<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
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
				<!-- <h1 class="text-light"><span>Worker Provider</span></h1> -->

				<!-- <div class="d-flex justify-content-left h-100">
					<div class="searchbar">
						<input class="search_input" type="text" name="" placeholder="Search..."> <a href="#" class="search_icon"><i class="fa fa-search"
							aria-hidden="true"></i></a>
					</div>
				</div> -->

				<div class="row h-100 justify-content-center align-items-center">
					<div class="search_worker_container">
						<div class="search_Data">
							<form action="workerListByCity" id="searchBar" method="GET">
								<input class="Searchinpt" type="text" placeholder="Search Worker by City" name="city" style="background: transparent;">

							</form>
							<button class="searchbtn" type="submit" form="searchBar" style="">
								<i class="fa fa-search text-white" aria-hidden="true"></i>
							</button>



						</div>
						<div class="search_btn search_open"></div>
					</div>
				</div>
			</div>

			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li class="active"><a href="${pageContext.servletContext.contextPath}/User/UserHome">Home</a></li>

					<!-- <li><a href="#">About</a></li> -->

					<%-- 					<li class="drop-down"><a href="#">Services</a>

						<ul>
							<li><a href="${pageContext.servletContext.contextPath}/service/MECHANIC">MECHANIC</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/ELECTRICIAN">ELECTRICIAN</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/PLUMBING">PLUMBING</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/COOKING">COOKING</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/CARPENTER">CARPENTER</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/TUTOR">TUTOR</a></li>
						</ul></li> --%>


					<%-- 	<li><a href="${pageContext.servletContext.contextPath}/LogOut">Log
							Out</a></li> --%>
					<!-- <li><a href="#">Contact</a></li> -->

					<li><a href="${pageContext.servletContext.contextPath}/logout">Log Out</a></li>
				</ul>
			</nav>
			<!-- .nav-menu -->

		</div>
	</header>
	<!-- End Header -->



	<main id="main">



		<!-- ======= Featured Section ======= -->


		<section id="featured" class="featured mt-5">

			<c:choose>
				<c:when test="${not empty workerList}">
					<div class="container">
						<div class="section-title" data-aos="fade-up">
							<c:forEach var="workType" items="${workerList}">
								<h2>
									Our Available <span style="color: #4124ab">${workType.worker.work_Type }'s</span>
								</h2>
							</c:forEach>

						</div>
						<div class="row">
							<c:forEach var="availabkeWorker" items="${workerList}">
								<div class="col-lg-4">

									<a href="${pageContext.servletContext.contextPath}/User/workerData/${availabkeWorker.worker.w_Id}" style="cursor: pointer;">
										<div class="icon-box ">

											<div class="container text-center">
												<img class="mb-1" alt="" src='<c:url value="/component/image/profilePics/${availabkeWorker.worker.profilePic}"></c:url>'
													style="height: 130px; width: 130px; border-radius: 50%; cursor: pointer;">
											</div>

											<h4 class="text-center mt-1 workerName">
												<strong><em>${availabkeWorker.worker.w_Name}</em></strong>
											</h4>
											<h4 class="text-center mt-1 workerName">${availabkeWorker.worker.city}</h4>
											<h4 class="text-center mt-1 workerName">min. ${availabkeWorker.worker.work_Price} &#8377</h4>

										</div>
									</a>
								</div>

							</c:forEach>

						</div>

					</div>
				</c:when>
				<c:otherwise>
					<div class="container text-center">
						<h5 class="display-1">Sorry..</h5>
						<p class="display-4">Worker's Not Available.</p>

						<div class="container text-center">
							<div class="buttonA" id="button-3">
								<div id="circle"></div>
								
								<c:choose>
								<c:when test="${condition == 1 }">
								<a id="Link" href="${pageContext.servletContext.contextPath}/User/UserHome"><strong>Go Back</strong></a>
								</c:when>
								<c:otherwise>
								<a id="Link" href="${pageContext.servletContext.contextPath}/User/WorkersList"><strong>Go Back</strong></a>
								</c:otherwise>
								</c:choose>
								
								<%-- <a id="Link" href="${pageContext.servletContext.contextPath}/User/WorkersList"><strong>Go Back</strong></a> --%>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>



		</section>

		<!-- End Featured Section -->

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer">



		<div class="footer-top ">
			<div class="container">
				<div class="row">

					<div class="col-lg-4 col-md-6 footer-links  ">
						<h4>Useful Links</h4>

						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
						</ul>

					</div>

					<div class="col-lg-4 col-md-6 footer-links  ">
						<h4>Useful Links</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
						</ul>
					</div>

					<div class="col-lg-4 col-md-6 footer-contact">
						<h4>Contact Us</h4>
						<p>
							AB Street <br> Somewhere, <br> India <br> <br> <strong>Phone:</strong> 123567890 <br> <strong>Email:</strong>
							email@example.com<br>
						</p>

					</div>
				</div>
			</div>
		</div>


	</footer>
	<!-- End Footer -->

	<!-- <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a> -->

	<%@include file="./CommonScripts.jsp"%>

	<script src="<c:url value="/component/js/MyAnimation.js" />"></script>

</body>

</html>