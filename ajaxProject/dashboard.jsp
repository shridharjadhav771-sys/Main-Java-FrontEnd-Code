<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<style>
a.nav-link {
	color: white;
	font-weight: bold;
}

.nav-item {
	padding-left: 20px;
}
</style>

</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-info">
		<div class="container-fluid">
			<!-- Logo and Home Link -->
			<a class="navbar-brand" href="dashboard.jsp"> <img
				src="kbcnum.jpg" alt="logo" style="width: 60px" class="rounded-pill">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Navbar Links -->
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="dashboard.jsp">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="index.jsp">Registration</a>
					</li>
					<!-- More Dropdown -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">More</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="ViewStudent">View</a></li>
							<li><a class="dropdown-item" href="#">Log Out</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	
	<div id="demo" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="admission.jpg" alt="mainbuilding" class="d-block w-100">
			</div>
			<div class="carousel-item">
				<img src="home.jpg" alt="Mainpage" class="d-block w-100">
			</div>
			<div class="carousel-item">
				<img src="mian1.jpg" alt="Main" class="d-block w-100">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>

	<div class="fixed-bottom bg-info p-3 text-white">
		<p>© Sinhgad Institutes's Sinhgad College of Engineering, S. No.
			44/1, Vadgaon (Budruk), Off. Sinhgad Road, Pune 411 041. Maharashtra,
			INDIA.</p>
	</div>

</body>
</html>