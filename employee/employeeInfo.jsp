<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Information</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<h1>Employee Register Form</h1>

	<fieldset>
		<form action="information" method="get">
			<label for="StudentId ">StudentId</label> <input type="text" id="Sid"
				name="studentId"> <br>
			<br> <label for="employee">First Name </label> <input
				type="text" id="fname" name="firstname"><br> <br>
			<label for="lname">Last Name</label> <input type="text" id="lname"
				name="lastname"><br> <br> <label for="mail">Email
				Id</label> <input type="text" id="mailid" name="emailId"><br> <br>
			<label for="pnumber">Phone Number </label> <input type="text"
				id="pnumber" name="phoneNumber"><br> <br> <input
				type="submit" value="submit">
		</form>

	</fieldset>


</body>
</html>