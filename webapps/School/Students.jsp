<%@ page import="java.util.List" %>
<%@ page import="School.trn.trn_students.StudentsDTO" %>
<%@ page import="School.Mst.Mst_Classes.ClassesDTO" %>  
<%@ page import="School.Mst.Mst_Courses.CoursesDTO" %> 
<!DOCTYPE html>


<html>
<head>
    <meta charset="UTF-8">
    <title>Student Directory</title>
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
	
	int rows = request.getParameter("rows")==null?10:Integer.parseInt(request.getParameter("rows"));
	%>                                               

    <h2 class="mb-4">Students List</h2>
    
   <form action="students" name="searchform" method="get" class="row gx-3 gy-2 align-items-center mb-4">
    <input type="hidden" name="cpage" value="1"/>

    <!-- Search Box --> 
    <div class="col-auto">
        <input type="text" name="query" class="form-control" placeholder="Enter search term" id="query">
    </div>

    <!-- Class Dropdown -->
    <div class="col-auto">
        <select class="form-select" name="class_id" id="searchClassId">
            <option value="">-- Select Class --</option> 
            
        </select>
    </div>

    <!-- Course Dropdown -->
    <div class="col-auto">
        <select class="form-select" name="course_id" id="searchCourseId">
            <option value="">-- Select Course --</option>
            
        </select>
    </div>
    <div class="col-auto">
       <input type="number" value="<%=rows %>" name="rows" id="rows" class="form-control">
    </div>

    
    <div class="col-auto">
    	<select class="form-select" name="sort_column">
    		<option value="student_id" <%= "student_id".equals(request.getAttribute("sortColumn"))? "selected" :"" %>>Sort by ID</option>
    		<option value="student_name" <%= "student_name".equals(request.getAttribute("sortColumn"))? "selected" :"" %>>Sort by Name</option>
    		<option value="dob" <%= "dob".equals(request.getAttribute("sortColumn"))? "selected" :"" %>>Sort by DOB</option>
    		<option value="gender" <%= "gender".equals(request.getAttribute("sortColumn"))? "selected" :"" %>>Sort by Gender</option>
    		<option value="contact" <%= "contact".equals(request.getAttribute("sortColumn"))? "selected" :"" %>>Sort by Contact</option>
    		<option value="class_name" <%= "class_name".equals(request.getAttribute("sortColumn"))? "selected" :"" %>>Sort by Class</option>
    		<option value="course_name" <%= "course_name".equals(request.getAttribute("sortColumn"))? "selected" :"" %>>Sort by Course</option>
    	</select>
    </div>
    <div class="col-auto">
        <button type=button class="btn btn-primary" onclick="loadStudentList()">Search</button>
    </div>
</form>
	
	
    
    <table class="table table-bordered table-hover text-center table-striped table-dark table-transparent">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>DOB</th>
                <th>Gender</th>
                <th>Contact</th>
                <th>Class</th>
                <th>Course</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody id="studentTblBody">
        
        </tbody>
    </table>
   
    <div class="mt-3">        
         <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#addStudentModal">
 			 Add New Student
		</button>
		<div class="modal fade" id="addStudentModal" tabindex="-1" aria-labelledby="addStudentModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content text-dark">
      <div class="modal-header">
        <h5 class="modal-title" id="addStudentModalLabel">Add New Teacher</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
        <form action="students" method="post" name="studentForm" id="contactForm">
        
        <input type="hidden" name="student_id" id="student_id">
        
        <input type="hidden" name="action" id="actionID"/>
            <!-- Student Name -->
            <div class="mb-3">
                <label for="student_name" class="form-label">Student Name</label>
                <input type="text" class="form-control" id="student_name" name="name" required>
                <span id="nameError" style="color: grey"></span>
                
            </div>

            <!-- Date of Birth -->
            <div class="mb-3">
                <label for="dob" class="form-label">Date of Birth</label>
                <input type="date" class="form-control" id="dob" name="dob" required>
                <span id="dobError" style="color: grey"></span>
            </div>

            <!-- Gender -->
            <div class="mb-3">
                <label class="form-label">Gender</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="Male" id="male" required>
                    <label class="form-check-label" for="male">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="Female" id="female">
                    <label class="form-check-label" for="female">Female</label>
                </div>
                <span id="genderError" style="color: grey"></span>
            </div>

            <!-- Contact -->
            <div class="mb-3">
                <label for="contact" class="form-label">Contact</label>
                <input type="text" class="form-control" id="contact" name="contact" onblur="doCheckContact(this.value)" required maxlength="10">
                <span id="contactError" style="color: grey"></span>
            </div>

            <!-- Class dropdown -->
            <div class="mb-3">
                <label for="class_id" class="form-label">Select Class</label>
                <select class="form-select" id="class_id" name="class_id" required>
                    <option value="">-- Select Class --</option>
                </select>
                <span id="classError" style="color: grey"></span>
            </div>

            <!-- Course dropdown -->
            <div class="mb-3">
                <label for="course_id" class="form-label">Select Course</label>
                <select class="form-select" id="course_id" name="course_id" required>
                    <option value="">-- Select Course --</option>
                </select>
                <span id="courseError" style="color: grey"></span>
            </div>

            <!-- Buttons -->
            <div class="d-grid gap-2">
                <button type="button" onclick="validateInfo()"  class="btn btn-primary" id="addbtnID">Add Student</button>
                <a href="studentList" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
      </div>
    </div>
  </div>
