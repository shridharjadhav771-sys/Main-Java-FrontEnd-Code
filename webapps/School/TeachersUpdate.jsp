<%@ page import="java.util.List" %>
<%@ page import="School.trn.trn_teachers.TeachersDTO" %>
<%@ page import="School.Mst.Mst_departments.DepartmentsDTO" %>
<%@ page import="School.Mst.Mst_designation.DesignationDTO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Teacher</title>
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
<div class="container mt-5 bg-dark">
    <h2 class="mb-4">Update Teacher</h2>

    <%
        TeachersDTO teacher = (TeachersDTO) request.getAttribute("teacher");
        List<DepartmentsDTO> departments = (List<DepartmentsDTO>) request.getAttribute("departments");
        List<DesignationDTO> designations = (List<DesignationDTO>) request.getAttribute("designations");

        if (teacher != null) {
    %>

    <form action="updateTeacher" method="post" name="updateForm" onsubmit="return validateUpdate();">
        <!-- Hidden field to keep teacher ID -->
        <input type="hidden" name="teacher_id" value="<%= teacher.getTeacher_id() %>">

        <div class="row mb-3">
            <div class="col">
                <input type="text" name="name" class="form-control" placeholder="Teacher Name"
                       value="<%= teacher.getName() %>" required>
                <span id="nameError" style="color: red"></span>
            </div>
            <div class="col">
                <input type="text" name="email" id="emailid" class="form-control" placeholder="Teacher Email"
                       value="<%= teacher.getEmail() %>" required>
                <span id="emailError" style="color: red"></span>
            </div>
            <div class="col">
                <input type="text" name="contact" id="contactid" class="form-control" placeholder="Contact Number"
                       value="<%= teacher.getContact() %>" required maxlength="10">
                <span id="contactError" style="color: red"></span>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col">
                <select name="dept_id" id="dept_id" class="form-select" required>
                    <option value="">Select Department</option>
                    <%
                        if (departments != null) {
                            for (DepartmentsDTO dept : departments) {
                                String selected = (dept.getDept_id() == teacher.getDept_id()) ? "selected" : "";
                    %>
                        <option value="<%= dept.getDept_id() %>" <%= selected %>><%= dept.getDept_name() %></option>
                    <%
                            }
                        }
                    %>
                </select>
                <span id="deptError" style="color: red"></span>
            </div>

            <div class="col">
                <select name="designation_id" id="designation_id" class="form-select" required>
                    <option value="">Select Designation</option>
                    <%
                        if (designations != null) {
                            for (DesignationDTO desig : designations) {
                                String selected = (desig.getDesignation_id() == teacher.getDesignation_id()) ? "selected" : "";
                    %>
                        <option value="<%= desig.getDesignation_id() %>" <%= selected %>><%= desig.getDesignation_name() %></option>
                    <%
                            }
                        }
                    %>
                </select>
                <span id="desigError" style="color: red"></span>
            </div>
        </div>

        <div class="d-grid gap-2">
            <button type="submit" class="btn btn-success">Update Teacher</button>
        </div>
    </form>

    <div class="mt-3">
        <a href="teachersList" class="btn btn-secondary">Back to List</a>
    </div>

    <%
        } else {
    %>
        <div class="alert alert-danger">Teacher data not found!</div>
    <%
        }
    %>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
function validateUpdate() {
	
	// Clear previous errors
    $("#nameError").html('');
    $("#emailError").html('');
    $("#contactError").html('');
    $("#deptError").html('');
    $("#desigError").html('');

	
   /*  document.getElementById("nameError").innerHTML = '';
    document.getElementById("emailError").innerHTML = '';
    document.getElementById("contactError").innerHTML = '';
    document.getElementById("deptError").innerHTML = '';
    document.getElementById("desigError").innerHTML = ''; */

    var name = $('input[name="name"]').val().trim();
    console.log('Name: ' + name);

    var email = $("#emailid").val().trim();
    console.log('Email: '+email)
    
    var contact = $("#contactid").val().trim();
    console.log('Contact: '+contact)
    
    /* 
    var contact = document.getElementById("contactid").value.trim();
    var dept = document.updateForm.dept_id.value;
     */
    
    var dept = $("#dept_id").val().trim();
    console.log('Department: '+dept)
    
    var desig = $("#designation_id").val().trim(); 
    console.log('Designation: '+desig)

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
    /* 
    if(name === '') {
        document.getElementById("nameError").innerHTML = "Name is required.";
        isValid = false;
    }

    if(email === '' || !emailRegex.test(email)) {
        document.getElementById("emailError").innerHTML = "Enter valid email.";
        isValid = false;
    }

    if(contact === '' || contact.length !== 10 || isNaN(contact)) {
        document.getElementById("contactError").innerHTML = "Enter 10-digit valid contact.";
        isValid = false;
    }

    if(dept === '') {
        document.getElementById("deptError").innerHTML = "Select a department.";
        isValid = false;
    }

    if(desig === '') {
        document.getElementById("desigError").innerHTML = "Select a designation.";
        isValid = false;
    }
 */
 
    return isValid;
}
</script>

</body>
</html>
