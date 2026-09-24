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
<style>
h2 {
	font-size: 2rem;
	text-align: center;
}

form {
	width: fit-content;
	margin-left: auto;
	margin-right: auto;
	padding: 70px;
	color: black;
	background-size: auto;
	background: url(images/imgnature.jpg);
    
}
</style>
</head>
<body>

	<h2>Candidate Registration Form</h2>

	<div class="container">
		<form action="registerprocess" method="POST">
			<table>
				<tr>
					<td><label for="firstName">First Name:</label></td>
					<td><input type="text" id="firstName" name="firstName"
						required></td>
				</tr>
				<tr>
					<td><label for="lastName">Last Name:</label></td>
					<td><input type="text" id="lastName" name="lastName" required></td>
				</tr>
				<tr>
					<td><label for="email">Email:</label></td>
					<td><input type="email" id="email" name="email" required></td>
				</tr>
				<tr>
					<td><label for="phone">Phone Number:</label></td>
					<td><input type="text" id="phone" name="phone" required></td>
				</tr>
				<tr>
					<td><label for="gender">Gender:</label></td>
					<td><input type="radio" id="male" name="gender" value="Male"
						required><label for="male">Male</label> <input
						type="radio" id="female" name="gender" value="Female" required><label
						for="female">Female</label></td>
				</tr>
				<tr>
					<td><label for="address">Address:</label></td>
					<td><textarea id="address" name="address" rows="4" cols="50"
							required></textarea></td>
				</tr>
				<tr>
					<td><label for="dob">Date of Birth:</label></td>
					<td><input type="date" id="dob" name="dob" required></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Register">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>