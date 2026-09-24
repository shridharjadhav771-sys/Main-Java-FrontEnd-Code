<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Form</title>
</head>
<body>

	<h1>Student Information Register Form</h1>


	<fieldset>
		<form action="sutdent" method="post">
			<label for="fname ">First Name </label> <input type="text" id="fname"
				name="firstname"><br>
			<br> <label for="lname">Last Name</label><input type="text"
				id="lname" name="lastname"><br>
			<br> <label for="mail">Email Id</label> <input type="text"
				id="mailid" name="EmailId"><br>
			<br> <label for="pnumber">Phone Number </label> <input
				type="text" id="pnumber" name="PhoneNumber"><br>
			<br> <label for="birthday">Birthday:</label> <input type="date"
				id="birthday" name="birthday"><br>
			<br> <input type="submit" value="submit">
		</form>


	</fieldset>


</body>
</html>