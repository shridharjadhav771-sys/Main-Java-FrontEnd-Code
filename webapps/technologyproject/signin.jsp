<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="IT Solution Hub">

<title>IT Solution Hub</title>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>


<!-- Custom CSS -->
<link rel="stylesheet" href="styles.css">

<!-- Material Dashboard CSS -->
<link id="pagestyle" href="./assets/css/material-dashboard.css?v=3.0.6"
	rel="stylesheet">
<style>
body {
	background-image: url('image.jpg');
	background-size: cover;
	background-position: center;
}
</style>
</head>

<body class="bg-gray-200">
	<div class="container">
	
		<!-- Navbar -->
		<nav
			class="navbar navbar-expand-lg navbar-dark bg-dark position-absolute top-0 w-100 shadow my-3">
			<div class="container">
				<a class="navbar-brand" href="#"> <img src="logo.jpg"
					class="navbar-brand-img" style="width: 35%" alt="IT Solution Hub">
				</a>
			</div>
		</nav>
		<!-- End Navbar -->

		<main class="main-content mt-5">
			<div class="page-header align-items-start min-vh-100"
				style="background-image: url('./assets/img/pms-banner.jpg?v=1');">
				<span class="bg-gradient-dark"></span>
				<div class="container my-auto">
					<div class="row justify-content-center">
						<div class="col-lg-4 col-md-8">
							<div class="card z-index-0 shadow-lg">
								<div
									class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
									<div class="bg-dark text-center py-3">
										<img src="logo.jpg" class="navbar-brand-img"
											style="width: 15%" alt="IT Solution Hub">
									</div>
								</div>

								<div class="card-body">
									<form role="form" action="userlogin" method="post">
										<div class="mb-4">
											<label for="email" class="form-label">Email Or Phone
												Number</label> <input type="text" class="form-control"
												name="username" id="email"
												placeholder="abc@example.com /123-45-678" required>
											<div class="text-danger mt-2" id="showError"
												style="display: none;"></div>
										</div>

										<div class="mb-4">
											<label for="passwordId" class="form-label">Password</label> <input
												type="password" class="form-control" name="password"
												id="passwordId" placeholder="*************" required>
											<div id="passErrorId" class="text-danger mt-2"
												style="display: none;"></div>
										</div>

										<div
											class="form-check form-switch d-flex align-items-center mb-4">
											<input class="form-check-input" type="checkbox"
												id="rememberMe" name="rememberme" value="Rememberme">
											<label class="form-check-label ms-3" for="rememberMe">Remember
												me</label>
										</div>

										<div class="text-center">
											<button type="submit" class="btn btn-dark w-100 mt-3 mb-0"
												onclick="return validate()">Sign in</button>
										</div>
									</form>
								</div>

								<div class="card-footer text-center pt-0 px-lg-2 px-1">
									<p class="mb-4 text-sm mx-auto">
										Forgot password? <a href="forgotpassword.jsp"
											class="text-success font-weight-bold">Click here</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>

	<script>
		function validate() {
			var email = $('#email').val();
			var password = $('#passwordId').val();

			if (email === '') {
				$("#showError").text("Please Enter Your Email Or Phone Number")
						.show();
				return false;
			} else if (password === '') {
				$("#showError").hide();
				$("#passErrorId").text("Please enter password").show();
				return false;
			}
			$("#passErrorId").hide();
			return true;
		}
	</script>
	<!-- <script>
	
		// Function to set cookies
		function setCookie(name, value, days) {
			var expires = "";
			if (days) {
				var date = new Date();
				date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
				expires = "; expires=" + date.toUTCString();
			}
			document.cookie = name + "=" + (value || "") + expires + "; path=/";
		}

		// Function to get cookies
		function getCookie(name) {
			var nameEQ = name + "=";
			var ca = document.cookie.split(';');
			for (var i = 0; i < ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0) == ' ')
					c = c.substring(1, c.length);
				if (c.indexOf(nameEQ) == 0)
					return c.substring(nameEQ.length, c.length);
			}
			return null;
		}

		// Function to check cookies and prefill form if needed
		function checkCookies() {
			var storedEmail = getCookie('userEmail');
			var storedPassword = getCookie('userPassword');
			if (storedEmail) {
				$('#email').val(storedEmail);
			}
			if (storedPassword) {
				$('#passwordId').val(storedPassword);
			}
		}

		// Validate function modified to handle cookies
		function validate() {
			var email = $('#email').val();
			var password = $('#passwordId').val();
			var rememberMe = $('#rememberMe').prop('checked');

			if (email === '') {
				$("#showError").text("Please Enter Your Email Or Phone Number")
						.show();
				return false;
			} else if (password === '') {
				$("#showError").hide();
				$("#passErrorId").text("Please enter password").show();
				return false;
			}

			// Store email and password in cookies if "Remember me" is checked
			if (rememberMe) {
				setCookie('userEmail', email, 7); // Store for 7 days
				setCookie('userPassword', password, 7); // Store for 7 days
			}

			$("#passErrorId").hide();
			return true;
		}

		// Call checkCookies when page loads to autofill if cookies are set
		window.onload = function() {
			checkCookies();
		}
	</script> -->




</body>

</html>
