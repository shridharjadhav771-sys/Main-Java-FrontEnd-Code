<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Page</title>
</head>
<body>

	<h1>GlobeCreater</h1>
	<p>
		<i>Welcome to GlobeCreater</i> Your Gateway to Professional Excellence
	</p>

	<a href="https://www.globecreater.com/">Visit globecreater.com!</a>

	<h1>Elements of html</h1>


	<fieldset>
		<label for="firstname">FirstName</label> <br> <input type="text"
			id="fname" name="fname"><br> <br> <label
			for="Surname">Surname</label> <input type="text" id="sname"
			name="sname"><br> <br> <label for="Address">
			Address</label> <input type="text" id="adds" name="adds"><br> <br>
		<label for="PhonenNumber">PhoneNumber</label> <input type="text"
			id="phnNum" name="phnNum"><br> <br> <label
			for="Pincode">Pincode</label> <input type="text" id="code"
			name="code"><br> <br> <label for="Location">Location</label>
		<input type="text" id="location" name="loaction"><br>

		<h1>Show Checkboxes</h1>

		<form action="/action_page.php">
			<input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
			<label for="vehicle1"> I have a bike</label><br> <input
				type="checkbox" id="vehicle2" name="vehicle2" value="Car"> <label
				for="vehicle2"> I have a car</label><br> <input type="checkbox"
				id="vehicle3" name="vehicle3" value="Boat"> <label
				for="vehicle3"> I have a boat</label><br> <br> <input
				type="submit" value="Submit">
		</form>

		<br> <input type="submit" value="submit">

		<button type="button" onclick="alert('Welcome to html page!')">Click
			Me!</button>

	</fieldset>

</body>
</html>