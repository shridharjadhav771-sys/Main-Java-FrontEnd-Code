<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="stylesheet.css">
<style>
/* Basic styles for the form */
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.center {
	width: 60%;
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-spacing: 10px 15px;
	margin-bottom: 20px;
}

td {
	padding: 10px;
	vertical-align: top;
}

td b {
	font-size: 16px;
}

.form-control {
	width: 100%;
	padding: 10px;
	border-radius: 4px;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

input[type="text"], input[type="email"], input[type="date"], textarea,
	select {
	font-size: 14px;
}

textarea {
	resize: vertical;
}

.form-control:focus {
	outline: none;
	border-color: #4caf50;
}

label {
	font-weight: bold;
}

.error-message {
	color: red;
	font-size: 14px;
}

input[type="radio"] {
	margin-right: 10px;
}

/* Style for the submit button */
.submit-btn {
	background-color: #4caf50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	width: 100%;
}

.submit-btn:hover {
	background-color: #45a049;
}
</style>
</head>
<body>


	<nav class="navbar navbar-expand-lg navbar-light bg-info">
		<div class="container-fluid">
			<a class="navbar-brand" href="dashboard.jsp"> <img
				src="kbcnum.jpg" alt="logo" style="width: 60px" class="rounded-pill">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a
						class="nav-link text-white font-weight-bold" href="dashboard.jsp">Home</a>
					</li>
					<li class="nav-item"><a
						class="nav-link text-white font-weight-bold" href="login.jsp">Login</a>
					</li>
					<li class="nav-item"><a
						class="nav-link text-white font-weight-bold" href="index.jsp">Registration</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-white font-weight-bold"
						href="#" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> More </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="ViewStudent">View</a></li>
							<li><a class="dropdown-item" href="#">Log out</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<h2 id="heading">
		<img src="si-logo.png">Sinhgad Engineering College
	</h2>
	<h3 class="text-centre">Registaration Form</h3>

	<!-- <div class="container">
	<form action="RegisterServlet" method="post">
		<table class="center">
			<tr>
				<td><label for="fName"><b>First Name:</b></label></td>
				<td><input type="text" class="form-control" id="fName"
					name="fname" placeholder="Enter your first name"
					oninput="validatefirstname(this)"></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="errorfirstname" style="color: red"></span></td>
			</tr>

			<tr>
				<td><label for="lName"><b>Last Name:</b></label></td>
				<td><input type="text" class="form-control" id="lName"
					name="lname" placeholder="Enter your last name"
					oninput="validatelastname(this)"></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="errorlastname" style="color: red"></span></td>
			</tr>

			<tr>
				<td><label for="mobile"><b>Mobile No:</b></label></td>
				<td><input type="text" class="form-control" id="mobile"
					name="mobile" placeholder="Enter the Mobile no."
					oninput="validateMobile(this)"></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="errorMobile" style="color: red"></span></td>
			</tr>
			<tr>
				<td><label for="email"><b>Email Id:</b></label></td>
				<td><input type="email" class="form-control" id="email"
					name="email" placeholder="Enter your email id"
					oninput="validateEmail(this)"></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="errorEmail" style="color: red"></span></td>
			</tr>

			<tr>
				<td><label for="address"><b>Address:</b></label></td>
				<td><textarea name="address" class="form-control" id="address"
						rows="5" col="30"></textarea></td>
			</tr>


			<tr>
				<td><label for="gender"><b>Gender:</b></label></td>
				<td><input type="radio" id="male" value="male" name="gender">Male
					<input type="radio" id="female" value="female" name="gender">Female</td>
			</tr>

			<tr>
				<td><label for="DOB"><b>DOB:</b></label></td>
				<td><input type="Date" id="DOB" name="DOB"></td>
			</tr>

			<tr>
				<td><label for="branch"><b>Choose Branch:</b></label></td>
				<td><select id="branch" name="branch">
						<option value="BSC">BSC</option>
						<option value="BCA">BCA</option>
						<option value="MSC" selected>MSC</option>
						<option value="MCA">MCA</option>
				</select></td>
			</tr>

			<tr>
				<td><label for="specialization"><b>Specialization:</b></label></td>
				<td><input type="checkbox" id="cs" name="specialization"
					value="Computer Science">Computer Science <input
					type="checkbox" id="it" name="specialization"
					value="Information Technology">Information Technology</td>
			</tr>
		</table> -->
	<div class="center">

		<form action="RegisterServlet" method="post">

			<table>
				<tr>
					<td><label for="fName"><b>First Name:</b></label></td>
					<td><input type="text" class="form-control" id="fName"
						name="fname" placeholder="Enter your first name"
						oninput="validatefirstname(this)"></td>
				</tr>
				<tr>
					<td></td>
					<td><span id="errorfirstname" class="error-message"></span></td>
				</tr>

				<tr>
					<td><label for="lName"><b>Last Name:</b></label></td>
					<td><input type="text" class="form-control" id="lName"
						name="lname" placeholder="Enter your last name"
						oninput="validatelastname(this)"></td>
				</tr>
				<tr>
					<td></td>
					<td><span id="errorlastname" class="error-message"></span></td>
				</tr>

				<tr>
					<td><label for="mobile"><b>Mobile No:</b></label></td>
					<td><input type="text" class="form-control" id="mobile"
						name="mobile" placeholder="Enter the Mobile no."
						oninput="validateMobile(this)"></td>
				</tr>
				<tr>
					<td></td>
					<td><span id="errorMobile" class="error-message"></span></td>
				</tr>

				<tr>
					<td><label for="email"><b>Email Id:</b></label></td>
					<td><input type="email" class="form-control" id="email"
						name="email" placeholder="Enter your email id"
						oninput="validateEmail(this)"></td>
				</tr>
				<tr>
					<td></td>
					<td><span id="errorEmail" class="error-message"></span></td>
				</tr>

				<tr>
					<td><label for="password"><b>Password:</b></label></td>
					<td><input type="text" class="form-control" id="password"
						name="password" placeholder="Enter your password"
						oninput="validatePassword(this)"></td>
				</tr>


				<tr>
					<td><label for="address"><b>Address:</b></label></td>
					<td><textarea name="address" class="form-control" id="address"
							rows="5"></textarea></td>
				</tr>

				<tr>
					<td><label for="gender"><b>Gender:</b></label></td>
					<td><input type="radio" id="male" value="male" name="gender">
						Male <input type="radio" id="female" value="female" name="gender">
						Female</td>
				</tr>

				<tr>
					<td><label for="DOB"><b>DOB:</b></label></td>
					<td><input type="date" id="DOB" name="DOB"></td>
				</tr>

				<tr>
					<td><label for="branch"><b>Choose Branch:</b></label></td>
					<td><select id="branch" name="branch" class="form-control">
							<option value="BSC">BSC</option>
							<option value="BCA">BCA</option>
							<option value="MSC" selected>MSC</option>
							<option value="MCA">MCA</option>
					</select></td>
				</tr>

				<tr>
					<td><label for="specialization"><b>Specialization:</b></label></td>
					<td><input type="checkbox" id="cs" name="specialization"
						value="Computer Science"> Computer Science <input
						type="checkbox" id="it" name="specialization"
						value="Information Technology"> Information Technology</td>
				</tr>

				<tr>
					<td colspan="2">
						<button type="submit" class="submit-btn">Submit</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<!-- <!-- <div>
			<input type="submit" id="submit" name="submit"
				onsubmit="validatesubmit(event)" class="btn btn-primary">
		</div> -->
	<div id="errorsubmit" style="color: red"></div>
	</form>
	-->
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="fixed-bottom bg-info p-3 text-white">
		<p>© Sinhgad Institutes's Sinhgad College of Engineering, S. No.
			44/1, Vadgaon (Budruk), Off. Sinhgad Road, Pune 411 041. Maharashtra,
			INDIA.</p>
	</div>
	</div>
	<!-- </div>
	</div> -->

	<script type="text/javascript">
		function validatefirstname(input) {
			console.log(input.value);
			var regex = /^[a-zA-Z]+$/;
			var errorfirstname = document.getElementById('errorfirstname');
			if (!regex.test(input.value)) {
				errorfirstname.innerHTML = "Please enter alphabet only";
			} else {
				errorfirstname.innerHTML = "";
				return input.value;
			}
		}

		function validatelastname(input) {
			console.log(input.value);
			var regex = /^[a-zA-Z]+$/;
			var errorlastname = document.getElementById('errorlastname');
			if (!regex.test(input.value)) {
				errorlastname.innerHTML = "Please enter alphabet only";
			} else {
				errorlastname.innerHTML = "";
				return input.value;
			}
		}

		function validateMobile(input) {
			console.log(input.value);
			var regex = /^\d{10}$/;
			var errorMobile = document.getElementById('errorMobile');
			if (!regex.test(input.value)) {
				errorMobile.innerHTML = "Please enter 10 digit number";
			} else {
				errorMobile.innerHTML = "";
				return input.value;
			}
		}

		function validateEmail(input) {
			console.log(input.value);
			var regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			var errorEmail = document.getElementById('errorEmail');
			if (!regex.test(input.value)) {
				errorEmail.textContent = "Please enter correct email id";
			} else {
				errorEmail.textContent = "";
				return input.value;
			}
		}
		function validatePassword(input) {
			console.log(input.value);
			var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
			var errorPassword = document.getElementById('errorPassword');
			if (!regex.test(input.value)) {
				errorPassword.textContent = "Please enter the correct Password";
			} else {
				errorPassword.textContent = "";
				return input.value;
			}
		}

		function validatesubmit(event) {
			validatefirstname(document.getElementById('fName'));
			validatelastname(document.getElementById('lName'));
			validateMobile(document.getElementById('mobile'));
			validateEmail(document.getElementById('email'));
			validatePassword(document.getElementById('Password'));

		}
	</script>
</body>
</html>