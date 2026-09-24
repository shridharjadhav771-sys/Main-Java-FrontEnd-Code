<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
	<style>
p.normal {
	border: 2px solid red;
	padding: 5px;
}

p.round1 {
	border: 2px solid red;
	border-radius: 5px;
	padding: 5px;
}

p.round2 {
	border: 2px solid red;
	border-radius: 8px;
	padding: 5px;
}

p.round3 {
	border: 2px solid red;
	border-radius: 12px;
	padding: 5px;
}
</style>
</head>
<body>


	<h2>The border-radius Property</h2>
	<p>This property is used to add rounded borders to an element:</p>

	<p class="normal">Normal border</p>
	<p class="round1">Round border</p>
	<p class="round2">Rounder border</p>
	<p class="round3">Roundest border</p>
	<div class="container">
		<div class="row">
			<div class="col-sm-2">col1</div>
			<div class="col-sm-4">col2</div>
			<div class="row">
			<div class="col-sm-5">col2</div>
			<div class="col-sm-1">col2</div>
</div>
		</div>
		<div class="row">
			<div class="col-sm">col-sm</div>
			<div class="col-sm">col-sm</div>
			<div class="col-sm">col-sm</div>
		</div>
	</div>

</body>


</html>