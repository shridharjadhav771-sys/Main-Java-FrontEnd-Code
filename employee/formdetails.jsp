<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>
<body>
	<div class="container">
		<h1>Employee Register Form:</h1>
		<div class="card">
			<div class="card-body">
				<form action="details" method="post">

					<div class="form-group row">
						<label for="firstName" class="col-sm-2 col-form-label">First
							Name</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="firstName"
								placeholder="Enter first name" required="required">
						</div>
					</div>

					<div class="form-group row">
						<label for="lastName" class="col-sm-2 col-form-label">Last
							Name</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="lastName"
								placeholder="Enter last name" required="required">
						</div>
					</div>

					<div class=" form-group row">
						<label for="lastName" class="col-sm-2 col-form-label">User
							Name</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="username"
								placeholder="Enter user name" required="required">
						</div>
					</div>

					<div class="form-group row">
						<label for="lastName" class="col-sm-2 col-form-label">Password</label>
						<div class="col-sm-7">
							<input type="password" class="form-control" name="password"
								placeholder="Enter Password" required="required">
						</div>
					</div>

					<div class="form-group row">
						<label for="lastName" class="col-sm-2 col-form-label">Address</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="address"
								placeholder="Enter Address" required="required">
						</div>
					</div>

					<div class="form-group row">
						<label for="contact" class="col-sm-2 col-form-label">Contact
							No</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="contact"
								placeholder="Enter Contact Address" required="required">
						</div>
					</div>

					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</div>
</head>

</body>
</html>