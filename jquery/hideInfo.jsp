<!DOCTYPE html>
<html>
<head>
<title>Hide Info Jquery</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#hide").click(function() {
			$("p").hide();
		});
		$("#show").click(function() {
			$("p").show();
		});
	});
</script>
</head>
<body>
	<p>
		<b>This is a little Info: </b><br /> jQuery is a lightweight, "write
		less, do more", JavaScript library. The purpose of jQuery is to make
		it much easier to use JavaScript on your website. jQuery takes a lot
		of common tasks that require many lines of JavaScript code to
		accomplish, and wraps them into methods that you can call with a
		single line of code. jQuery also simplifies a lot of the complicated
		things from JavaScript, like AJAX calls and DOM manipulation.
	</p>
	<button id="hide">Hide</button>
	<button id="show">Show</button>
</body>
</html>
