<%@ page import="java.util.List" %>
<%@ page import="School.trn.trn_teachers.TeachersDTO" %>
<%@ page import="School.Mst.Mst_departments.DepartmentsDTO" %>
<%@ page import="School.Mst.Mst_designation.DesignationDTO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Teachers List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    body {
        background-image: url('Images/imgg.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-position: center;
    }

    .container {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 30px;
        border-radius: 10px;
    }
    .table-transparent {
  color: #fff !important;   /* make all text white */
  background-color: transparent !important;
}

.table-transparent thead, 
.table-transparent tbody, 
.table-transparent th, 
.table-transparent td, 
.table-transparent tr {
  background-color: transparent !important;
  color: #fff !important;   /* force white text */
}

.table-transparent.table-striped > tbody > tr:nth-of-type(odd) {
  --bs-table-accent-bg: rgba(255,255,255,0.05) !important; /* faint stripe */
  color: #fff !important;
}
</style>
</head>
<body>
<div class="container mt-5 text-light"
style="background-color: rgba(0,0,0,0.5); border-radius: 12px; padding:20px;">
<%@ include file="nav.jsp" %>

<%
    int rows = request.getParameter("rows") == null ? 10 : Integer.parseInt(request.getParameter("rows"));
    String searchQuery = request.getParameter("query") == null ? "" : request.getParameter("query");
    String selectedDeptId = request.getParameter("dept_id");
    String selectedDesigId = request.getParameter("desig_id");
    String sortColumn = (String) request.getAttribute("sortColumn");
%>

<h2 class="mb-4">Teachers List</h2>

<form action="teachersList" method="get" name="searchform" class="row gx-3 gy-2 align-items-center mb-4">
    <input type="hidden" name="cpage" value="1"/>

    <!-- Search Box -->
    <div class="col-auto"> 
        <input type="text" name="query" value="<%= searchQuery %>" class="form-control" placeholder="Enter search term" id="query">
    </div>

    <!-- Department Dropdown -->
    <div class="col-auto">
        <select class="form-select" name="dept_id" id="searchDeptId">
            <option value="">-- Select Department --</option>
            
        </select>
    </div>

    <!-- Designation Dropdown -->
    <div class="col-auto">
        <select class="form-select" name="desig_id" id="searchDesigId">
            <option value="">-- Select Designation --</option>
            
        </select>
    </div>

    <!-- Rows Per Page -->
    <div class="col-auto">
        <input type="number" id="rows" value="<%= rows %>" name="rows" class="form-control">
    </div>

    <!-- Sort Dropdown -->
    <div class="col-auto">
        <select class="form-select" name="sort_column">
            <option value="teacher_id" <%= "teacher_id".equals(sortColumn) ? "selected" : "" %>>Sort by ID</option>
            <option value="teacher_name" <%= "teacher_name".equals(sortColumn) ? "selected" : "" %>>Sort by Name</option>
            <option value="contact" <%= "contact".equals(sortColumn) ? "selected" : "" %>>Sort by Contact</option>
            <option value="dept_name" <%= "dept_name".equals(sortColumn) ? "selected" : "" %>>Sort by Department</option>
            <option value="designation_name" <%= "designation_name".equals(sortColumn) ? "selected" : "" %>>Sort by Designation</option>
        </select>
    </div>

    <!-- Submit -->
    <div class="col-auto">
        <button type=button class="btn btn-primary" onclick="loadTeacherList()">Search</button>
    </div>
</form>

<table class="table table-bordered table-hover table-transparent table-striped">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Contact</th>
        <th>Department</th>
        <th>Designation</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody id="teacherTblBody">
    
    </tbody>
</table>
<div> <ul id="paginationID" class="d-flex" style="list-style: none;"></ul> </div>

<div class="mt-4">
    <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#addTeacherModal">
  Add New Teacher
