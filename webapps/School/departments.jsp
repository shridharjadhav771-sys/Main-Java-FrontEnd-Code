<%@ page import="java.util.List" %>
<%@ page import="School.Mst.Mst_departments.DepartmentsDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Departments</title>
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
<div class="container mt-5 text-light" style="background-color: rgba(0,0,0,0.5); border-radius: 12px; padding:20px;">
<%@ include file="nav.jsp" %>
    <h2 class="mb-4">Departments List</h2>

    <div class="mb-3 text-end">
	<button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addDeptModal">Add New Class</button>
    </div>

    <table class="table table-bordered table-hover text-center table-striped table-transparent">
        <thead>
        <tr>
            <th>Department ID</th>
            <th>Department Name</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody id="deptTblBody">
       
        </tbody>
    </table>
</div>

<div class="mt-4">

	
	<div class="modal fade" id="addDeptModal" tabindex="-1" aria-labelledby="addDeptModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content text-dark">
      <div class="modal-header">
        <h5 class="modal-title" id="addDeptModalLabel">Add New Department</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
        	<form action="department" method="post" id="deptForm">
        	
        		<input type="hidden" name="dept_id" id="dept_id">
        				
        				<input type ="hidden" name="action" id="actionID">
                        <div class="form-group mb-3">
                        	
                            <label for="deptName">Department Name</label>
                            <input type="text" class="form-control" id="deptName" name="dept_name" placeholder="Enter department name" required>
                            <span id="nameError" style="color: red"></span>
                        </div>
                        <button type="button" onclick="validateInfo()" class="btn btn-primary" id="addbtnID">Add Department</button>
                    </form>
      </div>
    </div>
  </div>
</div>
	
    </div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
    loadDeptList();
});

function validateInfo(){
    $("#nameError").html('');
    var name = $('#deptName').val().trim();
    var isValid = true;
    if(name === ''){
        $("#nameError").html("Department name is required.");
        isValid = false;
    }
    if(isValid){
        $.ajax({
            url: '<%=request.getContextPath()%>/department',
            type: 'POST',
            data: $('#deptForm').serialize(),
            success: function(data){
                console.log("save response:", data);
                if (data.trim() === 'success') {
                    loadDeptList();
                    $('#addDeptModal').modal('hide');
                    $('#deptForm')[0].reset();
                } else {
                    alert('Failed to save department. Please try again.');
                }
            },
            error: function(xhr, status, err) {
                console.error("Save error:", status, err, xhr.responseText);
                alert('Something went wrong. Please try again.');
            }
        });
    }
}

function loadDeptList(){
    $.ajax({
        url: '<%=request.getContextPath()%>/department',
        type: 'GET',
        data: { action: 'list' },
        dataType: 'json',
        success: function(data){
            console.log("loadDeptList response:", data);
            $("#deptTblBody").empty();
            $.each(data, function(index, dept){
                var rowData = createRowElement(dept);
                $("#deptTblBody").append(rowData);
            });
        },
        error: function(xhr, status, err){
            console.error("Error fetching departments:", status, err, "response:", xhr.responseText);
            alert('Error fetching departments data.');
        }
    });
}

function createRowElement(dept){
    var rowData = "<tr>";
    rowData += "<td>" + dept.dept_id + "</td>";
    rowData += "<td>" + dept.dept_name + "</td>";
    rowData += "<td>";
    rowData += "<button class='btn btn-sm btn-primary' onclick='editDept(" + dept.dept_id + ")'>Edit</button> ";
    rowData += "<button type='button' class='btn btn-sm btn-danger' onclick='doDelete(" + dept.dept_id + ")'>Delete</button>";
    rowData += "</td>";
    rowData += "</tr>";
    return rowData;
}

function editDept(dept_id){
    $("#addDeptModalLabel").text("Edit Department");

    $.ajax({
        url: '<%=request.getContextPath()%>/department',
        type: 'GET',
        data: { dept_id: dept_id },
        dataType: 'json',
        success: function(data){
            console.log("editDept response:", data);
            if(data){
                $('#actionID').val('update');
                $('#dept_id').val(data.dept_id);
                $('#deptName').val(data.dept_name);
                $('#addbtnID').text('Update');
                $('#addDeptModal').modal('show');
            } else {
                alert('Failed to load department data.');
            }
        },
        error: function(xhr, status, err){
            console.error("Error fetching department data:", status, err, xhr.responseText);
            alert('Error fetching department data.');
        }
    });
}

function doDelete(dept_id){
    if(confirm('Are you sure you want to delete this department?')){
        $.ajax({
            url: '<%=request.getContextPath()%>/department',
            type: 'POST',
            data: { action: 'delete', dept_id: dept_id },
            success: function(data){
                console.log("delete response:", data);
                if (data.trim() === 'success') {
                    loadDeptList();
                } else {
                    alert('Failed to delete department.');
                }
            },
            error: function(xhr, status, err){
                console.error("Delete error:", status, err, xhr.responseText);
                alert('Error deleting department.');
            }
        });
    }
}

$(document).on('click', '[data-bs-target="#addDeptModal"]', function() {
    $('#addDeptModalLabel').text("Add New Department");
    $('#addbtnID').text('Add Department');
    $('#actionID').val('');
    $('#deptForm')[0].reset();
    $('#nameError').html('');
});
</script>

</body>
</html>
