<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Grouping Form Data with Fieldset</h1>

	<h3>The fieldset element is used to group related data in a form,
		and the legend element defines a caption for the fieldset element.
		Personalia:</h3>

	<fieldset>
		<label for="fname">Frist Name</label> <input type="text" id="faname"
			name="firstname"><br> <br> <label for="lastname">LastName</label>
		<input type="text" id="lastname" name="lastname"><br> <br>
		<input type="submit" value="submit">

		<button type="button" onclick="alert('Data Submitted Sucessfully!')">Click
			Me!</button>




	</fieldset>

</body>
</html>