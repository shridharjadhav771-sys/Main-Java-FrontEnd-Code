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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script>
	function confirmInput() {
		fname = document.forms[0].fname.value;
		alert("Hello " + fname + "! You will now be redirected to www.globecreater.com");
	}
	function openWin() {
		window.open("https:/www.globecreater.com","_blank","toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=400, height=400");

	}
	function closeWin() {
		myWindow.close();
	}
	function printPage() {
		window.print();
	}
</script>
</head>
<body>
	<div class="container">

		<h1>JavaScript HTML function</h1>
		<h2>The onsubmit Attribute</h2>

		<form onsubmit="confirmInput()" action="https://www.globecreater.com/">
			
			Enter your name: <input id="fname" type="text" size="20">
			
			 <inputtype="submit"> <br> <br> <input type="button"value="Open Window" onclick="openWin()"><br> <br>
			
			<input type="button" value="Close myWindow" onclick="closeWin()" /><br>
			<br> 
			
			<input type="button" value="Print this page"
				onclick="printPage()" />
	</div>
	</form>
</body>
</html>