</div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	 console.log('page load');
	 loadStudentList();
	 loadClassesList();
	 loadCoursesList();
});


function loadStudentList(){
	
	$.ajax({
		url: 'studentList',
		type: 'GET',
		data: {
			query: $("#query").val(),
            class_id: $("#searchClassId").val(),
            course_id: $("#searchCourseId").val(),
            rows: $("#rows").val(),
            sort_column: $("select[name='sort_column']").val(),
            cpage: 1
		},
		success: function(data){
			console.log(data);
			var students = eval(data);
			$("#studentTblBody").empty();
			$.map(students, function(student) {
				
				var rowData = "<tr>";
				rowData += "<td>" + student.student_id + "</td>";
				rowData += "<td>" + student.student_name + "</td>";
				rowData += "<td>" + student.dob + "</td>";
				rowData += "<td>" + student.gender + "</td>";
				rowData += "<td>" + student.contact + "</td>";
				rowData += "<td>" + student.class_name + "</td>";
				rowData += "<td>" + student.course_name + "</td>";

				rowData += "<td>";
				rowData += "<button class='btn btn-sm btn-primary' onclick='editStudent(" + student.student_id + ")'>Edit</button> ";
				rowData += "<button type='button' class='btn btn-sm btn-danger' onclick='doDelete(" + student.student_id + ", event)'>Delete</button>";
				rowData += "</td>";

				rowData += "</tr>";

				console.log(rowData);
				$("#studentTblBody").append(rowData);
			});			
		},
		error: function(){
			alert('Error fetching student data');
		}
	});
}



function validateInfo(){
	
	// JQuery Valisation
	
	$("#nameError").html('');
	$('#dobError').html('');
	$('#genderError').html('');
	$('#contactError').html('');
	$('#classError').html('');
	$('#courseError').html('');
	
	
	var name = $('input[name="name"]').val().trim();
	console.log('Name: '+name);
	
	var dob = $("#dob").val().trim();
	console.log('Dob: '+dob);
	
	var gender = $('input[name="gender"]:checked').val();
	console.log('Gender: '+gender);
	
	var contact = $("#contact").val().trim();
	console.log('Console: '+contact);
	
	var classes = $("#class_id").val().trim();
	console.log('Class: '+classes);
	
	var courses = $("#course_id").val().trim();
	console.log('Course:+ '+courses);
	
	var student_id = $("#student_id").val().trim();
	
	var isValid = true;
	
	if(name === ''){
		$("#nameError").html("Name is required.");
		isValid = false;
	}
	
	if(dob === ''){
		$("#dobError").html("Pick a date.");
		isValid = false;
	}
	
	if(gender === ''){
		$("#genderError").html("Select a gender.");
		isValid = false;
	}
	
	if(contact === '' || contact.length !== 10 || isNaN(contact)){
		$("#contactError").html("Please enter a valid 10-digit contact.");
		isValid = false;
	}
	
	if(classes === ''){
		$("#classError").html("Please select class.");
		isValid = false;
	}
	
	if(courses === ''){
		$("#courseError").html("Please select course.");
		isValid = false;
	}
	
	 
	if(isValid){
        //document.studentForm.submit();
        $.ajax({
        	url : 'students',
        	type : 'POST',
        	data:  $("#contactForm").serialize(),
        	success: function(data){
        		console.log(data);
				if(data === 'success'){
					window.location.href = "Students.jsp";
				}else{
					console.log("Not saved....");
				}
        		
        	},failure: function(data){
        		alert('Something wrong. Please try again');
        	}
        	
        });
    }

	
}

