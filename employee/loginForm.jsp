<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
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
<style>
body {
	background: silver !important;
	 h1{ color : purple;
	text-align: center;
}

form {
	margin: auto;
	width: 700px;
}
</style>
<body>
	<h1>Sign Form</h1>
	 <form action="info" method="get">
		<div class="form-row">
		
		
			<div class="form-group col-md-6">
				<br> <br> <br> <label for="inputEmail4">Email</label>
				<input type="email"  name="email_Id"  class="form-control" id="inputEmail4"
					placeholder="Email" >
			</div>
			<div class="form-group col-md-6">
				<br> <br> <br> <label for="inputPassword4">Password</label>
				<input type="password"   name="password" class="form-control" id="inputPassword4"
					placeholder="Password">
			</div>
		</div>
		<div class="form-group">
			<label for="inputAddress">Address</label> <input type="text"  name="address"
				class="form-control" id="inputAddress" placeholder="1234 Main St">
		</div>
		<div class="form-group">
			<label for="inputAddress2">Address 2</label> <input type="text"  name="address2"
				class="form-control" id="inputAddress2"
				placeholder="Apartment, studio, or floor">
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputCity">City</label> <select id="inputState"  name="city"
					class="form-control">
					<option selected>Choose...</option>
					<option>Delhi</option>
					<option>Mumbai</option>
					<option>Bangalore</option>
					<option>Hyderabad</option>
				</select>
			</div>
			<div class="form-group col-md-4">
				<label for="inputState">State</label> <select id="inputState" name="state"
					class="form-control">
					<option selected>Choose...</option>
					<option>Maharashtra</option>
					<option>Rajasthan</option>
					<option>Gujarat</option>
					<option>Karnataka</option>
				</select>
			</div>
			<div class="form-group col-md-2">
				<label for="inputZip">Zip</label> <input type="text" name="zip"
					class="form-control" id="inputZip">
			</div>
		</div>
		<div class="form-group">
			<div class="form-check">
				<input class="form-check-input" type="checkbox" id="gridCheck">
				<label class="form-check-label" for="gridCheck"> Check me
					out </label>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Sign in</button>
	</form>

</body>
</html>