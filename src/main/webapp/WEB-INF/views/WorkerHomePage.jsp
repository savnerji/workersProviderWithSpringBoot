



<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Worker Provider</title>
<meta content="" name="description">
<meta content="" name="keywords">

<%@include file="./CommonHeaderLinks.jsp"%>

<link rel="stylesheet" href=' <c:url value="/component/css/myCss.css" />' type="text/css">





</head>

<body>


	<!-- this is for profile bar -->

	<div id="mySidebar" class="profilebar" style="background: #1f0542">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
		<div class="container text-center">
			<img alt="" src='<c:url value="/component/image/profilePics/${worker.profilePic}"></c:url>'
				style="height: 150px; width: 150px; border-radius: 50%; cursor: pointer;">
		</div>

		<div class="container mt-4">
			<a href="${pageContext.servletContext.contextPath}/Worker/WorkerEditProfile" style="font-size: 20px"> <i class=" fa fa-group text-white"
				aria-hidden="true" style="font-size: 16px"></i> Edit Profile.
			</a> <a href="!#" data-toggle="modal" data-target="#picUpload" style="font-size: 20px"><i class="fa fa-camera-retro text-white " aria-hidden="true"
				style="font-size: 16px"></i> Edit Profile Pic.</a>
			<c:choose>
				<c:when test="${not empty workerStatusData }">
					<a data-toggle="modal" data-target="#updateStatus" href="#" style="font-size: 20px">Update Availability Status.</a>
				</c:when>
				<c:otherwise>
					<a data-toggle="modal" data-target="#addStatus" href="#" style="font-size: 20px">Add Availability Status.</a>

				</c:otherwise>

			</c:choose>




		</div>

	</div>


	<!-- ====modal for pic upload====== -->

	<!-- Modal -->
	<div class="modal fade" id="picUpload" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header  " style="background: linear-gradient(45deg, #212062, #0037ff61);">
					<div class="container text-center">
						<h5 class="modal-title text-white" id="exampleModalLongTitle">Update Your Pic</h5>
					</div>

					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="background: aliceblue">
					<div class="container text-center">
						<img alt="" src='<c:url value="/component/image/profilePics/${worker.profilePic}"/>'
							style="height: 150px; width: 150px; border-radius: 50%; cursor: pointer;">

						<!-- ===form for update pic== -->

						<form:form action="Worker/updatePic" class="mt-4" enctype="multipart/form-data" method="POST" id="fileForm">
							<div class="input-group mb-3">

								<div class="custom-file">
									<input type="file" class="custom-file-input" id="profilePic" name="profilePic"> <label class="custom-file-label"
										for="inputGroupFile01">Choose file</label>
								</div>
								<input type="hidden" value="${pageContext.request.contextPath}" id="baseUrl">
							</div>

							<button class="modelBtn" type="submit" id="upload-button">Upload</button>

						</form:form>
						<!-- ===form for update pic== -->
					</div>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- <!-- ====modal for pic upload====== -->


	<!-- ====modal for status upload====== -->

	<!-- Modal -->
	<div class="modal fade" id="updateStatus" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header  " style="background: linear-gradient(45deg, #212062, #0037ff61);">
					<div class="container text-center">
						<h5 class="modal-title text-white">Update Your Availability Status</h5>
					</div>

					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="background: aliceblue">
					<div class="container text-center">


						<!-- ===form for update availability status == -->

						<form:form action="Worker/updateStatus" class="mt-4" method="POST" modelAttribute="workerStatus" id="updateStatusFrm">


							<%-- <form:hidden path="status_id"/> --%>



							<div class="form-group">
								<label class="" for="functionType">Are You Available : </label>
								<form:select path="status" cssClass="custom-select form-control inpt" cssStyle="color:#07a64c" id="updatedStatus">
									<form:option disabled="true" value="none" label="Are You Available : ">
									</form:option>
									<form:option value="Available" label="Available">
									</form:option>
									<form:option value="Not Available" label="Not Available">
									</form:option>

								</form:select>
							</div>

							<div class="form-group">
								<label class="" for="functionType">Work Time : </label>
								<form:select path="time" cssClass="custom-select form-control inpt" cssStyle="color:#07a64c" id="updatedTime">
									<form:option disabled="true" value="none" label="When You Available : ">
									</form:option>
									<form:option value="8:00 AM-12:00 PM" label="8:00 AM-12:00 PM">
									</form:option>
									<form:option value="12:00 PM-5:00 PM" label="12:00 PM-5:00 PM">
									</form:option>
									<form:option value="5:00 PM-8:00 PM" label="5:00 PM-8:00 PM">
									</form:option>

								</form:select>
							</div>

							<input type="hidden" value="${pageContext.request.contextPath}" id="baseUrl">

							<button class="modelBtn" type="submit" id="upload-button">Upload</button>

						</form:form>
						<!-- ===form for update pic== -->
					</div>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- <!-- ====modal for status upload====== -->



	<!-- ====modal for save status update====== -->

	<!-- Modal -->
	<div class="modal fade" id="addStatus" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header  " style="background: linear-gradient(45deg, #212062, #0037ff61);">
					<div class="container text-center">
						<h5 class="modal-title text-white">Update Your Availability Status</h5>
					</div>

					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="background: aliceblue">
					<div class="container text-center">


						<!-- ===form for update availability status == -->

						<form:form action="Worker/addStatus" class="mt-4" method="POST" modelAttribute="workerStatus" id="addStatusFrm">

							<div class="form-group">
								<label class="" for="functionType">Are You Available : </label>
								<form:select path="status" cssClass="custom-select form-control inpt" cssStyle="color:#07a64c" id="status">
									<form:option disabled="true" value="none" label="Are You Available : ">
									</form:option>
									<form:option value="Available" label="Available">
									</form:option>
									<form:option value="Not Available" label="Not Available">
									</form:option>

								</form:select>
							</div>


							<div class="form-group">
								<label class="" for="functionType">Work Time : </label>
								<form:select path="time" cssClass="custom-select form-control inpt" cssStyle="color:#07a64c" id="time">
									<form:option disabled="true" value="none" label="When You Available : ">
									</form:option>
									<form:option value="8:00 AM-12:00 PM" label="8:00 AM-12:00 PM">
									</form:option>
									<form:option value="12:00 PM-5:00 PM" label="12:00 PM-5:00 PM">
									</form:option>
									<form:option value="5:00 PM-8:00 PM" label="5:00 PM-8:00 PM">
									</form:option>

								</form:select>
							</div>

							<input type="hidden" value="${pageContext.request.contextPath}" id="baseUrl">
							<button class="modelBtn" type="submit" id="upload-button">Upload</button>

						</form:form>
						<!-- ===form for update pic== -->
					</div>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- <!-- ====modal for save status update====== -->





	<!-- ====modal for notification bell====== -->

	<!-- Modal -->
	<div class="modal fade" id="notifications" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header  " style="background: linear-gradient(45deg, #212062, #0037ff61);">
					<div class="container text-center">

						<c:choose>
							<c:when test="${not empty requests}">
								<h5 class="modal-title text-white">Hey ${worker.w_Name} you got some Work..</h5>
							</c:when>
							<c:otherwise>
								<h5 class="modal-title text-white">You don't have any request now.</h5>
							</c:otherwise>
						</c:choose>


					</div>

					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="background: aliceblue">
					<div class="container text-center">

						<c:choose>
							<c:when test="${not empty requests}">

								<c:forEach begin="0" end="2" items="${requests }" var="request">

									<a href="${pageContext.servletContext.contextPath}/Worker/WorkDetails/${request.workData_Id}">
										<div class="card notifyCard mt-2" style="">
											<div class="card-body">


												<div class="container-fluid">
													<h5>Work from ${request.customer_Name}</h5>
												</div>




											</div>



										</div>
									</a>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<h5 class="container text-center"></h5>
							</c:otherwise>
						</c:choose>





					</div>


					<c:choose>
						<c:when test="${not empty requests}">
							<div class="container text-center">

								<div class=" text-center mt-3">
									<!-- <a href="#" class="modelBtn" id="upload-button">More</a> -->
									<a href="${pageContext.servletContext.contextPath}/Worker/all_requests" id="notifybtn" class="btn mybuttons" role="button"
										aria-disabled="true">Show More </a>
								</div>


							</div>

						</c:when>
						<c:otherwise>

							<div class="container text-center ">

								<div class=" text-center mt-3">
									<!-- <a href="#" class="modelBtn" id="upload-button">More</a> -->
									<a href="${pageContext.servletContext.contextPath}/Worker/workerHomePage" id="notifybtn" class="btn mybuttons" role="button"
										aria-disabled="true">Go Back </a>
								</div>


							</div>
						</c:otherwise>
					</c:choose>




				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- <!-- ====modal for notification bell====== -->


	<!-- main area of the page -->


	<div id="main">

		<!-- ======= Header ======= -->
		<header id="header">
			<div class="container d-flex">

				<div class=" mr-auto">

					<div class="d-flex justify-content-start">

						<i class="fa fa-bars mt-2 mr-3" aria-hidden="true" onclick="openNav()" style="font-size: 36px; cursor: pointer;"></i>


						<h5 class=" mt-2 ml-1 name" >${worker.w_Name }</h5>

					</div>
				</div>

				<nav class="nav-menu d-none d-lg-block">
					<ul>
						<li class="active"><a href="${pageContext.servletContext.contextPath}/Worker/workerHomePage">Home</a></li>


						<li><a href="${pageContext.servletContext.contextPath}/logout">Log Out</a></li>
						<li><a href="${pageContext.servletContext.contextPath}/contact">Contact</a></li>
						<li><a href="${pageContext.servletContext.contextPath}/about">About Us</a></li>
						<li><a href="#" data-toggle="modal" data-target="#notifications"><i class="fa fa-bell bellIcon  " style="font-size: 23px"><span
									class="ml-1 notificationbellCount text-white">${requestsCounts}</span></i> </a></li>
					</ul>
				</nav>
				<!-- .nav-menu -->


			</div>

		</header>
		<!-- End Header -->

		<!-- ======= Hero Section ======= -->
		<section id="hero" class="card-img-overlay"
			style="background: linear-gradient(0deg, rgb(0 55 255/ 47%), rgb(0 0 0/ 22%)), url(<c:url value="/component/img/workerset3.jpg" />); background-repeat: no-repeat; background-position:; background-size: cover; opacity: 0.6;">

			<div class="carousel-container">
				<div class="carousel-content">
					<h2 class="animate__animated animate__fadeInDown text-white">
						Welcome <span style="color: #2900bd;">Worker</span>
					</h2>
					<p class="animate__animated animate__fadeInUp text-white" style="font-size: 1em">We Are available for your emergencies household works like
						plumbing,carpentry and so on..</p>

				</div>
			</div>
		</section>
		<!-- End Hero -->

		<main id="main">

			<!-- ======= Featured Section ======= -->
			<section id="featured" class="featured">
				<div class="container">



					<div class="container d-flex justify-content-center">


						<div class="row">
							<div class="col-lg-6 col-sm-12 col-xs-6 mt-4">
								<div class="icon-box" style="height: auto">
									<!-- <i class="icofont-computer"></i> -->
									<h3 class="text-center h3">You can Add Your Availability Status.</h3>
									<p style="position: relative;">You can Add your Availability status for services.If you are not adding your Availability status than
										Customers doesn't find you and you are not getting the work.</p>
								</div>
							</div>

							<div class="col-lg-6 col-sm-12 col-xs-6 mt-4">
								<div class="icon-box" style="height: auto">
									<!-- <i class="icofont-computer"></i> -->
									<h3 class="text-center h3">You also Update Your Availability Status.</h3>
									<p>If you already add your Availability status than you can easily make it available or not available by your choice.</p>
								</div>
							</div>

						</div>



					</div>

				</div>
			</section>
			<!-- End Featured Section -->

			<!-- ======= About Section ======= -->
			<section id="about" class="about">
				<div class="container">

					<div class="row">
						<div class="col-lg-6">
							<img src='<c:url value="/component/img/home2.jpeg"></c:url>' class="img-fluid" alt="" style="height: auto;">
						</div>
						<div class="col-lg-6 pt-4 pt-lg-0 content">
							<h3>We have solution for your all household Problems..</h3>
							<p class="font-italic">
								<em>WE HAVE COMPLETE MAINTENANCE AND REPAIRING SOLUTIONS..</em>
							</p>
							<ul>
								<li>
									<!-- <i class="icofont-check-circled"></i> -->Service Provider is a platform to provide solution to all maintainance and servicing works at
									your homes and offices quickly, proffesionally and conveniently. We commit you not to bring any sort of unproffesionalism. We promise you to
									provide good service and trust to your doorsteps. We deliever your work by verified and qualified proffesionals only. We provide services of
									Plumber, Electrician, Painter, Carpenter,.................


								</li>


							</ul>
							<p>We pride ourselves on understanding our clients concerns and supplying the friendliest, most approachable and most conscientious service
								in Indore.</p>
						</div>
					</div>

				</div>
			</section>
			<!-- End About Section -->


			<!-- ======= why as Section ======= -->
			<section id="about" class="about">
				<div class="container">

					<div class="row">

						<div class="col-lg-6 pt-4 pt-lg-0 content">
							<h3>Why Choose us...</h3>
							<p class="text-break">Customer satisfaction is our paramount goal. We always meet and exceed customers satisfaction by providing the
								highest quality service and products, coupled with continuous communication to each of our customers. We are determined on satisfying and
								retaining our Clients who understand and value the element of time saving which has positive effect on repeat business with them. We strongly
								believe that good services can only be delivered with the qualified manpower, right attitude and teamwork.</p>


							<p class="font-italic">The Mission is to build on our reputation for integrity, excellence, experience and leadership as the nation's
								finest Construction, Maintenance and Repairing Solution organization by:
							<p>
							<ul>
								<li><i class="icofont-check-circled"></i> Professional and Experience Staffs Giving Proper Estimate.</li>
								<li><i class="icofont-check-circled"></i> On-Time Work Finish Transparency In Billing.</li>
								<li><i class="icofont-check-circled"></i> Background Verified All Our workers Maintaining our dedication.</li>
								<li><i class="icofont-check-circled"></i> Constantly striving to exceed expectations.</li>
								<li><i class="icofont-check-circled"></i> Constantly improving the quality of our work</li>
							</ul>
						</div>
						<div class="col-lg-6">

							<div class="container text-center">
								<img src='<c:url value="/component/img/about.jpg" ></c:url>' class="img-fluid" alt="" style="max-width: 100%; max-height: 600px;">
							</div>


						</div>
					</div>

				</div>
			</section>
			<!-- End why us Section -->



		</main>
		<!-- End #main -->

		<!-- ======= Footer ======= -->
		<footer id="footer">



			<div class="footer-top ">
				<div class="container text-center">
					<!-- 	<div class="row">

						<div class="col-lg-8 col-md-6 footer-links  ">
							<h4>Useful Links</h4>

							<ul>
								<li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
								<li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
								<li><i class="bx bx-chevron-right"></i> <a href="#">Contact</a></li>

							</ul>

						</div>

						<div class="col-lg-4 col-md-6 footer-links  ">
							<h4>Useful Links</h4>
							<ul>
								<li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
								<li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
								<li><i class="bx bx-chevron-right"></i> <a href="#">Contact</a></li>
								
							</ul>
						</div>

						<div class="col-lg-4 col-md-6 footer-contact">
							<h4>Contact Us</h4>
							<p>
								AB Street <br> Somewhere, <br> India <br> <br> <strong>Phone:</strong> 123567890 <br> <strong>Email:</strong>
								email@example.com<br>
							</p>

						</div>
					</div> -->

					<h4 class="display-1">
						<strong><em>Contact Us</em></strong>
					</h4>
					<p>
						AB Street <br> Somewhere, <br> India <br> <br> <strong>Phone:</strong> 123567890 <br> <strong>Email:</strong>
						workersprovider24@gmail.com<br>
					</p>
				</div>
			</div>


		</footer>
		<!-- End Footer -->


	</div>
	<!-- <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a> -->

	<%@include file="./CommonScripts.jsp"%><script src="<c:url value="/component/js/MyAnimation.js" />"></script>
	<script src="<c:url value="/component/js/WorkerJs.js" />"></script>
	<script src="<c:url value="/component/js/Ajax.js" />"></script>




</body>

</html>