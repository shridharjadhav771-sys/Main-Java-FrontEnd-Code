<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
h1 {
	text-align: center;
}
element.style {
    background-color: aqua;
}

</style>
</head>
<body>
	<h1>
		
		<p style="color: purple;a";>Winter camps are a place for children to participate in outdoor activities and form connections with others!</p>
	</h1>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp">WinterCamp</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="student.jsp">RegisterationForm</a></li>
					<li class="nav-item"><a class="nav-link" href="display.jsp">ViewPage</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Dropdown </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="index.jsp">WinterCamp</a></li>
							<li><a class="dropdown-item" href="student.jsp">Registration
									Form</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="display.jsp">Display
									Form</a></li>
						</ul></li>

				</ul>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>

				</form>
			</div>
		</div>
	</nav>

	<div class="card-group">
		<div class="card">
			<img src="\student\summer.jpg" card-img-top" alt="...">
			<div class="card-body"></div>



		</div>
		<div class="card">
			<img src="\student\camp.jpg" class="card-img-top" alt="...">
			<div class="card-body"></div>

		</div>
		<div class="card">
			<img src="\student\sum.jpg" class="card-img-top" alt="...">
			<div class="card-body"></div>

		</div>
	</div>
	<div class="card-group">
		<div class="card">
			<img src="\student\summer.jpg" card-img-top" alt="...">
			<div class="card-body"></div>



		</div>
		<div class="card">
			<img src="\student\camp.jpg" class="card-img-top" alt="...">
			<div class="card-body"></div>

		</div>
		<div class="card">
			<img src="\student\sum.jpg" class="card-img-top" alt="...">
			<div class="card-body"></div>

		</div>
	</div>

</body>
</html>