<%@ page import="java.util.List" %>
<%@ page import="School.Mst.Mst_designation.DesignationDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Designations List</title>
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
    <h2 class=" mb-4">Designations List</h2>

    <div class="mb-3 text-end">
        	<button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addDesigModal">Add New Designation</button>

    </div>

    <table class="table table-bordered table-hover text-center table-striped table-transparent">
        <thead >
        <tr>
            <th>ID</th>
            <th>Designation Name</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody id="desigTblBody">
        
        </tbody>
    </table>
</div>

<div class="mt-4">

	
	<div class="modal fade" id="addDesigModal" tabindex="-1" aria-labelledby="addDesigModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content text-dark">
      <div class="modal-header">
        <h5 class="modal-title" id="addDesigModalLabel">Add New Course</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
        	<form action="designation" method="post" id="desigForm">
        		
        			<input type="hidden" name="designation_id" id="designation_id">
        			
        			<input type="hidden" name="action" id="actionID">
                        <div class="form-group mb-3">
                            <label for="designationName">Designation Name</label>
                            <input type="text" class="form-control" id="designationName" name="designation_name" placeholder="Enter designation name" required>
                        	<span id="nameError" style="color: red"></span>
                        	
                        </div>

                        <!-- Optional isDeleted field (hidden, default 0) -->
                        <input type="hidden" name="isDeleted" value="0">
		       <button type="button" onclick="validateInfo()" class="btn btn-primary" id="addbtnID">Add Designation</button>
		
                    </form>
      </div>
    </div>
  </div>
</div>
	
    </div>
    
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
    loadDesigList();
});

function validateInfo(){
	$("#nameError").html('');
	
	var name = $('#designationName').val().trim();
	var isValid = true;
	
	if(name === ''){
		$("#nameError").html("Name is required.");
		isValid = false;
	}
	
	if(isValid){
		$.ajax({
			url : 'designation',
			type : 'POST',
			data : $('#desigForm').serialize(),
			success : function(data){
				console.log(data);
				if(data ==='success'){
					loadDesigList();
					$('addDesigModal').modal('hide');
				}else{
					console.log("Not Saved...");
				}
			},
			error : function(){
				alert('Something went wrong. Please try again');
			}
		});
	}
}

function loadDesigList(){
	$.ajax({
		url : 'designation',
		type : 'GET',
		data : {
			action : 'list'
		},
		dataType : 'json',
		success : function(data){
			$("#desigTblBody").empty();
			$.each(data, function(index, desigs){
				var rowData = createRowElement(desigs);
				$("#desigTblBody").append(rowData);
			});
		},
		error: function() {
            alert('Error fetching classes data.');
        }
	});
}

function createRowElement(desig){
	var rowData = "<tr>";
	rowData += "<td>" + desig.designation_id + "</td>";
	rowData += "<td>" + desig.designation_name + "</td>";
	rowData += "<td>";
    rowData += "<button class='btn btn-sm btn-primary' onclick='editDesig(" + desig.designation_id + ")'>Edit</button> ";
    rowData += "<button type='button' class='btn btn-sm btn-danger' onclick='doDelete(" + desig.designation_id + ", event)'>Delete</button>";
    rowData += "</td>";
    rowData += "</tr>";
    return rowData;
}

function doDelete(designation_id, event){
	if(confirm('Are you sure you want to delete this class?')){
		$.ajax({
			url : 'designation',
			type : 'POST',
			data :{action : 'delete' , designation_id : designation_id},
			success : function(data){
				if(data === 'success'){
					loadDesigList();
				}else{
					alert('Failed to delete designation.');
				}
			},
			error: function() {
                alert('Error deleting designation.');
            }
		});
	}
}

function editDesig(designation_id){
	$('#addDesigModalLabel').text('Edit Designation');
	
	$.ajax({
		url : 'designation',
		type : 'GET',
		data : {designation_id : designation_id},
		dataType: 'json',
		success : function(data){
			if(data){
				$('#actionID').val('update');
				$('#designation_id').val(data.designation_id);
				$('#designationName').val(data.designation_name);
				$('#addbtnID').text('Update');
                $('#addDesigModal').modal('show');
			}else {
                alert('Failed to load class data.');
            }
		},
		error : function(){
			alert('Error fetching designation data.');
		}
	});
}


$(document).on('click', '[data-bs-target="#addDesigModal"]', function() {
    $('#addDesigModalLabel').text("Add New Designation");
    $('#addbtnID').text('Add Designation');
    $('#actionID').val('');
    $('#classForm')[0].reset();
    $('#nameError').html('');
});
</script>
</body>
</html>
