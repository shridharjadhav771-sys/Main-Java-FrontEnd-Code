<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>
<body>
	<div class="container">
		<h1>Car Specification</h1>
		<div class="card">
			<div class="card-body">
				<form action=Specification method="post">

					<div class="form-group row">
						<label for="CarID" class="col-sm-2 col-form-label">CarID </label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="CarID"
								placeholder="Enter Car ID" required="required">
						</div>
					</div>

					<div class="form-group row">
						<label for="CarName" class="col-sm-2 col-form-label">CarName
						</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="CarName"
								placeholder="Enter Car Name" required="required">
						</div>
					</div>

					<div class=" form-group row">
						<label for="CarCC" class="col-sm-2 col-form-label">CarCC </label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="CarCC"
								placeholder="Enter Car CC " required="required">
						</div>
					</div>

					<div class="form-group row">
						<label for="lastName" class="col-sm-2 col-form-label">CarPrice</label>
						<div class="col-sm-7">
							<input type=text class="form-control" name="CarPrice"
								placeholder="Enter Car Price" required="required">
						</div>
					</div>

					<div class="form-group row">
						<label for="lastName" class="col-sm-2 col-form-label">CarColour</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="CarColour"
								placeholder="Enter Car Colour" required="required">
						</div>
					</div>

					<div class="form-group row">
						<label for="contact" class="col-sm-2 col-form-label">CarType
						</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="CarType"
								placeholder="Enter Car Type " required="required">
						</div>
					</div>
					<div class="form-group row">
						<label for="contact" class="col-sm-2 col-form-label">CarCompany
						</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="CarCompany"
								placeholder="Enter  CarCompany " required="required">
						</div>
					</div>

					<button type="submit" class="btn btn-primary">Submit</button>

				</form>
				<a type="button" href = "allRecords" class="btn btn-primary">Display Records</a>
			</div>
		</div>
	</div>
</head>
<body>

</body>
</html>