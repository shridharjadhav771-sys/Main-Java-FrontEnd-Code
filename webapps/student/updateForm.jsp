<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.student.StudentDTO"%>
<%@page import="java.util.ArrayList"%>
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
	crossorigin="anonymous">
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	</head>

<body>

<%-- <%
ArrayList<StudentDTO> list = (ArrayList<StudentDTO>) request.getSession().getAttribute("recordsById");
 if (list != null) {
	for (StudentDTO std : list) {


%>	 --%>
	<form >
		<div class="container">
			<h1>Winter Camp Registration</h1>
			<input name = "stdId" hidden>
			<div class="layout">
				<div class="mb-3 ">
					<label for="fname" class="form-label">First name:</label> <input
						type="text" class="form-control mb-3" id="studentFirstName" name="studentFirstName"
						placeholder="Enter the First name"> 
						
						<label for="lname"
						class="form-label">Last name:</label> <input type="text"  
						class="form-control" id="studentLastName" name="studentLastName"
						placeholder="Enter the last name">
						
				</div>

				<div class="mb-3">
					<label for="email" class="form-label">Email id</label> <input
						type="email" class="form-control" id="studentEmailId" name="studentEmailId">	
				</div>

				<div class="mb-3">
					<label for="address" class="form-label">Address</label> <input
						type="text" class="form-control" id="studentAddress" name="studentAddress" >
				</div>

				
				<div>
					<input type="button" onclick = "saveUserDetails();" value = "Submit" id="submit" name="submit">
						
				</div>
				
			</div>
		</div>
	</form>
<%-- <%}} %> --%>
</body>
<script type="text/javascript">
$(document).ready(function(){
	const curl = new URL(window.location.href);
	const param = new URLSearchParams(curl.search);
	getRecordsById(param.get("id"));
});
function getRecordsById(sid){
	$.ajax({
		url : "RegistrationServlet",
		type : 'post',
		data : {
			action : "getRecordsById",
			id:sid	
		},
		success : function(data) {
			console.log(data);
		},
		error : function(error) {
			alert(error);
		}
		});
	
}
function saveUserDetails(){
	$.ajax({
		url : "RegistrationServlet",
		type : 'post',
		data : {
			action : "update",
			std_id:$('#stdId'),
			fname :$("#studentFirstName").val(),
			lname :$("#studentLastName").val(),
			email :$("#studentEmailId").val(),
			address :$("#studentAddress").val(),	
		},
		success : function(data) {
			console.log(data);
		},
		error : function(error) {
			alert(error);
		}
		});
}

</script>
</html>