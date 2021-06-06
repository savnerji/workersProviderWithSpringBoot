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


<!-- <!-- <style type="text/css">
.reqCard {
	padding: 40px 30px;
	box-shadow: 0px 2px 15px rgb(0 0 0/ 15%);
	border-radius: 10px;
	background: #fff;
	transition: all ease-in-out 0.3s;
}

.reqCard:hover {
	background: #4124ab;
	color: white;
}

.reqCard:hover p {
	color: white;
}
</style> --> 

</head>
<body>


	<!-- ======= Header ======= -->
	<header id="header">
		<div class="container d-flex">

			<div class=" mr-auto">

				<div class="d-flex justify-content-start">



					
					<h5 class=" mt-2 ml-1 name" >${worker.w_Name }</h5>

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




	<div class="container">


		<c:choose>
			<c:when test="${not empty allRequests }">
				<div class="row mt-5">

					<c:forEach items="${allRequests }" var="request">


						<div class="col mt-4 text-center">


							<a href="${pageContext.servletContext.contextPath}/Worker/WorkDetails/${request.workData_Id}">

								<div class="card reqCard" style="width: auto;">
									<div class="card-body">
										<%-- <h5 class="card-title">${request.user.name }</h5>
										<h6 class="card-subtitle mb-2 text-muted">From indore</h6>
										<p class="card-text">mera sofa tut gya</p> --%>

										<h5 class="card-title text-uppercase">${request.user.name } </h5>
										
										<p class="card-subtitle mt-1"><span class="mr-1" style="font-size: 10px">From-</span> ${request.user.city } </p><br>
										<p class="card-text">${request.work_Description } </p> 
										

									</div>
								</div>
							</a>
						</div>

					</c:forEach>

				</div>
			</c:when>
			<c:otherwise>


			</c:otherwise>

		</c:choose>


	</div>

			<!-- ======= Footer ======= -->
		<footer id="footer" class="mt-5">



			<div class="footer-top ">
				<div class="container text-center">
			

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


	<%-- 
<%@include file="./CommonScripts.jsp"%><script src="<c:url value="/component/js/MyAnimation.js" />"></script>
 --%>
</body>
</html>