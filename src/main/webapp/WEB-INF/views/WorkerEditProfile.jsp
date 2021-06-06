


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>${title }</title>
<meta content="" name="description">
<meta content="" name="keywords">

<%@include file="./CommonHeaderLinks.jsp"%>

<link rel="stylesheet" href=' <c:url value="/component/css/LogInSignUp.css" />' type="text/css">


</head>

<body
	style="background: url(<c:url value="/component/img/workerbackground.jpg" />); background-repeat: no-repeat; background-position: center; background-size: cover;">
	<!-- ======= Header ======= -->
	<header id="header">
		<div class="container d-flex">

			<div class=" mr-auto">
				<h5 class=" mt-2 ml-1 name" >${worker.w_Name }</h5>
			</div>
			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li class="active"><a href="${pageContext.servletContext.contextPath}/Worker/workerHomePage">Home</a></li>
				</ul>
			</nav>
			<!-- .nav-menu -->
		</div>
	</header>




	<div class="container mt-5">

		<div class="container text-center">
			<h4 style="color: #b04507; text-shadow: 2px 2px #000000;">
				<strong><em>Update Your Data. </em></strong>
			</h4>
		</div>
		<c:url value="Worker/updateWorkerData<%-- /${worker.aadharCardPic }/${ worker.profilePic }/${worker.w_Id} --%>" var="update"></c:url>

		<form:form action="${update }" modelAttribute="Worker" cssClass="workerForm" enctype="multipart/form-data" method="POST" id="workerUpdateForm">
			<input type="hidden" value="${pageContext.request.contextPath}" id="baseUrl">

			<form:hidden path="W_Id" value="${worker.w_Id}" id="workerID" />
			<form:hidden path="role" value="${worker.role }" id="role" />
			<form:hidden path="aadharCardNomber" value="${worker.aadharCardNomber }" id="aadharNumber" />
			<form:hidden path="aadharCardPic" value="${worker.profilePic }" id="aadharPic" />
			<form:hidden path="profilePic" value="${worker.profilePic }" id="profilePic" />

			<div class="form-group">
				<label class="workerLabel" for="exampleFormControlInput1">Worker Name :</label>
				<form:input path="w_Name" cssClass="form-control inpt" id="frmName" placeholder="Enter your name" cssStyle="color:#07a64c"
					value="${worker.w_Name }" />
				<form:errors path="w_Name" cssClass="error"></form:errors>
				<span class="error_form " id="name_error_msg" style="margin-top: 2px"></span>
			</div>

			<div class="form-group">
				<label class="workerLabel" for="exampleFormControlInput1">Worker city :</label>
				<form:input path="city" cssClass="form-control inpt" id="frmCity" placeholder="Enter your City" cssStyle="color:#07a64c" value="${worker.city }" />
				<form:errors path="city" cssClass="error"></form:errors>
				<span class="error_form " id="city_error_message" style="margin-top: 2px"></span>
			</div>

			<div class="form-group">
				<label class="workerLabel" for="exampleFormControlInput1">Worker Address :</label>
				<form:input path="address" cssClass="form-control inpt" id="frmAddress" placeholder="Enter your address" cssStyle="color:#07a64c"
					value="${worker.address }" />
				<form:errors path="address" cssClass="error"></form:errors>
				<span class="error_form " id="address_error_message" style="margin-top: 2px"></span>
			</div>

			<div class="form-group">
				<label class="workerLabel" for="exampleFormControlInput1">Worker Contact :</label>
				<form:input path="contact" cssClass="form-control inpt" id="frmContact" placeholder="Enter your contact" cssStyle="color:#07a64c"
					value="${worker.contact }" />
				<form:errors path="contact" cssClass="error"></form:errors>
				<span class="error_form " id="contact_error_message" style="margin-top: 2px"></span>
			</div>

			<div class="form-group">
				<label class="workerLabel" for="functionType">Work Type : </label>
				<form:select path="work_Type" cssClass="custom-select form-control inpt" cssStyle="color:#07a64c" id="type">
					<form:option disabled="true" value="none" label="Select Work Type">
					</form:option>
					<form:option value="Plumber" label="Plumber">
					</form:option>
					<form:option value="Carpenter" label="Carpenter">
					</form:option>
					<form:option value="Electrician" label="Electrician">
					</form:option>
					<form:option value="Tutor" label="Tutor">
					</form:option>
					<form:option value="Mechanic" label="Mechanic">
					</form:option>
					<form:option value="Cooking" label="Cooking">
					</form:option>
				</form:select>
			</div>


			<div class="form-group">
				<label class="workerLabel" for="exampleFormControlInput1">Worker Email :</label>
				<form:input path="email" cssClass="form-control inpt" id="frm_email" placeholder="Enter your Email" cssStyle="color:#07a64c"
					value="${worker.email }" />
				<form:errors path="email" cssClass="error"></form:errors>
				<span class="error_form " id="email_error_message" style="margin-top: 2px"></span>
			</div>

			<%-- <div class="form-group">
				<label class="workerLabel" for="exampleFormControlInput1">Worker AadharCard Nomber :</label>
				<form:input path="aadharCardNomber" cssClass="form-control inpt" id="frmAadharNomber" placeholder="Enter your Aadhar card Nomber"
					cssStyle="color:#07a64c" value="${worker.aadharCardNomber }" />
				<form:errors path="aadharCardNomber" cssClass="error"></form:errors>
				<span class="error_form " id="Addhar_Nomber_error_message" style="margin-top: 2px"></span>
			</div> --%>

			<div class="form-group">
				<label class="workerLabel" for="exampleFormControlInput1">Worker work Price :</label>
				<form:input path="work_Price" cssClass="form-control inpt" id="frmPrice" placeholder="Enter your Price" cssStyle="color:#07a64c"
					value="${worker.work_Price }" />
				<form:errors path="work_Price" cssClass="error"></form:errors>
				<span class="error_form " id="price_error_message" style="margin-top: 2px"></span>
			</div>


			<%-- <div class="form-group">
				<label class="workerLabel" for="exampleFormControlInput1">Worker Password :</label>
				<form:input path="password" cssClass="form-control inpt" id="frm_password" placeholder="Enter your Password" cssStyle="color:#07a64c"
					value="${worker.password }" />
				<form:errors path="password" cssClass="error"></form:errors>
				<span class="error_form " id="password_error_message" style="margin-top: 2px"></span>
			</div> --%>


			<input type="hidden" name="password" value="${worker.password }" id="frm_password">

			<div class="row mt-4">
				<%-- <div class="col ">
					<div class="custom-file form-group">
						<!-- <label for="exampleFormControlInput1">Worker Pic :</label> -->
						<input type="file" name="profilePic" class="custom-file-input "
							id="customFile" value="${worker.profilePic }"> <label class="custom-file-label inpt"
							for="customFile" >Choose Profile Pic</label>
					</div>
				</div> --%>

				<!-- <div class="col-md-6">
					<div class="custom-file form-group">
						<label for="exampleFormControlInput1">Aadhar Card  Pic :</label>
						<input type="file" name="aadharCardPic" class="custom-file-input "
							id="customFile" > <label class="custom-file-label inpt"
							for="customFile">Choose Aadhar Card Pic</label>
					</div>
				</div>  -->
			</div>


			<div class="container text-center mt-4 mb-4">
				<button type="submit" class="btn btn-outline-success">Update</button>
			</div>




		</form:form>
	</div>


	<%@include file="./CommonScripts.jsp"%>
	<script src="<c:url value="/component/js/WorkerJs.js" />"></script>
	<script src="<c:url value="/component/js/Ajax.js" />"></script>

</body>

</html>