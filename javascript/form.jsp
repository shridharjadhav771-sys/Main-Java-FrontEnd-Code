<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
</head>
<body>
<div class="container">
<h2>Form Validation</h2>

<form name="myForm">
  
 First Name:<input type="text" name="fname" class="form-control" id="validationCustom01"
				 required="required"><br>
  <label for="validationCustom01" class="form-label" >Last name</label>
  <input type="text" class="form-control" id="validationCustom01"
				 required="required"><br>
				 <label for="validationCustom01" class="form-label" >Email_Id</label>
  <input type="text" class="form-control" id="validationCustom01"
				 required="required"><br>
  <input type="button" value="Submit" onclick = "return validateForm()">
 
</form>
</div>
<script>
function validateForm() {
  let x = document.forms["myForm"]["fname"].value;
  if (x == "") {
    alert("Name must be filled out");
    return false;
  }
}
</script>
</body>
</html>