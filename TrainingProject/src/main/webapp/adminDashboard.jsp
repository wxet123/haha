<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <%@page import="com.team2.DAO.LoginDAO"%>
 <%@page import="com.team2.DAO.EmployeeDAO"%>
  <%@page import="com.team2.model.Login"%>
  <%@page import="com.team2.model.Employee"%>
<%@ taglib prefix ="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="HandheldFriendly" content="true">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous">
	
</script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="adminDashboard.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" />
<!-- Google Fonts -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" />
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="css/adminDashboard.css" />
<link rel="shortcut icon" href="images/ELearningFavicon.png"
	type="image/x-icon">

<!-- JQuery -->

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Bootstrap tooltips -->

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js">
	
</script>

<!-- Bootstrap core JavaScript -->

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- MDB core JavaScript -->

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>

<title>E-Learning</title>
</head>

<body>


	<%
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");

	if (session.getAttribute("username") == null) {
		response.sendRedirect("login.jsp");
	
	}

	%>



	<!--Navbar -->
	<nav class="mb-1 navbar navbar-expand-lg navbar-dark">
		<a href="dashboard.jsp"> <img src="images/ELearningIcon.png"
			width="40px">
		</a> <a class="navbar-brand" href="adminDashboard.jsp">E - Learning</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent-555"
			aria-controls="navbarSupportedContent-555" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent-555">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link mr-5"
					href="adminDashboard.jsp"> Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link mr-5" href="#">About</a>
				</li>
				
				<li class="nav-item dropdown">
				
				<a class="nav-link"
					id="navbarDropdownMenuLink-333" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"><span style="font-weight: 300; margin-right:10px;"> Welcome back <em>${username}</em></span> <i
						class="fas fa-user-circle fa-lg"></i>
				</a>
				
					<div class="dropdown-menu dropdown-menu-right dropdown-default"
						aria-labelledby="navbarDropdownMenuLink-333">
						<a class="dropdown-item" href="#">Account Setting</a>
						
						<form action="Logout" method="post" >
							<input type="submit"   class="dropdown-item log-out" value="Logout">
						</form>
					</div></li>
			</ul>
		</div>
	</nav>
	<!--/.Navbar -->

	<!-- DashBoard -->
	<section class="dashboard-item">
		<div class="container">
			<div class="row">
				<div class="col-6">
					<div class="card px-md-5 py-md-2 mb-3">

						<!-- Card image -->
						<div class="view overlay">
							<img class="img-dashboard card-img-top" src="images/add.svg">
							<a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						<div class="text-center mt-3">
							<button type="button" class="btn" id="addTraining"
								data-bs-toggle="modal" data-bs-target="#exampleModal"
								data-bs-whatever="@mdo">Create Training</button>
							<!-- <button type="button" class="btn">ADD TRAINING</button> -->
						</div>



					</div>
				</div>

				<div class="col-6">
					<div class="card px-md-5 py-md-2 mb-3">

						<!-- Card image -->
						<div class="view overlay">
							<img class="img-dashboard card-img-top" src="images/schedule.svg">
							<a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						<div class="text-center mt-3">
							<a href="adminSchedule.jsp">
								<button type="button" class="btn">Create SCHEDULE</button>
							</a>
						</div>



					</div>
				</div>

				<div class="col-6">
					<div class="card px-md-5 py-md-2 mb-3">

						<!-- Card image -->
						<div class="view overlay">
							<img class="img-dashboard card-img-top" src="images/survey.svg">
							<a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						<div class="text-center px-mt-2">
							<a href="adminEvaluation.jsp"><button type="button" class="btn">EVALUATION</button></a>
						</div>



					</div>
				</div>

				<div class="col-6">
					<div class="card px-md-5 py-md-2 mb-3">

						<!-- Card image -->
						<div class="view overlay">
							<img class="img-dashboard card-img-top" src="images/list.svg">
							<a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						<div class="text-center mt-3">
							<a href="adminListOfTrainings.jsp"><button type="button"
									class="btn">LIST OF TRAINING</button></a>
						</div>



					</div>
				</div>

			</div>
		</div>
	</section>

	<!-- ADD TRAINING MODAL -->

	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Training</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">



					<form method="post"
						action="<%=request.getContextPath()%>/addtraining" id="myform">
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">Course
								ID :</label> <input type="text" class="form-control" id="recipient-name"
								autocomplete="off" name="course_id" required>
						</div>

						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">Course
								Name :</label> <input type="text" class="form-control"
								id="recipient-name1" autocomplete="off" name="course_name"
								required>
						</div>

						<div class="mb-3">
							<label for="message-text" class="col-form-label">Description
								:</label>
							<textarea class="form-control" id="message-text"
								autocomplete="off" name="description" required></textarea>
						</div>
						
						<div class="input-group mb-3">
 	 							<label class="input-group-text" for="inputGroupSelect01">Trainer</label>
 	 								<select class="form-select" id="inputGroupSelect01" name = "instructor">

 	 									<option >Paule</option>
 	 									<option >Jambert</option>
 	 									<option >Joepet</option>
 	 								</select>
 	 					</div>
						<div class="mb-3-3">

							<label for="date" class="col-form-label">Schedule
								:</label>
							<input type="date" class="form-control-1" id="date"
								 name="date" required>
							<br>
							<label for="time" class="col-form-label"> Start time
								:</label>
							<input type="time" class="form-control-1" id="date"
								 name="startTime" required style="margin-left: 29px; margin-bottom: 50px;">

								<label for="time" class="col-form-label" style ="margin-left: 10px"> End time
								:</label>
							<input type="time" class="form-control-1" id="date"
								 name="endTime" required style="margin-left: 29px; margin-bottom: 50px;">
						</div>
							


					</form>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="ssubmit" onclick="closed()">Close</button>
					<button type="button" class="btn btn-primary" id="submit"
						onclick="submit()">Add</button>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
    function closed() {
      document.getElementById("recipient-name").value = null;
      document.getElementById("message-text").value = null;
    }
    function closed(){
        document.getElementById("recipient-name").value = null;
        document.getElementById("recipient-name1").value = null;
        document.getElementById("message-text").value = null;
    }
      
    function submit() {
      	document.getElementById("myform").submit();
      
    }
    
  </script>



	<!-- ADD TRAINING MODAL -->


	<!-- Footer -->
	<footer class="page-footer font-small bg-fujitsu">
		<!-- Copyright -->
		<div class="footer-copyright text-center py-3">
			© 2021 Team 2, <a href="#">All Right Reserved.</a>
		</div>
		<!-- Copyright -->
	</footer>
	<!-- Footer -->

</body>

</html>