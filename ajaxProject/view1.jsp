<%@page import="ajaxProject.RegisterDAO"%>
<%@page import="ajaxProject.RegisterDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Student Record</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<style>
body {
	font-family: Arial, sans-serif;
}

a.nav-link {
	color: white;
	font-weight: bold;
}

.navbar-nav {
	padding-left: 20px;
}

.navbar-brand img {
	width: 60px;
	border-radius: 50%;
}

h3 {
	color: navy;
	text-align: center;
	font-weight: bold;
	margin-top: 20px;
}

.navbar {
	background-color: #17a2b8;
}

.table th, .table td {
	text-align: center;
}

.table th {
	background-color: #f8f9fa;
	font-weight: bold;
}

.footer {
	background-color: #17a2b8;
	padding: 20px 0;
	text-align: center;
	color: white;
}

.modal-body {
	font-size: 14px;
}

.modal-header, .modal-footer {
	border: none;
}

.modal-content {
	padding: 10px;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-info">
		<a class="navbar-brand" href="dashboard.jsp"> <img
			src="kbcnum.jpg" alt="logo" class="rounded-pill">
		</a>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="dashboard.jsp">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
			<li class="nav-item"><a class="nav-link" href="index.jsp">Registration</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" role="button"
				data-bs-toggle="dropdown">More</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="ViewStudent">View</a></li>
					<li><a class="dropdown-item" href="#">Logout</a></li>
				</ul></li>
		</ul>
	</nav>

	<!-- Title -->
	<h3>Student Record</h3>

	<!-- Table with records -->
	<div class="container">
		<form>
			<table class="table table-striped table-bordered">
				<thead>
					<tr class="table-info">
						<th scope="col">ID</th>
						<th scope="col">First Name</th>
						<th scope="col">Last Name</th>
						<th scope="col">Mobile No</th>
						<th scope="col">Email ID</th>
						<th scope="col">Address</th>
						<th scope="col">Gender</th>
						<th scope="col">Date of Birth</th>
						<th scope="col">Branch</th>
						<th scope="col">Specialization</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>
					<%
					ArrayList<RegisterDTO> regList = (ArrayList<RegisterDTO>) session.getAttribute("registerList");
					if (regList != null) {
						for (RegisterDTO regObj : regList) {
					%>
					<tr>
						<td><%=regObj.getReg_id()%></td>
						<td><%=regObj.getReg_fname()%></td>
						<td><%=regObj.getReg_lname()%></td>
						<td><%=regObj.getReg_mbno()%></td>
						<td><%=regObj.getReg_emailid()%></td>
						<td><%=regObj.getReg_address()%></td>
						<td><%=regObj.getReg_gender()%></td>
						<td><%=regObj.getReg_dob()%></td>
						<td><%=regObj.getReg_branch()%></td>
						<td><%=regObj.getReg_specialization()%></td>
						<td><a href="UpdateServlet?id=<%=regObj.getReg_id()%>"
							class="btn btn-warning" data-bs-toggle="modal"
							data-bs-target="#exampleModal<%=regObj.getReg_id()%>">Edit</a> <a
							href="DeleteServlet?id=<%=regObj.getReg_id()%>"
							class="btn btn-danger" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop<%=regObj.getReg_id()%>">Delete</a>
						</td>
					</tr>
					<%
					}
					} else {
					out.print("No records found.");
					}
					%>
				</tbody>
			</table>
		</form>
	</div>

	<!-- Modals for Edit and Delete -->
	<%
	for (RegisterDTO regObj : regList) {
	%>

	<!-- Edit Modal -->
	<div class="modal fade" id="exampleModal<%=regObj.getReg_id()%>"
		tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<form action="UpdateServlet" method="post">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Update Record</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="id" name="id"
							value="<%=regObj.getReg_id()%>">
						<div class="form-group">
							<label for="fName">First Name:</label> <input type="text"
								id="fName" name="fname" class="form-control"
								value="<%=regObj.getReg_fname()%>">
						</div>
						<div class="form-group">
							<label for="lName">Last Name:</label> <input type="text"
								id="lName" name="lname" class="form-control"
								value="<%=regObj.getReg_lname()%>">
						</div>
						<div class="form-group">
							<label for="mobile">Mobile No:</label> <input type="text"
								id="mobile" name="mobile" class="form-control"
								value="<%=regObj.getReg_mbno()%>">
						</div>
						<div class="form-group">
							<label for="email">Email ID:</label> <input type="email"
								id="email" name="email" class="form-control"
								value="<%=regObj.getReg_emailid()%>">
						</div>
						<div class="form-group">
							<label for="address">Address:</label>
							<textarea name="address" id="address" rows="5"
								class="form-control"><%=regObj.getReg_address()%></textarea>
						</div>
						<div class="form-group">
							<label>Gender:</label> <input type="radio" id="male"
								name="gender" value="male"
								<%=regObj.getReg_gender().equals("male") ? "checked" : ""%>>
							Male <input type="radio" id="female" name="gender" value="female"
								<%=regObj.getReg_gender().equals("female") ? "checked" : ""%>>
							Female
						</div>
						<div class="form-group">
							<label for="DOB">Date of Birth:</label> <input type="date"
								id="DOB" name="DOB" class="form-control"
								value="<%=regObj.getReg_dob()%>">
						</div>
						<div class="form-group">
							<label for="branch">Choose Branch:</label> <select id="branch"
								name="branch" class="form-control">
								<option value="BSC">BSC</option>
								<option value="BCA">BCA</option>
								<option value="MSC" selected>MSC</option>
								<option value="MCA">MCA</option>
							</select>
						</div>
						<div class="form-group">
							<label for="specialization">Specialization:</label> <input
								type="checkbox" id="cs" name="specialization"
								value="Computer Science"
								<%=regObj.getReg_specialization().contains("Computer Science") ? "checked" : ""%>>
							Computer Science <input type="checkbox" id="it"
								name="specialization" value="Information Technology"
								<%=regObj.getReg_specialization().contains("Information Technology") ? "checked" : ""%>>
							Information Technology
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Update</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- Delete Confirmation Modal -->
	<div class="modal fade" id="staticBackdrop<%=regObj.getReg_id()%>"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Confirm
						Deletion</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Are you sure you want to delete this
					record?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>
					<a href="DeleteServlet?id=<%=regObj.getReg_id()%>"
						class="btn btn-danger">Delete</a>
				</div>
			</div>
		</div>
	</div>

	<%
	}
	%>

	<!-- Footer -->
	<div class="footer">
		<p>© Sinhgad Institutes's Sinhgad College of Engineering, S. No.
			44/1, Vadgaon (Budruk), Off. Sinhgad Road, Pune 411 041. Maharashtra,
			INDIA.</p>
	</div>

</body>
</html>
