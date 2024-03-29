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
	style="background: url('component/img/workerbackground.jpg'); background-repeat: no-repeat; background-position: center; background-size: cover;">
	<!-- ======= Header ======= -->
	<header id="header">
		<div class="container d-flex">

				<div class=" mr-auto mt-3">
				<img class="img-fluid logo" alt="logo" src='<c:url value="component/img/logo/logo.png"></c:url>' >

			</div>
			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li class="active"><a href="${pageContext.servletContext.contextPath}/home">Home</a></li>
				</ul>
			</nav>
			<!-- .nav-menu -->
		</div>
	</header>




	<div class="container mt-5">
	
	<div class="container text-center">
	<h3 style="color: #a30321">${msg}</h3>
	</div>
	
	
		<form:form action="workerSignUP" modelAttribute="Worker" cssClass="workerForm" enctype="multipart/form-data" method="POST">
			<div class="form-group">
				<label class="workerLabel" for="exampleFormControlInput1">Worker Name :</label>
				<form:input path="w_Name" cssClass="form-control inpt" id="frmName" placeholder="Enter your name" cssStyle="color:#07a64c" />
				<form:errors path="w_Name" cssClass="error"></form:errors>
				<span class="error_form " id="name_error_msg" style="margin-top: 2px"></span>
			</div>

			<div class="form-group">
				<label class="workerLabel" for="exampleFormControlInput1">Worker city :</label>
				<form:input path="city" cssClass="form-control inpt" id="frmCity" placeholder="Enter your City" cssStyle="color:#07a64c" />
				<form:errors path="city" cssClass="error"></form:errors>
				<span class="error_form " id="city_error_message" style="margin-top: 2px"></span>
			</div>

			<div class="form-group">
				<label class="workerLabel" for="exampleFormControlInput1">Worker Address :</label>
				<form:input path="address" cssClass="form-control inpt" id="frmAddress" placeholder="Enter your address" cssStyle="color:#07a64c" />
				<form:errors path="address" cssClass="error"></form:errors>
				<span class="error_form " id="address_error_message" style="margin-top: 2px"></span>
			</div>

			<div class="form-group">
				<label class="workerLabel" for="exampleFormControlInput1">Worker Contact :</label>
				<form:input path="contact" cssClass="form-control inpt" id="frmContact" placeholder="Enter your contact" cssStyle="color:#07a64c" />
				<form:errors path="contact" cssClass="error"></form:errors>
				<span class="error_form " id="contact_error_message" style="margin-top: 2px"></span>
			</div>

			<div class="form-group">
				<label class="workerLabel" for="functionType">Work Type : </label>
				<form:select path="work_Type" cssClass="custom-select form-control inpt" cssStyle="color:#07a64c">
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
				<form:input path="email" cssClass="form-control inpt" id="frm_email" placeholder="Enter your Email" cssStyle="color:#07a64c" />
				<form:errors path="email" cssClass="error"></form:errors>
				<span class="error_form " id="email_error_message" style="margin-top: 2px"></span>
			</div>

			<div class="form-group">
				<label class="workerLabel" for="exampleFormControlInput1">Worker AadharCard Nomber :</label>
				<form:input path="aadharCardNomber" cssClass="form-control inpt" id="frmAadharNomber" placeholder="Enter your Aadhar card Nomber"
					cssStyle="color:#07a64c" />
				<form:errors path="aadharCardNomber" cssClass="error"></form:errors>
				<span class="error_form " id="Addhar_Nomber_error_message" style="margin-top: 2px"></span>
			</div>

			<div class="form-group">
				<label class="workerLabel" for="exampleFormControlInput1">Worker work Price :</label>
				<form:input path="work_Price" cssClass="form-control inpt" id="frmPrice" placeholder="Enter your minimum Price" cssStyle="color:#07a64c" />
				<form:errors path="work_Price" cssClass="error"></form:errors>
				<span class="error_form " id="price_error_message" style="margin-top: 2px"></span>
			</div>


			<div class="form-group">
				<label class="workerLabel" for="exampleFormControlInput1">Worker Password :</label>
				<form:input type="password" path="password" cssClass="form-control inpt" id="frm_password" placeholder="Enter your Password" cssStyle="color:#07a64c" />
				<span  class="fa fa-fw fa-eye eyeIcon" id="eye-icon" onclick="passwordIconTogller()"  aria-hidden="true" style="color:#310303;font-size:20px"></span>
				<form:errors path="password" cssClass="error" style="margin-left: -22px;"></form:errors>
				<span class="error_form " id="password_error_message" style="margin-top: 2px"></span>
			</div>

			<form:hidden path="role" value="ROLE_WORKER" />

			<div class="row mt-4">
				<div class="col-md-6 ">
					<div class="custom-file form-group">
						<!-- <label for="exampleFormControlInput1">Worker Pic :</label> -->
						<input type="file" name="pic" class="custom-file-input " id="customFile"> <label class="custom-file-label inpt" for="customFile">Choose
							Profile Pic</label>
					</div>
				</div>
				<div class="col-md-6">
					<div class="custom-file form-group">
						<!-- <label for="exampleFormControlInput1">Aadhar Card  Pic :</label> -->
						<input type="file" name="aadhar" class="custom-file-input " id="customFile"> <label class="custom-file-label inpt"
							for="customFile">Choose Aadhar Card Pic</label>
					</div>
				</div>
			</div>


			<div class="container text-center mt-4 mb-4">
				<button class="btn btn-outline-light " type="submit" style="color:#560cc4">Register</button>
			</div>




		</form:form>
	</div>


	<%@include file="./CommonScripts.jsp"%>
<script src="<c:url value="/component/js/MyJs.js" />"></script>
	<script src="<c:url value="/component/js/WorkerJs.js" />"></script>

</body>

</html>