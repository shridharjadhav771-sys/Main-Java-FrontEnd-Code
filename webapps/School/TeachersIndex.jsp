<%@ page import="java.util.List" %>
<%@ page import="School.Mst.Mst_departments.DepartmentsDTO" %>
<%@ page import="School.Mst.Mst_designation.DesignationDTO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Teacher</title>
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
<%@ include file="nav.jsp" %>
    <h2 class="mb-4">Add New Teacher</h2>

    <form action="teachers" method="post" name="teacherform" id="contactForm">
        <div class="row mb-3">
            <div class="col">
                <input type="text" name="name" class="form-control" placeholder="Teacher Name" required>
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
                   
                </select>
                <span id="desigError" style="color: red"></span>
            </div>
        </div>

        <div class="d-grid gap-2">
            <button type="button" onclick="validateInfo()" class="btn btn-primary">Add Teacher</button>
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	 console.log('page load');
	 loadDepartmentList();
	 loadDesignationList();
});

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
   /* 
    
    var contactNum = document.getElementById("contactid").value.trim();
    var dept_id = document.teacherform.dept_id.value;
    var designation_id = document.teacherform.designation_id.value;

    

    if(name == ''){
    	$("#nameError").html('<b>This is required.</b>');
        isValid = false;
    }

    if(email == '' || !emailRegex.test(email)) {
        document.getElementById("emailError").innerHTML = 'Please enter a valid email.';
        isValid = false;
    }

    if(contactNum == '' || contactNum.length != 10 || isNaN(contactNum)) {
        document.getElementById("contactError").innerHTML = 'Please enter a valid 10-digit contact.';
        isValid = false;
    }

    if(dept_id == ''){
        document.getElementById("deptError").innerHTML = 'Please select valid department.';
        isValid = false;
    }

    if(designation_id == ''){
        document.getElementById("desigError").innerHTML = 'Please select valid designation.';
        isValid = false;
    } */

    if(isValid){
       // document.teacherform.submit();
       
       $.ajax({
    	   url : 'teachers',
    	   type : 'POST',
    	   data : $('#contactForm').serialize(),
    	   success : function(data){
    		   console.log(data);
    		   if(data === 'success'){
    			   window.location.href = "teachersList";
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
		url: "techerinfo",
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
			});
		},
		failure: function(data){
			console.log(data);
		}
		
	});
}

function loadDesignationList(){
	$.ajax({
		url:'designation' ,
		type: 'GET',
		data: {action: 'list'},
		success: function(data){
			var res = eval(data);
			console.log(res);
			
			$.map(res, function(desig){
				console.log(desig.designation_id + ' ' + desig.designation_name);
				var optionData = '<option value='+ desig.designation_id +'>' + desig.designation_name + '</option>';
				$("#designation_id").append(optionData)
			});
		},
		failure: function(data){
			console.log(data);
		}
	});
}

</script>

</body>
</html>
