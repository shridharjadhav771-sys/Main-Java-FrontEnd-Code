<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="School.Mst.Mst_Classes.ClassesDTO" %>
<%@ page import="School.Mst.Mst_Courses.CoursesDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<style>
    body {
        background-image: url('Images/img5.jpg');
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
</style>
<body>

<!-- Include nav -->


<div class="container mt-5 mb-5 bg-dark">
<%@ include file="nav.jsp" %>
<div class="container mt-2 bg-dark text-white p-4 rounded shadow">
        <h2 class="text-center mb-4">Add Student</h2> 
        <form action="students" method="post" name="studentForm" id="contactForm">
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
                    <%
                        List<ClassesDTO> classList = (List<ClassesDTO>) request.getAttribute("classes");
                        if (classList != null && !classList.isEmpty()) {
                            for (ClassesDTO cls : classList) {
                    %>
                        <option value="<%= cls.getClassId() %>"><%= cls.getClassName() %></option>
                    <%
                            }
                        }
                    %>
                </select>
                <span id="classError" style="color: grey"></span>
            </div>

            <!-- Course dropdown -->
            <div class="mb-3">
                <label for="course_id" class="form-label">Select Course</label>
                <select class="form-select" id="course_id" name="course_id" required>
                    <option value="">-- Select Course --</option>
                    <%
                        List<CoursesDTO> courseList = (List<CoursesDTO>) request.getAttribute("courses");
                        if (courseList != null && !courseList.isEmpty()) {
                            for (CoursesDTO course : courseList) {
                    %>
                        <option value="<%= course.getCourse_id() %>"><%= course.getCourse_name() %></option>
                    <%
                            }
                        }
                    %>
                </select>
                <span id="courseError" style="color: grey"></span>
            </div>

            <!-- Buttons -->
            <div class="d-grid gap-2">
                <button type="button" onclick="validateInfo()"  class="btn btn-primary">Add Student</button>
                <a href="studentList" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
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
		
		var gender = $('input[name="gender"]').val().trim();
		console.log('Gender: '+gender);
		
		var contact = $("#contact").val().trim();
		console.log('Console: '+contact);
		
		var classes = $("#class_id").val().trim();
		console.log('Class: '+classes);
		
		var courses = $("#course_id").val().trim();
		console.log('Course:+ '+courses);
		
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
		/* 
		var name = document.studentForm.name.value;
		if(name == ''){
			document.getElementById("nameError").innerHTML = 'This is required.';
		}
		var dob = document.studentForm.dob.value;
		if(dob == ''){
			document.getElementById("dobError").innerHTML = 'Please choose valid date';
		}
		
		var gender = document.studentForm.gender.value;
		if(gender == ''){
			document.getElementById("genderError").innerHTML = 'Please choose gender';
		}
		
		var contact = document.studentForm.contact.value;
		if(contact == '' || contact.length != 10){
			document.getElementById("contactError").innerHTML = 'Please Enter contact no.';
		}
		
		var class_id = document.studentForm.class_id.value;
		if(class_id == ''){
			document.getElementById("classError").innerHTML = 'Please choose class';
		}
		
		var course_id = document.studentForm.course_id.value;
		if(course_id == ''){
			document.getElementById("courseError").innerHTML = 'Please choose course';
		}
		
		console.log('Name: ' + name);
		console.log('dob: '+ dob);
		console.log('gender: '+ gender);
		console.log('contact: ' + contact);
		console.log('class_id: ' + class_id);
		console.log("course_id: "+ course_id);
		 */
		 
		if(isValid){
	        //document.studentForm.submit();
	        $.ajax({
	        	url : 'students',
	        	type : 'POST',
	        	data:  $("#contactForm").serialize(),
	        	success: function(data){
	        		console.log(data);
					if(data === 'success'){
						window.location.href = "studentList";
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
		})
	}
</script>
</body>
</html>
