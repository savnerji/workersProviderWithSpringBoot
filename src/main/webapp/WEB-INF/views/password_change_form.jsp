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

<link rel="stylesheet" href=' <c:url value="/component/css/LogInSignUp.css" />' type="text/css">


</head>
<body   style="background: url('component/img/signInback.jpg'); background-repeat: no-repeat; background-position: center; background-size: cover;">

	<!-- Modal -->
	<div class=" mt-5" id="updateStatus" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header  " style="background: linear-gradient(45deg, #212062, #0037ff61);">
					<div class="container text-center">
						<h5 class="modal-title text-white">Update Your Password..</h5>
					</div>


				</div>
				<div class="modal-body" style="background: aliceblue">
					<div class="container text-center">





						<form action="update_password" method="POST" id="updatePasswordForm">
							<div class="form-group">
								<input id="frm_password" type="password" class="form-control" placeholder="New  password.." required> <span class="error_form "
									id="password_error_message" style="margin-top: 2px"></span>
							</div>
							<input type="hidden" value="${pageContext.request.contextPath}" id="baseUrl">



							<button type="submit" class="btn text-white" style="background: linear-gradient(45deg, #0037ff61, #212062);">SUBMIT</button>
						</form>

					</div>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>




	<%@include file="./CommonScripts.jsp"%>
	
<script src="<c:url value="/component/js/Ajax.js" />"></script>
	<script src="<c:url value="/component/js/MyJs.js" />"></script>
</body>
</html>