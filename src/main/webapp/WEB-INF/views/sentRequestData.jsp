<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>${title }</title>
<meta content="" name="description">
<meta content="" name="keywords">

<%@include file="./CommonHeaderLinks.jsp"%>

<link rel="stylesheet" href=' <c:url value="/component/css/myCss.css" />' type="text/css">


<style type="text/css">
</style>

</head>
<body>


	<!-- ======= Header ======= -->
	<header id="header">
		<div class="container d-flex">

			<div class=" mr-auto">

				<div class="d-flex justify-content-start">



					<h5 class=" mt-2 ml-1 name">${worker.w_Name }</h5>

				</div>
			</div>

			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li class="active"><a href="${pageContext.servletContext.contextPath}/User/UserHome">Home</a></li>


					<li><a href="${pageContext.servletContext.contextPath}/logout">Log Out</a></li>
					<li><a href="${pageContext.servletContext.contextPath}/contact">Contact</a></li>
					<li><a href="${pageContext.servletContext.contextPath}/about">About Us</a></li>

				</ul>
			</nav>
			<!-- .nav-menu -->


		</div>

	</header>
	<!-- End Header -->






	<!-- here he can accept or reject the requests -->
	<div class="container ">

		<div class="conatainer mt-5">

			<div class="card reqDataCard" style="">
				<div class="card-body">
					<!-- <h5 class="card-title">From vaibhav</h5>
					<h6 class="card-subtitle mb-2 text-muted">From indore</h6>
					<p class="card-text">mera sofa tut gya</p> -->

					<div class="container ">



						<div class="container text-center d-d-flex justify-content-center"">

							<h3 class="mb-2">
								<strong>Your Booked Worker</strong>


							</h3>
							<p>
								<c:choose>
									<c:when test="${data.charges == null}">
										<strong style="color: red">If worker not accept your request then your total price in this list is 0.</strong>
									</c:when>
								</c:choose>
							</p>
						</div>
						<div class="hrLine"></div>



						<div class="row">
							<div class="col-lg-5 col-md-5">
								<div class="container text-center">
									<img class="mb-1 img-fluid" alt="" src='<c:url value="/component/image/profilePics/${data.worker.profilePic}"></c:url>' style="height: auto; border-radius: 60%; width: auto; cursor: pointer;">
								</div>
							</div>

							<div class="col-lg-7 col-md-7">




								<div class="row mt-4 ml-3">



									<table class="mt-1 text-wrap" style="width: 100%">
										<tr class="tableRow">
											<td><h4 class="detailsclmn">City :</h4></td>
											<td class="detailsclmndata">${data.worker.city}</td>


										</tr>
										<tr class="tableRow">
											<td><h4 class="detailsclmn">Address :</h4></td>
											<td class="detailsclmndata">${data.worker.address}</td>


										</tr>

										<tr class="tableRow">
											<td><h4 class="detailsclmn">Contact :</h4></td>
											<td class="detailsclmndata">&#43 &#57&#49 ${data.worker.contact}</td>


										</tr>

										<tr class="tableRow">
											<td><h4 class="detailsclmn">Total Price :</h4></td>

											<c:choose>
												<c:when test="${data.charges == null}">
													<td class="detailsclmndata">0 &#8377</td>
												</c:when>
												<c:otherwise>
												<td class="detailsclmndata">${data.charges }&#8377</td>
												</c:otherwise>
											</c:choose>

											


										</tr>
									</table>


								</div>


							</div>
						</div>






					</div>

				</div>

				<div class="container text-center">


					<div class="p-2 ">
						<button class="completeBtn" onclick="updateWorkStatus(${data.workData_Id})" type="button" style="padding: 4px; border: 1px solid #e6573f;">Complete Work</button>


					</div>


					<!-- <div class="p-2 ">
						
					</div> -->

					<%-- 	<a href="#" data-toggle="modal" data-target="#accept">Accept</a>
					<!-- when click accept a pop up falsh and there is a form for put money charges -->
					<a href="#" class="ml-3" onclick="rejectRequestByWorker(${workDetails.workData_Id})">Reject</a> --%>


				</div>

			</div>

		</div>




	</div>


	<div class="d-flex justify-content-center">
		<div class="spinner-grow" style="width: 3rem; height: 3rem; bottom: 50%; position: absolute; display: none;" role="status" id="rejectSpinner"></div>
	</div>


	</div>

	<!-- ======= Footer ======= -->
	<footer id="footer" class="mt-5">



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
					AB Street <br> Somewhere, <br> India <br> <br> <strong>Phone:</strong> 123567890 <br> <strong>Email:</strong> workersprovider24@gmail.com<br>
				</p>
			</div>
		</div>


	</footer>
	<!-- End Footer -->






	<%@include file="./CommonScripts.jsp"%>
	<script src="<c:url value="/component/js/Ajax.js" />"></script>
	<script src="<c:url value="/component/js/MyJs.js" />"></script>
</body>
</html>