</button>
<!-- Add Teacher Modal -->
<div class="modal fade" id="addTeacherModal" tabindex="-1" aria-labelledby="addTeacherModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content text-dark">
      <div class="modal-header">
        <h5 class="modal-title" id="addTeacherModalLabel">Add New Teacher</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
        <form action="teachers" method="post" name="teacherform" id="contactForm">
        	<input type="hidden" name="teacher_id" id="teacher_id">
        
        	<input type ="hidden" name="action" id="actionID">
          <div class="row mb-3">
            <div class="col">
              <input type="text" name="name" id="teacher_name" class="form-control" placeholder="Teacher Name" required>
              <span id="nameError" style="color: red"></span>
            </div>
            
            <div class="col">
              <input type="text" name="email" id="emailid" class="form-control" placeholder="Teacher Email" onblur="doCheckEmail(this.value)" required>
              <span id="emailError" style="color: red"></span>
            </div>
            
            <div class="col">
              <input type="text" name="contact" id="contactid" class="form-control" placeholder="Contact Number" onblur="doCheckContact(this.value)" required maxlength="10">
              <span id="contactError" style="color: red"></span>
            </div>
          </div>

          <div class="row mb-3">
            <div class="col">
              <select name="dept_id" id="dept_id" class="form-select" required>
                <option value="">Select Department</option>
              </select>
              <span id="deptError" style="color: red"></span>
            </div>

            <div class="col">
              <select name="designation_id" id="designation_id" class="form-select" required>
                <option value="">Select Designation</option>
              </select>
              <span id="desigError" style="color: red"></span>
            </div>
          </div>

          <div class="d-grid gap-2">
            <button type="button" onclick="validateInfo()" class="btn btn-primary" id="addbtnID">Add Teacher</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

</div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<script type="text/javascript">

$(document).ready(function() {
	 console.log('page load');
	 loadTeacherList();
	 loadDepartmentList();
	 loadDesignationList();
});

function loadTeacherList(){
	
	$.ajax({
		url: 'teachersList',
		type: 'GET',
		data: {
			
			query : $("#query").val(),
			rows : $("#rows").val(),
			searchQuery : $("#query").val(),
			selectedDeptId : $("#searchDeptId").val(),
			selectedDesigId : $("#selectedDesigId").val(),
			sortColumn : $("select[name='sort_column']").val(),
            cpage: 1
		},
		success: function(data){
			
			var res = eval(data);
			console.log(res);
			
			var teachers = res.teachers;
			console.log(teachers);
			$("#teacherTblBody").empty();
			$.map( teachers, function( teacher ) {
				var rowData = createRowElement(teacher);

				$("#teacherTblBody").append(rowData);
			});
			
		},
		error: function(){
			alert('Error fetching teacher data');
		}
	});
}

function createRowElement(teacher){
	var  rowData = "<tr>";
	rowData +="<td>"+ teacher.teacher_id +"</td>";
	rowData +="<td>"+ teacher.name +"</td>";
	rowData +="<td>"+ teacher.email +"</td>";
	rowData +="<td>"+ teacher.contact +"</td>";
	rowData +="<td>"+ teacher.dept_name +"</td>";
	rowData +="<td>"+ teacher.designation_name +"</td>";
	rowData += "<td>";
	rowData += "<button class='btn btn-sm btn-primary' onclick='editTeacher(" + teacher.teacher_id + ")'>Edit</button> ";
	rowData += "<button type='button' class='btn btn-sm btn-danger' onclick='doDelete(" + teacher.teacher_id + ", event)'>Delete</button>";
	rowData += "</td>";
	rowData +="</tr>";
	return rowData;
}

$("#emailid").val();
function validateInfo(){
    // Clear previous errors
    $("#nameError").html('');
    $("#emailError").html('');
    $("#contactError").html('');
    $("#deptError").html('');
    $("#desigError").html('');
//     document.getElementById("nameError").innerHTML = '';
//     document.getElementById("emailError").innerHTML = '';
//     document.getElementById("contactError").innerHTML = '';
//     document.getElementById("deptError").innerHTML = '';
//     document.getElementById("desigError").innerHTML = '';

    var name = $('input[name="name"]').val().trim();
    console.log('Name: ' + name);
    
    var email = $("#emailid").val().trim();
    console.log("Email: "+email);
    
    var contact = $('#contactid').val().trim();
	console.log("Contact: "+contact);
    
    var dept = $('#dept_id').val().trim();
    console.log("Department: "+dept);
    
    var desig = $('#designation_id').val().trim();
    console.log("Designation: "+desig);
    
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    var isValid = true;
    
    if (name === '') {
        $("#nameError").html("Name is required.");
        isValid = false;
    }

    if (email === '' || !emailRegex.test(email)) {
        $("#emailError").html("Enter valid email.");
        isValid = false;
    }
    
    if (contact === '' || contact.length !== 10 || isNaN(contact)){
    	$("#contactError").html("Please enter a valid 10-digit contact.");
    	isValid = false;
    }
    
    if (dept === ''){
    	$("#deptError").html("Select a department.")
    	isValid = false;
    }
    
    if(desig === ''){
    	$("#desigError").html("Select a designation.")
    	isValid = false;
    }
   
    if(isValid){
       // document.teacherform.submit();
       
       $.ajax({
    	   url : 'teachers',
    	   type : 'POST',
    	   data : $('#contactForm').serialize(),
    	   success : function(data){
    		   console.log(data);
    		   if(data === 'success'){
    			   
    			   loadTeacherList();
    			   $('#addTeacherModal').modal('hide');
    		   }else{
    			   console.log("Not saved....");
    		   }
    	   },failure: function(data){
    		   alert('Something wrong. Please try again');
    	   }
       });
    }
}

