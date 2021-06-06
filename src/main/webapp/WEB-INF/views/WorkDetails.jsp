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
					<li class="active"><a href="${pageContext.servletContext.contextPath}/Worker/workerHomePage">Home</a></li>


					<li><a href="${pageContext.servletContext.contextPath}/logout">Log Out</a></li>
					<li><a href="${pageContext.servletContext.contextPath}/contact">Contact</a></li>
					<li><a href="${pageContext.servletContext.contextPath}/about">About Us</a></li>

				</ul>
			</nav>
			<!-- .nav-menu -->


		</div>

	</header>
	<!-- End Header -->



	<!-- ====modal for  accept request====== -->

	<!-- Modal -->
	<div class="modal fade" id="accept" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header  " style="background: linear-gradient(45deg, #212062, #0037ff61);">
					<div class="container text-center">
						<h5 class="modal-title text-white" id="exampleModalLongTitle">Fill the form</h5>
					</div>

					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="background: aliceblue">
					<div class="container text-center">

						<!-- ===form for update pic== -->


						<!-- money charges according to work, kb aayega ,kitne bje tk aayega,condition -->
						<form:form action="Worker/workerResponse" modelAttribute="workerResponse" cssClass="workerForm" method="POST" id="workerResponse">




							<input type="hidden" value="${pageContext.request.contextPath}" id="baseUrl">


							<div class="form-group">
								<label class="workerLabel" for=""><strong>Your working Date :</strong></label>
								<form:input path="date" type="date" cssClass="form-control inpt" id="date" placeholder="Enter your working date" cssStyle="color:#07a64c" />

								<span class="error_form " id="name_error_msg" style="margin-top: 2px"></span>
							</div>

							<div class="form-group">
								<label class="workerLabel" for=""><strong>Your working time :</strong></label>

								<form:select path="time" cssClass="custom-select form-control inpt" cssStyle="color:#07a64c" id="time" value="${workerAvailabilty.time }">
									<form:option disabled="true" value="none" label="When You Available : ">
									</form:option>
									<form:option value="8:00 AM-12:00 PM" label="8:00 AM-12:00 PM">
									</form:option>
									<form:option value="12:00 PM-5:00 PM" label="12:00 PM-5:00 PM">
									</form:option>
									<form:option value="5:00 PM-8:00 PM" label="5:00 PM-8:00 PM">
									</form:option>

								</form:select>



								<span class="error_form " id="contact_error_message" style="margin-top: 2px"></span>
							</div>


							<div class="form-group">
								<label class="workerLabel" for=""><strong>Your charges :</strong></label>
								<form:textarea path="charges" cssClass="form-control inpt" id="charges" placeholder="Charges for this work." />



							</div>

							<div class="form-group">
								<label class="workerLabel" for=""><strong>Extra charges :</strong></label>
								<form:textarea path="extraCharges" cssClass="form-control inpt" id="extracharges"
									placeholder="if there is other work related to it how much you charge for it?" />



							</div>


							<div class="form-group">
								<label class="workerLabel" for="exampleFormControlInput1"><strong>Work Condition :</strong></label>
								<form:textarea path="condition" cssClass="form-control inpt" id="condition" />



							</div>


							<div class="container text-center mt-4 mb-4">
								<button class="modelBtn" type="submit" id="upload-button">Upload</button>
							</div>





						</form:form>

						<!-- ===form for update pic== -->

						<div class="d-flex justify-content-center">
							<div class="spinner-grow" style="width: 3rem; height: 3rem; bottom: 50%; position: absolute; display: none;" role="status" id="spinner">

							</div>
						</div>

					</div>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- <!-- ==== end of modal for accept request====== -->





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
								<strong>Here Are The Work Details</strong>
							</h3>
						</div>
						<div class="hrLine"></div>


						<div class="row">

							<div class="col">
								<table class="mt-1 text-wrap" style="width: 100%">
									<tr class="tableRow">
										<td><h4 class="workDetailsclmn">Customer Name :</h4></td>
										<td class="workDetailsclmndata">${workDescriptionData.customer_Name}</td>


									</tr>
									<tr class="tableRow">
										<td><h4 class="workDetailsclmn">Customer Contact :</h4></td>
										<td class="workDetailsclmndata">${workDescriptionData.customer_contact}</td>


									</tr>

									<tr class="tableRow">
										<td><h4 class="workDetailsclmn">Customer Email :</h4></td>
										<td class="workDetailsclmndata">${workDescriptionData.user.email}</td>


									</tr>

							
								</table>

							</div>
							
							
							
							<div class="col">
								<table class="mt-1 text-wrap" style="width: 100%">
									<tr class="tableRow">
										<td><h4 class="workDetailsclmn">Work Location :</h4></td>
										<td class="workDetailsclmndata">${workDescriptionData.address}</td>


									</tr>
									<tr class="tableRow">
										<td><h4 class="workDetailsclmn">Work City :</h4></td>
										<td class="workDetailsclmndata">${workDescriptionData.user.city}</td>


									</tr>

									<tr class="tableRow">
										<td><h4 class="workDetailsclmn">Work Details :</h4></td>
										<td class="workDetailsclmndata">${workDescriptionData.work_Description}</td>


									</tr>

								
								</table>

							</div>
							
						</div>


				<%-- 		<div class="row mt-5 ml-5">

							<div class="col-lg-6 d-flex">
								<span class="mt-2"><strong><em>Customer Name :</em></strong></span>
								<h4 class="mt-2 ml-1" style="font-size: 21px">${workDescriptionData.customer_Name}</h4>
							</div>
							<div class="col-lg-6 d-flex">
								<span class="mt-2"><strong><em>Customer Contact :</em></strong> </span>
								<h4 class="mt-2 ml-1" style="font-size: 21px">${workDescriptionData.customer_contact}</h4>
							</div>

						</div>

						<div class="row mt-5 ml-5">

							<div class="col-lg-6 d-flex">
								<span class="mt-2"><strong><em>Customer Email :</em></strong></span>
								<h4 class="mt-2 ml-1" style="margin-left: 90%; font-size: 21px">${workDescriptionData.user.email}</h4>
							</div>
							<div class="col-lg-6 d-flex">
								<span class="mt-2"><strong><em>Work Location :</em></strong></span>
								<h4 class="mt-2 ml-1" style="font-size: 18px">${workDescriptionData.address}</h4>
							</div>

						</div>

						<div class="row mt-5 ml-5">

							<div class="col-lg-6 d-flex">


								<span class="mt-2"><strong><em>Work City :</em></strong> </span>
								<h4 class="mt-2 ml-1" style="font-size: 21px">${workDescriptionData.user.city}</h4>

							</div>


							<div class="col-lg-6 d-flex">


								<span class="mt-2"><strong><em>Work Details :</em></strong></span>
								<h4 class="mt-2 ml-1" style="font-size: 18px">${workDescriptionData.work_Description}</h4>

							</div>
						</div> --%>

					</div>

				</div>

				<div class="container text-center">


					<div class="p-2 ">
						<button class="completeBtn" data-toggle="modal" data-target="#accept" type="button" style="padding:;">Accept</button>

						<button class="completeBtn ml-2" onclick="rejectRequestByWorker(${workDetails.workData_Id})" type="button" style="padding:;">Reject</button>
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
					AB Street <br> Somewhere, <br> India <br> <br> <strong>Phone:</strong> 123567890 <br> <strong>Email:</strong>
					workersprovider24@gmail.com<br>
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