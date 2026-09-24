<%@page import="com.student.StudentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.student.StudentDAO"%>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    /* CSS for Heading */
    .heading {
      font-size: 2.5em;
      color: #2C3E50;
      text-align: center;
      font-family: 'Arial', sans-serif;
    }

    /* CSS for bold text */
    .bold-text {
      font-weight: bold;
      color: #E74C3C;
    }
  </style>
<style type="text/css">
body {
	background-repeat: no-repeat;
	background-size: cover;
}

h1 {
	text-align: center;
}

thead {
	background-color: pink;
}

b {
	background-color: #fffc00;
}

::before {
	color: darkred;
}
</style>
</head>
<%
ArrayList<StudentDTO> list = (ArrayList<StudentDTO>) request.getSession().getAttribute("List");
%>
<body>
	 <h1 class="heading"><span class="bold-text">Winter Camp List</span></h1>
		<div>
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">WinterCamp</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="student.jsp">RegisterationForm</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="display.jsp">ViewPage</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="index.jsp">WinterCamp</a></li>
							<li><a class="dropdown-item" href="student.jsp">Registration Form</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="display.jsp">Display Form</a></li>
          </ul>
        </li>
        
      </ul>
      
     
    <!--   <form class="d-flex" action ="SearchRecord" method="post" role="search">
        <input class="form-control me-2" action ="SearchRecord" type="search" name="searchField" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form> -->
      <form class="d-flex" action="display" method="Post" role="search">
    <input class="form-control me-2" type="search" name="searchField" placeholder="Search" aria-label="Search">
    <button class="btn btn-outline-success" type="submit">Search</button>
</form>
      
    </div>
  </div>
</nav>
			

			<table class="table table-striped"">
				<thead>
					<tr>
						<th>ID</th>
						<th>Student FirstName</th>
						<th>Student LastName</th>
						<th>Email id</th>
						<th>Address</th>
						<th>Action</th>

					</tr>
				</thead>

				<tbody>
					<%
					if (list != null) {

						for (StudentDTO std : list) {
					%>

					<tr>
						<td><%=std.getStdId()%></td>
						<td><%=std.getStudentFirstName()%></td>
						<td><%=std.getStudentLastName()%></td>
						<td><%=std.getStudentEmailId()%></td>
						<td><%=std.getStudentAddress()%></td>
						<td><a href="updateForm.jsp?id=<%=std.getStdId()%>"><i
								class="fas fa-edit"></i></a> <a
							href="DeleteServlet?id=<%=std.getStdId()%>"><i
								class="fa fa-trash" aria-hidden="true"></i></a></td>
					</tr>
					<%
					}
					} else {
					System.out.println("List is null");
					}
					%>
				</tbody>
			</table>
		</div>
	</form>



</body>
<script type="text/javascript">

function saveUserDetails(){
	$.ajax({
		url : "RegistrationServlet",
		type : 'post',
		data : {
			action : "delete",
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