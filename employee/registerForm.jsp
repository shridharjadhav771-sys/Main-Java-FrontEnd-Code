<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Registration Form</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</head>
<body>
	<h1>Globe Creater Register Form</h1>


	<div class="container-fluid">
		<form action="data" method="post">

			<div class="row">
				<div class="col-2">
					<label for="Firstname">First Name</label>
				</div>
				<div class="col-10">
					<input type="text" id="fname" name="firstname" required="required">
				</div>
			</div>
			<div class="row mt-2">
				<div class="col-2">
					<label for="Lastname">Last Name</label>
				</div>
				<div class="col-10">
					<input type="text" id="lname" name="lastname" required="required">
				</div>
			</div>
			<div class="row  mt-2">
				<div class="col-2">
					<label for="Email">EmailId</label>
				</div>
				<div class="col-10">
					<input type="text" id="mailid" name="emailId" required="required">
				</div>
			</div>
			<div class="row  mt-2">
				<div class="col-2">
					<label for="MobileNumber">MobileNumber</label>
				</div>
				<div class="col-10">
					<input type="text" id="mobileNumber" name="mobileNumber"
						required="required">
				</div>
			</div>
			<div class="row  mt-2">
				<div class="col-2">
					<label for="Address">Address</label>
				</div>
				<div class="col-10">
					<input type="text" id="Adds" name="address" required="required">
				</div>
			</div>
			<div class="row  mt-2">
				<div class="col-2">
					<label for="Stream">Stream</label>
				</div>
				<div class="col-10">
					<input type="text" id="Stream" name="stream" required="required">
				</div>
			</div>

			<div class="row  mt-2">
				<div class="col-2">
					<label for="YearPassout">PassoutYear</label>
				</div>
				<div class="col-10">
					<input type="text" id="year" name="passoutYear" required="required">
				</div>
			</div>
			<div class="row  mt-2">
				<div class="col-2">
					<label for="YearPassout">Percentage</label>
				</div>
				<div class="col-10">
					<input type="text" id="percentage" name="percentage"
						required="required">
				</div>
			</div>

			<div class="row  mt-2">

				<div class="col-12 text-">
					<input type="submit" class="btn btn-primary" " value="Register"
						class="btn">
				</div>
			</div>
		</form>
	</div>

</body>
</html>