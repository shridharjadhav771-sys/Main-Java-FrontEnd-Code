<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Input Form</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	padding: 20px;
}

.container {
	width: 400px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-group {
	margin-bottom: 15px;
}

label {
	font-size: 14px;
	display: block;
}

input[type="text"], input[type="number"] {
	width: 100%;
	padding: 8px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.btn {
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

.btn:hover {
	background-color: #0056b3;
}

.details {
	margin-top: 20px;
	display: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#submitBtn").click(function() {
		
			var userName = $("#userName").val();
			var userAge = $("#userAge").val();

		
			if (userName && userAge) {
				
				$(".details").show();
				$("#displayName").text(userName);
				$("#displayAge").text(userAge);
			} else {
				alert("Please fill out both fields.");
			}
		});
	});
</script>
</head>
<body>
	<div class="container">
		<h2>Enter User Details</h2>
		<form id="userForm">
			<div class="form-group">
				<label for="userName">Name:</label> <input type="text" id="userName"
					name="userName" required>
			</div>
			<div class="form-group">
				<label for="userAge">Age:</label> <input type="number" id="userAge"
					name="userAge" required>
			</div>
			<button type="button" id="submitBtn" class="btn">Submit</button>
		</form>

		<div class="details">
			<h3>User Details</h3>
			<p>
				<strong>Name:</strong> <span id="displayName"></span>
			</p>
			<p>
				<strong>Age:</strong> <span id="displayAge"></span>
			</p>
		</div>
	</div>
</body>
</html>
