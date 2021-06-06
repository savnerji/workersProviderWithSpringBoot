<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<%-- <%@page import="com.WorkerProvider.Entities.User"%>
<%
User usr = (User) session.getAttribute("User");

if (usr == null) {
	response.sendRedirect(request.getContextPath() + "/home");
}
%> --%>
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
				<h5 class=" mt-2 ml-1 name">${usr.name }</h5>

			</div>

			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li class="active"><a href="${pageContext.servletContext.contextPath}/User/UserHome">Home</a></li>

					<li><a href="${pageContext.servletContext.contextPath}/contact">Contact</a></li>
					<li><a href="${pageContext.servletContext.contextPath}/about">About Us</a></li>

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
			<div class="container-fluid">
				<div class="section-title" data-aos="fade-up">

					<h2>
						Hy I'm <span style="color: #4124ab">${workerData.w_Name}</span>

					</h2>


				</div>


				<div class="row">
					<div class="col-lg-5 col-md-5">
						<div class="container text-center">
							<img class="mb-1 img-fluid" alt="" src='<c:url value="/component/image/profilePics/${workerData.profilePic}"></c:url>'
								style="height: ; width: auto; cursor: pointer; margin-top: 65px;border-radius: 9%">
						</div>
					</div>

					<div class="col-lg-7 col-md-7">

						<div class="container text-center">

							<!-- 		<table class="table">
						
								<tbody>
									<tr style="border: none;">

										<td>Mark</td>
										<td>Otto</td>

									</tr>
									<tr>

										<td>Jacob</td>
										<td>Thornton</td>

									</tr>
									<tr>

										<td>Larry</td>
										<td>the Bird</td>

									</tr>
								</tbody>
							</table> -->

							<div class="row mt-4">
								<div class="container ">
									<h3 style="right: 6%; position: relative;">
										<strong><em>Here Is my Details..</em></strong>
									</h3>
								</div>
								<div class="container mt-5">

									<table class="mt-1" style="width: 100%">
										<tr class="tableRow">
											<td><h4 class="workDetailsclmn">City :</h4></td>
											<td class="workDetailsclmndata">${workerData.city}</td>


										</tr>
										<tr class="tableRow">
											<td><h4 class="workDetailsclmn">Address :</h4></td>
											<td class="workDetailsclmndata">${workerData.address}</td>


										</tr>
										<tr class="tableRow ">
											<td class="mt-5"><h4 class="workDetailsclmn">Email Id :</h4></td>
											<td class="workDetailsclmndata">${workerData.email}</td>


										</tr>
										<tr class="tableRow">
											<td><h4 class="workDetailsclmn">Contact :</h4></td>
											<td class="workDetailsclmndata">&#43 &#57&#49 ${workerData.contact}</td>


										</tr>

										<tr class="tableRow">
											<td><h4 class="workDetailsclmn">Min. Price :</h4></td>
											<td class="workDetailsclmndata">${workerData.work_Price}&#8377</td>


										</tr>
									</table>
									<div class="container text-center">
										<div class="buttonA" id="button-3">
											<div id="circle"></div>
											<a id="Link" href="${pageContext.servletContext.contextPath}/User/serviceDataForm/${workerData.w_Id}"><strong>Active Service</strong></a>
										</div>

										<%-- 		<div class="buttonA" id="button-3">
											<div id="circle"></div>
											<a id="Link" href="${pageContext.servletContext.contextPath}"><strong>Active Service</strong></a>
										</div> --%>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>

			</div>
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



</body>

</html>