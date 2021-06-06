<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>${title}</title>
<meta content="" name="description">
<meta content="" name="keywords">





<%@include file="./CommonHeaderLinks.jsp"%>

<link rel="stylesheet" href=' <c:url value="/component/css/style.css" />' type="text/css">
<link rel="stylesheet" href=' <c:url value="/component/css/myCss.css" />' type="text/css">


</head>
<body
	style="background: url(<c:url value="/component/img/workDataBAck.jpg" />); background-repeat: no-repeat; background-position: center; background-size: cover;">
	<!-- ======= Header ======= -->
	<header id="header">
		<div class="container d-flex">

			<div class=" mr-auto">
				<h5 class=" mt-2 ml-1 name">${usr.name }</h5>

			</div>

			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li class="active"><a href="${pageContext.servletContext.contextPath}/User/UserHome">Home</a></li>

					<!-- <li><a href="#">About</a></li> -->

					<%-- <li class="drop-down"><a href="#">Services</a>

						<ul>
							<li><a href="${pageContext.servletContext.contextPath}/service/MECHANIC">MECHANIC</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/ELECTRICIAN">ELECTRICIAN</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/PLUMBING">PLUMBING</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/COOKING">COOKING</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/CARPENTER">CARPENTER</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/service/TUTOR">TUTOR</a></li>
						</ul></li> --%>

					<li><a href="${pageContext.servletContext.contextPath}/logout">Log Out</a></li>
					<!-- 	<li><a href="#">Contact</a></li>
					<li><a href="#">Team</a></li> -->

				</ul>
			</nav>
			<!-- .nav-menu -->

		</div>
	</header>
	<!-- End Header -->



	<div class="container text-center mt-4">
		<h3 style="text-shadow: gray;">
			<strong><em>Please Enter your work Details..</em></strong>
		</h3>
	</div>

	<div class="container mt-5">
		<c:url value="User/workDescription" var="sendRequest"></c:url>

		<form:form action="${sendRequest}" modelAttribute="WorkData" cssClass="workerForm" method="POST" id="workDescription">


			<%-- 			<form:hidden path="user" value="${user}" id="worker_id" />
			<form:hidden path="worker" value="${worker}" id="customer_id" /> --%>

			<input type="hidden" value="${pageContext.request.contextPath}" id="baseUrl">


			<div class="form-group">
				<label class="workerLabel" for=""><strong>Your Name :</strong></label>
				<form:input path="customer_Name" cssClass="form-control inpt" id="customer_Name" placeholder="Enter your name" cssStyle="color:#07a64c" />
				<form:errors path="customer_Name" cssClass="error"></form:errors>
				<span class="error_form " id="name_error_msg" style="margin-top: 2px"></span>
			</div>

			<div class="form-group">
				<label class="workerLabel" for=""><strong>Your Contact :</strong></label>
				<form:input path="customer_contact" cssClass="form-control inpt" id="customer_contact" placeholder="Enter your contact" cssStyle="color:#07a64c" />
				<form:errors path="customer_contact" cssClass="error"></form:errors>
				<span class="error_form " id="contact_error_message" style="margin-top: 2px"></span>
			</div>


			<div class="form-group">
				<label class="workerLabel" for=""><strong>Your Address :</strong></label> <small class="form-text text-muted">enter your complete
					Address..</small>
				<form:textarea path="address" cssClass="form-control inpt" id="customer_address" placeholder="like:A/20,COLONY,CITY" />
				<form:errors path="address" cssClass="error">
				</form:errors>

			</div>


			<div class="form-group">
				<label class="workerLabel" for="exampleFormControlInput1"><strong>Work Description :</strong></label>
				<form:textarea path="work_Description" cssClass="form-control inpt" id="work_Description" placeholder="enter tour complete work detail.." />
				<form:errors path="work_Description" cssClass="error">
				</form:errors>

			</div>


			<!-- <div class="container text-center mt-4 mb-4">
				<button type="submit" class="btn btn-outline-success">Book Worker</button>
			</div> -->

			<div class="p-2 container text-center">
				<button class="completeBtn" type="submit" style="padding: 4px; border: 1px solid #fff;">Book worker</button>
			</div>


		</form:form>


		<!-- <!-- <div>

			<i class="fa fa-spinner fa-spin" aria-hidden="true"
				style="font-size: 50px; position: absolute; left: 48%; justify-content: center; float: cent; top: 50%; bottom: 40%;"></i>
		</div> -->




		<div class="d-flex justify-content-center">
			<div class="spinner-grow" style="width: 3rem; height: 3rem; bottom: 50%; position: absolute; display: none;" role="status" id="spinner"></div>
		</div>

	</div>



	<%@include file="./CommonScripts.jsp"%>

	<script src="<c:url value="/component/js/Ajax.js" />"></script>
</body>
</html>