function doDelete(student_id){
	if (confirm("Delete this student?")){
		$("#actionID").val('delete');
		$('#student_id').val(student_id);
		$.ajax({
        	url : 'students',
        	type : 'POST',
        	data:  $("#contactForm").serialize(),
        	success: function(data){
        		console.log(data);
				if(data === 'success'){
					window.location.href = "Students.jsp";
				}else{
					console.log("Not saved....");
				}
        		
        	},failure: function(data){
        		alert('Something wrong. Please try again');
        	}
        	
        });
	}
}

function doCheckContact(contact){
	$('#contactError').html('');
	console.log("Contact: "+contact);
	$.ajax({
		url: "studentContact",
		type: "GET",
		data:{
			ContactVal : contact
		},
		success:function(resp){
			console.log(resp);
			if(resp === 'exist'){
				$('#contactError').html("This contact is already used. Please enter another.");
			}
		},
		failure:function(data){
			alert('Invalid request');
		}
	});
}

function loadClassesList(){
	$.ajax({
		url: 'class',
		type: 'GET',
		data : {action: 'list'},
		success : function(data){
			var res = eval(data);
			console.log(res);
			
			$.map(res, function(cls){
				console.log(cls.classId + ' '+ cls.className);
				var optionData = '<option value=' + cls.classId + '>' + cls.className + '</option>';
				$('#class_id').append(optionData),
				$('#searchClassId').append(optionData)
			});
		},
		failure: function(data){
			console.log(data);
		}
	});
}

function loadCoursesList(){
	$.ajax({
		url: 'course',
		type: 'GET',
		data : {action: 'list'},
		success : function(data){
			var res = eval(data);
			console.log(res);
			
			$.map(res, function(course){
				console.log(course.course_id + ' '+ course.course_name);
				var optionData = '<option value=' + course.course_id + '>' + course.course_name + '</option>';
				$('#course_id').append(optionData),
				$('#searchCourseId').append(optionData)
				
			});
		},
		failure: function(data){
			console.log(data);
		}
	});
}

function editStudent(studentId){
	$('#addStudentModalLabel').text('Edit Student');
	$('#submitButton').text('Update Student');
	
	$.ajax({
		url: 'students',
		type: 'GET',
		data: { student_id: studentId },
		success: function(data){
			console.log(data);
			var student = eval(data);
			if(student){
				$("#actionID").val('update');
				$('#student_id').val(student.student_id);
				$('#student_name').val(student.student_name);
				
				var today = new Date(student.dob);
			    var dd = String(today.getDate()).padStart(2, '0');
			    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
			    var yyyy = today.getFullYear();

			    var formattedDate = yyyy + '-' + mm + '-' + dd;

				$('#dob').val(formattedDate);
				
                $('input[name="gender"][value="' + student.gender + '"]').prop('checked', true);
                $('#contact').val(student.contact);
                $('#class_id').val(student.class_id);
                $('#course_id').val(student.course_id);
                $('#addbtnID').text('Update');
                $('#addStudentModal').modal('show');
			}else{
				alert('Failed to load student data.');
			}			
		},
		error: function(){
			alert('Error fetching student data.');
		}
	});
}

$(document).on('click', '[data-bs-target="#addStudentModal"]', function(){
	
	$('#addStudentModalLabel').text("Add New Student");
	$('#submitButton').text('Add Student');
	$('#contactForm')[0].reset();
	$('#student_id').val('');
	$('#nameError, #dobError, #genderError, #contactError, #classError, #courseError').html('');
});

function loadpage(pageno) {
    document.studentform.cpage.value = pageno;
    document.studentform.submit();
}
</script>
</body>
</html>
