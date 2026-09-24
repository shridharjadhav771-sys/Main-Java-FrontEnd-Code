<%@page import="com.DisplayRecordsDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DisplayRecordsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

</head>
<%
					ArrayList<DisplayRecordsDto> list = (ArrayList<DisplayRecordsDto>) request.getSession().getAttribute("List");
					%>
<body>
	<h1>Car Record</h1>
	<form >
		<div >

			<table class="table">
				<thead>
					<tr>
						<th>CarID</th>
						<th>CarName</th>
						<th>CarCC</th>
						<th>CarPrice</th>
						<th>CarColour</th>
						<th>CarType</th>
						<th>CarCompany</th>
						<th>Action</th>
					</tr>
				</thead>

				<tbody>
					
					<%
					for (DisplayRecordsDto displaydto : list) {
					%>

					<tr>
						<td><%=displaydto.getCarID()%></td>
						<td><%=displaydto.getCarName()%></td>
						<td><%=displaydto.getCarCC()%></td>
						<td><%=displaydto.getCarPrice()%></td>
						<td><%=displaydto.getCarColour()%></td>
						<td><%=displaydto.getCarType()%></td>
						<td><%=displaydto.getCarCompany()%></td>
						 <td><a href="Specification?id=<%=displaydto.getCarID()%>"
							data-bs-toggle="modal"
							data-bs-target="#exampleModal<%=displaydto.getCarID()%>">Edit</a></td> 
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</form>

	<%
					for (DisplayRecordsDto displaydto : list) {
					%> 


	<!-- Modal -->


	<div class="modal fade" id="exampleModal<%=displaydto.getCarID()%>" tabindex="-1"
		aria-labelledby="exampleModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Update Record
						title</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
	
	
				<form action=Specification method="post">

					<div class="form-group row">
						<label for="CarID" class="col-sm-2 col-form-label">CarID </label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="CarID"
								placeholder="Enter Car ID" required="required">
						</div>
					</div>

					<div class="form-group row">
						<label for="CarName" class="col-sm-2 col-form-label">CarName
						</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="CarName"
								placeholder="Enter Car Name" required="required">
						</div>
					</div>

					<div class=" form-group row">
						<label for="CarCC" class="col-sm-2 col-form-label">CarCC </label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="CarCC"
								placeholder="Enter Car CC " required="required">
						</div>
					</div>

					<div class="form-group row">
						<label for="lastName" class="col-sm-2 col-form-label">CarPrice</label>
						<div class="col-sm-7">
							<input type=text class="form-control" name="CarPrice"
								placeholder="Enter Car Price" required="required">
						</div>
					</div>

					<div class="form-group row">
						<label for="lastName" class="col-sm-2 col-form-label">CarColour</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="CarColour"
								placeholder="Enter Car Colour" required="required">
						</div>
					</div>

					<div class="form-group row">
						<label for="contact" class="col-sm-2 col-form-label">CarType
						</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="CarType"
								placeholder="Enter Car Type " required="required">
						</div>
					</div>
					<div class="form-group row">
						<label for="contact" class="col-sm-2 col-form-label">CarCompany
						</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="CarCompany"
								placeholder="Enter  CarCompany " required="required">
						</div>
					</div>

					<button type="submit" class="btn btn-primary">Submit</button>

				</form>
			</div>
		</div>
	</div>
				</div>
				
	 	<%} %> 
</body>
</html>