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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
body {
	color: #2a00ff;
	padding: 100px;
	margin-right: auto;
	margin-left: auto;
	width: auto;
}

.error_msg {
	display: none;
	color: red;
}
</style>
</head>
<body>

	<div class="container">
		<h2>Registration Form</h2>
		<form id="myForm">
			<label for="username" class="required form-label">Username:</label> <input
				type="text" class="form-control" id="username" name="username">

			<span class="error_msg" id="error_username">Please Enter Username..</span> 
			
			<br> <br> <label for="email" class="form-label">Email:</label>
			<input type="email" class="form-control" id="email" name="email"
				required>
				<span class="error_msg" id="error_email">Please Enter Email..</span> 
				<br> <br> 
				<label for="password">Password:</label>
				<input type="password" class="form-control" id="password"
				name="password" required><br> <br> <label
				for="confirmPassword">Confirm Password:</label> <input
				type="password" class="form-control" id="confirmPassword"
				name="confirmPassword" required><br> <br> <input
				type="button" value="Submit" onclick="validateForm();">
		</form>
	</div>

	<script>
		function validateForm() {
			debugger

			var username = document.getElementById("username").value;
			var email = document.getElementById("email").value;
			var password = document.getElementById("password").value;
			var confirmPassword = document.getElementById("confirmPassword").value;

			if (username === "") {
				$("#error_username").show();
				alert("Username must be filled out");
				return false;
			}

			var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
			if (!emailPattern.test(email)) {
				alert("Please enter a valid email address");
				return false;
			}

			if (password.length < 6) {
				alert("Password must be at least 6 characters long");
				return false;
			}

			if (password !== confirmPassword) {
				alert("Passwords do not match");
				return false;
			}

			return true;
		}
		function newfum(){
			if(validateForm()){
				console.log("true");
			}
		}
	</script>

</body>
</html>