function doDelete(teacher_id){
	
	if(confirm("Delete this teacher?")){
		$("#actionID").val('delete');
		$('#teacher_id').val(teacher_id);
		$.ajax({
			url : 'teachers',
		 	   type : 'POST',
		 	   data : $('#contactForm').serialize(),
		 	   success : function(data){
		 		   console.log(data);
		 		   if(data === 'success'){
		 			   
		 			  loadTeacherList();
		 			 $('#addTeacherModal').modal('hide');
		 		   }else{
		 			   console.log("Not saved....");
		 		   }
		 	   },failure: function(data){
		 		   alert('Something wrong. Please try again');
		 	   }
		});
	}
}

function doCheckEmail(email){
	 $("#emailError").html('');
	console.log("Email: " + email);
	$.ajax({
		url: "teacherinfo",
		type: 'GET',
		data: {
			emailVal: email
		},
		success:function(resp){
			console.log(resp);
			if(resp === 'exist'){
				$("#emailError").html("This email is already used. Please enter another.");
			}
		},
		failure:function(data){
			alert('Invalid request');
		}
		
	});
}


function doCheckContact(contact){
	$('#contactError').html('');
	console.log("Contact: "+contact);
	$.ajax({
		url: "teacherContact",
		type: 'GET',
		data:{
			contactVal : contact
		},
		success:function(resp){
			console.log(resp);
			if(resp === 'exist'){
				$("#contactError").html("This contact is already used. Please enter another.");
			}
		},
		failure:function(data){
			alert('Invalid request');
		}
	})
}

function loadDepartmentList(){
	$.ajax({
		url: 'department',
		type: 'GET',
		data: {action: 'list'},
		success: function(data){
			var res = eval(data);
			console.log(res);
			
			$.map( res, function( dept ) {
				console.log(dept.dept_id  + ' ' + dept.dept_name);
				var optionData = '<option value='+ dept.dept_id+'>'+ dept.dept_name +'</option>';
				$("#dept_id").append(optionData);
				$("#searchDeptId").append(optionData);
			});
		},
		failure: function(data){
			console.log(data);
		}
		
	});
}

function loadDesignationList(){
	$.ajax({
		url:'designation',
		type: 'GET',
		data: {action: 'list'},
		success: function(data){
			var res = eval(data);
			console.log(res);
			
			$.map(res, function(desig){
				console.log(desig.designation_id + ' ' + desig.designation_name);
				var optionData = '<option value='+ desig.designation_id +'>' + desig.designation_name + '</option>';
				$("#designation_id").append(optionData);
				$("#searchDesigId").append(optionData)
			});
		},
		failure: function(data){
			console.log(data);
		}
	});
}


function editTeacher(teacherId){
	$('#addTeacherModalLabel').text('Edit Teacher');
	$('#submitButton').text('Update Teacher');
	
	$.ajax({
		url: 'teachers',
		type: 'GET',
		data: { teacher_id : teacherId},
		success: function(data){
			console.log(data);
			var teacher = eval(data);
			if(teacher){
				$("#actionID").val('update');
				$('#teacher_id').val(teacher.teacher_id);
				$('#teacher_name').val(teacher.name);
				$('#emailid').val(teacher.email);
				$('#contactid').val(teacher.contact);
				$('#dept_id').val(teacher.dept_id);
				$('#designation_id').val(teacher.designation_id);
				$('#addbtnID').text('Update');
				$('#addTeacherModal').modal('show');
			}else{
				alert('Failed to load teacher data.')
			}
		},
		error: function(){
			alert('Error fetching teacher data');
		}
	});
}

$(document).on('click','[data-bs-target="#addTeacherModal"]', function(){
	$('#addTeacherModalLabel').text("Add New Teacher");
	$('#submitButton').text('Add Teacher');
	$('#contactForm')[0].reset();
	$('#teacher_id').val('');
	$('#nameError, #emailError, #contactError, #deptError, #desigError').html('');
});

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
function loadpage(pageno) {
    document.searchform.cpage.value = pageno;
    document.searchform.submit();
}
</script>
</body>
</html>
