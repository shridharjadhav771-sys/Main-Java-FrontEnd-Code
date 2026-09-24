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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
form#registerform {
    width: fit-content;
    margin-left: auto;
    margin-right: auto;
    background: url(images/imgnature.jpg);
    padding: 30px;
    color: #f8f9fa;
    background-repeat: no-repeat;
    background-size: cover;
}
</style>	
</head>

<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">WinterCamp</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="student.jsp">RegisterationForm</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="display.jsp">ViewPage</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu">
           <li><a class="dropdown-item" href="index.jsp">WinterCamp</a></li>
							<li><a class="dropdown-item" href="student.jsp">Registration Form</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="display.jsp">Display Form</a></li>
          </ul>
        </li>
       
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

	<div class="container">
	
	<form id = "registerform">
		
			<h1>Winter Camp Registration</h1>
			<div class="layout">
				<div class="mb-3 ">
					<label for="fname" class="form-label">First name:</label> <input
						type="text" class="form-control mb-3" id="studentFirstName" required="required" name="studentFirstName"
						placeholder="Enter the First name" >  
						
						<label for="lname"
						class="form-label">Last name:</label> <input type="text"
						class="form-control" id="studentLastName" name="studentLastName"
						placeholder="Enter the last name">
						
				</div>

				<div class="mb-3">
					<label for="email" class="form-label">Email id</label> <input
						type="email" class="form-control" id="studentEmailId" required="required" name="studentEmailId">	
				</div>

				<div class="mb-3">
					<label for="address" class="form-label">Address</label> <input
						type="text" class="form-control" id="studentAddress"  required="required" name="studentAddress" >
				</div>

				
				<div>
					<input type="button" onclick = "saveUserDetails();" value = "Submit" id="submit" name="submit">
						
				</div>
				
			</div>
		
	</form>
</div>

</body>
<script type="text/javascript">

function saveUserDetails(){
	$.ajax({
		url : "RegistrationServlet",
		type : 'post',
		data : {
			action : "insert",
			fname :$("#studentFirstName").val(),
			lname :$("#studentLastName").val(),
			email :$("#studentEmailId").val(),
			address :$("#studentAddress").val(),	
		},
		success : function(data) {
			console.log(data);
		},
		error : function(error) {
			alert(error);
		}
		});
}

</script>
</html>