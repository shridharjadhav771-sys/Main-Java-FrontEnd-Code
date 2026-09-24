<%@ page import="java.util.List" %>
<%@ page import="School.Mst.Mst_Courses.CoursesDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Courses List</title>
    <!-- Bootstrap CSS CDN -->
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
        <h2 class="mb-4">Courses List</h2>
   <div class="text-end">
   	
    <button type="button" class="btn btn-primary mb-3 " data-bs-toggle="modal" data-bs-target="#addCourseModal">
  	Add New Course
	</button>
   </div>
        <table class="table table-bordered table-hover text-center table-transparent table-striped">
            <thead>
                <tr>
                    <th>Course ID</th>
                    <th>Course Name</th>
                    <th>Course Duration</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="coursesTblBody">
            
                <!-- Add more rows dynamically if integrating with backend -->
            </tbody>
        </table>
      </div>  
        <div class="mt-4">

	
	<div class="modal fade" id="addCourseModal" tabindex="-1" aria-labelledby="addCourseModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content text-dark">
      <div class="modal-header">
        <h5 class="modal-title" id="addCourseModalLabel">Add New Course</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
        	<form action="course" method="post" id="courseForm">
        				<input type="hidden" name="course_id" id="course_id">
        				
        				<input type ="hidden" name="action" id="actionID">
        				
        				
                        <div class="form-group mb-3">
                            <label for="courseName">Course Name</label>
                            <input type="text" class="form-control" id="courseName" name="course_name" placeholder="Enter course name" required>
                            <span id="nameError" style="color: red"></span>
                        </div>

						<div class="form-group mb-3">
                            <label for="courseDuration">Course Duration</label>
                            <input type="text" class="form-control" id="courseDuration" name="course_duration" placeholder="Enter course name" required>
                            <span id="courseDurationError" style="color: red"></span>
                        </div>
                        <!-- Optional Hidden Field -->
                        <input type="hidden" name="isDeleted" value="0">

            <button type="button" onclick="validateInfo()" class="btn btn-primary" id="addbtnID">Add Course</button>
                    </form>
      </div>
    </div>
  </div>
</div>
	
    </div>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	
    <!-- Bootstrap JS CDN (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script type="text/javascript">
    
    $(document).ready(function(){
        loadCoursesList();
    });

    
    function validateInfo(){
    	$("#nameError").html('');
    	$("#courseDurationError").html('');
    	
    	var name = $("#courseName").val().trim();
    	var duration = $("#courseDuration").val().trim();
    	
    	var isValid = true;
    	
    	if(name === ''){
    		$("#nameError").html("Name is required.");
    		isValid = false;
    	}
    	
    	if(duration === ''){
    		$("#courseDurationError").html("Course Duration is required.");
    		isValid = false;
    	}
    	
    	if(isValid){
    		
    		$.ajax({
    			url : 'course',
    			type : 'POST',
    			data : $('#courseForm').serialize(),
    			success : function(data){
    				console.log(data);
    				if(data === 'success'){
    					loadCoursesList();
    					$('#addCourseModal').modal('hide');
    				}else{
    					console.log("Not Saved...");
    				}
    			},failure : function(data){
    				alert('Something went wrong. Please try again');
    			}
    		});
    	}
    }
    
    function doDelete(course_id){
        if(confirm("Delete this course?")){
            $.ajax({
                url : 'course',
                type : 'POST',
                data : { action: 'delete', course_id: course_id },   
                success : function(data){
                    console.log("Delete response:", data);
                    if(data.trim() === 'success'){
                        loadCoursesList();
                    } else {
                        alert("Delete failed!");
                    }
                },
                error : function(xhr){
                    alert('Error: ' + xhr.responseText);
                }
            });
        }
    }
    
    function loadCoursesList(){
    	$.ajax({
    		url: 'course',
    		type: 'GET',
    		data:{
    			action: 'list'
    		},
    		success: function(data){
    			var res = eval(data);
    			console.log(res);
    			
    			$("#coursesTblBody").empty();
    			$.map(res, function(course){
    				var rowData = createRowElement(course);
    				
    				$("#coursesTblBody").append(rowData);
    			});
    		},error: function(){
    			alert('Error fetching courses data');
    		}
    	});
    }
    
    function createRowElement(course){
    	var rowData = "<tr>";
    	rowData += "<td>"+ course.course_id + "</td>";
    	rowData += "<td>"+ course.course_name + "</td>";
    	rowData += "<td>"+ course.course_duration + "</td>";
    	rowData += "<td>";
    	rowData += "<button class='btn btn-sm btn-primary' onclick='editCourse(" + course.course_id + ")'>Edit</button> ";
    	rowData += "<button type='button' class='btn btn-sm btn-danger' onclick='doDelete(" + course.course_id + ", event)'>Delete</button>";
    	rowData += "</td>";
    	rowData +="</tr>";
    	return rowData;
    }
    
    function editCourse(course_id){
    	$('#addCourseModalLabel').text('Edit Course');
    	$('#submitButton').text('Update Course');
    	
    	$.ajax({
    		url : 'course',
    		type : 'GET',
    		data : {course_id : course_id},
    		success : function(data){
    			console.log(data);
    			var course = eval(data);
    			if(course){
    				$("#actionID").val('update');
    				$('#course_id').val(course.course_id);
    				$('#courseName').val(course.course_name);
    				$('#courseDuration').val(course.course_duration)
    				$('#addbtnID').text('Update');
    				$('#addCourseModal').modal('show');
    			}else{
    				alert('Failed to load teacher data.');
    			}
    		},
    		
    		error: function(){
    			alert('Error fetching course data.');
    		}
    	});
    }
    
    $(document).on('click','[data-bs-target="#addCourseModal"]', function(){
    	$('#addCourseModalLabel').text("Add New Course");
    	$('#submitButton').text('Add Course');
    	$('#courseForm')[0].reset();
    	$('#course_id').val('');
    	$('#nameError, #courseDurationError').html('');
    });
    
    </script>
</body>
</html>



