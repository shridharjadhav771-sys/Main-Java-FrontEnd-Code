<%@ page import="java.util.List" %>
<%@ page import="School.trn.trn_students.StudentsDTO" %>
<%@ page import="School.Mst.Mst_Classes.ClassesDTO" %>
<%@ page import="School.Mst.Mst_Courses.CoursesDTO" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Edit Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
</head>
<body>
<div class="container mt-5 bg-dark mb-5">
<div class="container mt-3 bg-dark text-white p-4 rounded shadow">
    <h2 class="text-center mb-4">Edit Student</h2>
    <%
      StudentsDTO student = (StudentsDTO) request.getAttribute("student");
      List<ClassesDTO> classList = (List<ClassesDTO>) request.getAttribute("classes");
      List<CoursesDTO> courseList = (List<CoursesDTO>) request.getAttribute("courses");
    %>
    <form action="updateStudent" method="post" name="studentUpdate" onsubmit="return validateUpdate();">
      <!-- include hidden PK -->
      <input type="hidden" name="student_id" value="<%= student.getStudent_id() %>"/>

      <!-- Name -->
      <div class="mb-3">
        <label for="student_name" class="form-label">Student Name</label>
        <input type="text" class="form-control" id="student_name" name="name"
               value="<%= student.getStudent_name() %>" >
               <span id="nameError" style="color: red"></span>
      </div>

      <!-- DOB -->
      <div class="mb-3">
        <label for="dob" class="form-label">Date of Birth</label>
        <input type="date" class="form-control" id="dob" name="dob"
               value="<%= student.getDob() %>" required>
               <span id="dobError" style="color: black"></span>
      </div>

      <!-- Gender -->
      <div class="mb-3">
        <label class="form-label">Gender</label><br>
        <div class="form-check form-check-inline">
          <input class="form-check-input" type="radio" name="gender" id="male" value="Male"
            <%= "Male".equals(student.getGender()) ? "checked" : "" %> required>
          <label class="form-check-label" for="male">Male</label>
        </div>
        <div class="form-check form-check-inline">
          <input class="form-check-input" type="radio" name="gender" id="female" value="Female"
            <%= "Female".equals(student.getGender()) ? "checked" : "" %>>
          <label class="form-check-label" for="female">Female</label>
        </div>
        <span id="genderError" style="color: black"></span>
      </div>

      <!-- Contact -->
      <div class="mb-3">
        <label for="contact" class="form-label">Contact</label>
        <input type="text" class="form-control" id="contact" name="contact"
               value="<%= student.getContact() %>" required>
               <span id="contactError" style="color: black"></span>
      </div>

      <!-- Class -->
      <div class="mb-3">
    <label for="class_id" class="form-label">Select Class</label>
    <select class="form-select" id="class_id" name="class_id" required>
        <option value="">-- Select Class --</option>
        <%
            if (classList != null) {
                for (ClassesDTO cls : classList) {
                    String sel = cls.getClassId() == student.getClass_id() ? "selected" : "";
        %>
            <option value="<%= cls.getClassId() %>" <%= sel %>><%= cls.getClassName() %></option>
        <%
                }
            }
        %>
    </select>
    <span id="classError" style="color: black"></span>
</div>


      <!-- Course -->
      <div class="mb-3">
    <label for="course_id" class="form-label">Select Course</label>
    <select class="form-select" id="course_id" name="course_id" required>
        <option value="">-- Select Course --</option>
        <%
            if (courseList != null) {
                for (CoursesDTO co : courseList) {
                    String selCo = co.getCourse_id() == student.getCourse_id() ? "selected" : "";
        %>
            <option value="<%= co.getCourse_id() %>" <%= selCo %>><%= co.getCourse_name() %></option>
        <%
                }
            }
        %>
    </select>
    <span id="courseError" style="color: black"></span>
</div>


      <!-- Actions -->
      <div class="d-grid gap-2">
        <button type="submit"  class="btn btn-primary">Save Changes</button>
        <a href="studentList" class="btn btn-secondary">Cancel</a>
      </div>
    </form>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
	function validateUpdate(){
		$("#nameError").html('');
		$("#dobError").html('');
		$("#genderError").html('');
		$("#contactError").html('');
		$("#classError").html('');
		$("#courseError").html('');
		
		
		var isValid = true;

		
		var name = $('input[name="name"]').val().trim();
		console.log('Name: '+name);
		
		var dob = $('#dob').val().trim();
		console.log('DOB: '+dob);
		
		var gender = $('input[name="gender"]:checked').val();
		console.log('Gender: '+gender);
		
		var contact = $('#contact').val().trim();
		console.log('Contact: '+contact);
		
		var classes = $('#class_id').val().trim();
		console.log('Class: '+classes);
		
		var courses = $("#course_id").val().trim();
		console.log('Course: '+courses);
		
		
		if(name === ''){
			$("#nameError").html("Name is required.");
	        isValid = false;
	    }

		if(dob === ''){
			$("#dobError").html("Please pick dob.");
			isValid = false;
		}
	    
		if (!gender) {
		    $("#genderError").html("Please select gender.");
		    isValid = false;
		}
		
		
	    if (contact === '' || contact.length !== 10 || isNaN(contact)){
	    	$("#contactError").html("Please enter a valid 10-digit contact.");
	    	isValid = false;
	    }
	    
	    if(classes === ''){
	    	$("#classError").html("Please select class.");
	    	isValid = false;
	    }
	    
	    if(courses === ''){
	    	$("#courseError").html("please select course.");
	    	isValid = false;
	    }
	    
		
	    return isValid;
	}
</script>
</body>
</html>
