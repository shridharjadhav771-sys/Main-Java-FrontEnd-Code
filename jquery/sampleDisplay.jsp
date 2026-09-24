<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
<link rel="stylesheet" href="stylesheet.css">
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
	<nav class="navbar navbar-expand-xxl bg-info  ">

		<ul class="navbar-nav  ">
			<li><a class="navbar-brands" href="dashboard.jsp"><img
					src="kbcnum.jpg" alt="logo" style="width: 60px"
					class="rounded-pill"></a></li>
			<li class="nav-item "><a class="nav-link " href="dashboard.jsp">Home</a>
			</li>
			<li class="nav-item "><a class="nav-link" href="login.jsp">login</a></li>
			<li class="nav-item"><a class="nav-link" href="index.jsp">Registaration</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" role="button"
				data-bs-toggle="dropdown">More</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item Active" href="ViewStudent">view</a></li>
					<li><a class="dropdown-item" href="#">Log out</a></li>
				</ul></li>
		</ul>
	</nav>
	<h2 id="heading">
		<img src="kbcnum.jpg" alt="kbcnum logo">Kavayitri Bahinabai
		Chaudhari North Maharashtra University, Jalgaon.
	</h2>
	<h3>Registaration Form</h3>

	<form action="RegisterServlet" method="post">
		<table class="center">
			<tr>
				<td><label for="fName">First Name:</label></td>
				<td><input type="text" id="fName" name="fname"
					placeholder="Enter your first name"
					oninput="validatefirstname(this)"></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="errorfirstname" style="color: red"></span></td>
			</tr>

			<tr>
				<td><label for="lName">Last Name:</label></td>
				<td><input type="text" id="lName" name="lname"
					placeholder="Enter your last name" oninput="validatelastname(this)"></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="errorlastname" style="color: red"></span></td>
			</tr>

			<tr>
				<td><label for="mobile">Mobile No:</label></td>
				<td><input type="text" id="mobile" name="mobile"
					placeholder="Enter the Mobile no." oninput="validateMobile(this)"></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="errorMobile" style="color: red"></span></td>
			</tr>
			<tr>
				<td><label for="email">Email Id:</label></td>
				<td><input type="email" id="email" name="email"
					placeholder="Enter your email id" oninput="validateEmail(this)"></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="errorEmail" style="color: red"></span></td>
			</tr>

			<tr>
				<td><label for="address">Address:</label></td>
				<td><textarea name="address" id="address" rows="5" col="30"></textarea>
				</td>
			</tr>

			<tr>
				<td><label for="gender">Gender:</label></td>
				<td><input type="radio" id="male" value="male" name="gender">Male
					<input type="radio" id="female" value="female" name="gender">Female</td>
			</tr>

			<tr>
				<td><label for="DOB">DOB:</label></td>
				<td><input type="Date" id="DOB" name="DOB"></td>
			</tr>

			<tr>
				<td><label for="branch">Choose Branch:</label></td>
				<td><select id="branch" name="branch">
						<option value="BSC">BSC</option>
						<option value="BCA">BCA</option>
						<option value="MSC" selected>MSC</option>
						<option value="MCA">MCA</option>
				</select></td>
			</tr>

			<tr>
				<td><label for="specialization">Specialization:</label></td>
				<td><input type="checkbox" id="cs" name="specialization"
					value="Computer Science">Computer Science <input
					type="checkbox" id="it" name="specialization"
					value="Information Technology">Information Technology</td>
			</tr>
		</table>

		<div>
			<input type="submit" id="submit" name="submit"onsubmit="validatesubmit(event)">
		</div>
		<div id="errorsubmit" style="color: red"></div>
	</form>
	<div class="fixed-bottom bg-info p-3 text-white">
		<p>© 2022 BY KAVAYITRI BAHINABAI CHAUDHARI NORTH MAHARASHTRA
			UNIVERSITY, JALGAON</p>
	</div>

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

		function validatesubmit(event) {
			validatefirstname(document.getElementById('fName'));
			validatelastname(document.getElementById('lName'));
			validateMobile(document.getElementById('mobile'));
			validateEmail(document.getElementById('email'));
		}
	</script>
</body>
</html>