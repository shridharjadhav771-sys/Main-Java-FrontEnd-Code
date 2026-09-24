<%@ page import="java.util.List" %>
<%@ page import="School.Mst.Mst_user_role.UserRolesDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Roles List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
<%@ include file="nav.jsp" %>
    <h2 class="text-center mb-4">User Roles</h2>

    <div class="mb-3 text-end">
        <a href="UserRolesIndex.jsp" class="btn btn-primary">Add Role</a>
        <a href="deletedUserRoles" class="btn btn-danger">View Deleted</a>
    </div>

    <table class="table table-bordered table-hover text-center">
        <thead class="table-dark">
            <tr>
                <th>Role ID</th>
                <th>Role Name</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody id="userRoleTblBody">
       	
        </tbody>
    </table>
    
    <div class="mt-4">

	
	<div class="modal fade" id="addUserRoleModal" tabindex="-1" aria-labelledby="addUserRoleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content text-dark">
      <div class="modal-header">
        <h5 class="modal-title" id="addUserRoleModalLabel">Add New Course</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
        	<form action="userRoles" method="post" id="userRoleForm">
        	<input type="hidden" name="uerRole_id" id="uerRole_id">
        	<input type="hidden" name="action" id="actionID">
            <div class="mb-3">
                <label for="role_name" class="form-label">Role Name</label>
                <input type="text" class="form-control" id="role_name" name="role_name" required>
                <span id="nameError" style="color: red"></span>
            </div>
            <button type="submit" class="btn btn-success">Add</button>
            <a href="userRoles" class="btn btn-secondary">Cancel</a>
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
	loadRoleList();
});
	
	function validateInfo(){
		$("#nameError").html('');
		
		var name = $('#role_name').val().trim();
		var isValid = true;
		
		if(name === ''){
			$("#nameError").html("Name is required.");
			isValid = false;
		}
		
		if(isValid){
			$.ajax({
				url : 'userRoles',
				type : 'POST',
				data : $('#userRoleForm').serialize(),
				success : function(data){
					console.log(data);
					if(data ==='success'){
						loadDesigList();
						$('addUserRoleModal').modal('hide');
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
	
	function loadRoleList(){
		$.ajax({
			url : 'userRoles',
			type : 'GET',
			data : {
				action : 'list'
			},
			dataType : 'json',
			success : function(data){
				$("#userRoleTblBody").empty();
				$.each(data, function(index, desigs){
					var rowData = createRowElement(desigs);
					$("#userRoleTblBody").append(rowData);
				});
			},
			error: function() {
	            alert('Error fetching classes data.');
	        }
		});
	}
	
	function createRowElement(role){
		var rowData = "<tr>";
		rowData += "<td>" + role.role_id + "</td>";
		rowData += "<td>" + role.role_name + "</td>";
		rowData += "<td>";
	    rowData += "<button class='btn btn-sm btn-primary' onclick='editUserRole(" + role.role_id  + ")'>Edit</button> ";
	    rowData += "<button type='button' class='btn btn-sm btn-danger' onclick='doDelete(" + role.role_name + ", event)'>Delete</button>";
	    rowData += "</td>";
	    rowData += "</tr>";
	    return rowData;
	}
	
	function doDelete(designation_id, event){
		if(confirm('Are you sure you want to delete this class?')){
			$.ajax({
				url : 'userRoles',
				type : 'POST',
				data :{action : 'delete' , role_id : role_id},
				success : function(data){
					if(data === 'success'){
						loadRoleList();
					}else{
						alert('Failed to delete user role.');
					}
				},
				error: function() {
	                alert('Error deleting user role.');
	            }
			});
		}
	}
	
	function editDesig(designation_id){
		$('#addDesigModalLabel').text('Edit Designation');
		
		$.ajax({
			url : 'userRoles',
			type : 'GET',
			data : {role_id : role_id},
			dataType: 'json',
			success : function(data){
				if(data){
					$('#actionID').val('update');
					$('#role_id').val(data.role_id);
					$('#role_name').val(data.role_name);
					$('#addbtnID').text('Update');
	                $('#addDesigModal').modal('show');
				}else {
	                alert('Failed to load user role data.');
	            }
			},
			error : function(){
				alert('Error fetching user role data.');
			}
		});
	}
	
	$(document).on('click', '[data-bs-target="#addUserRoleModal"]', function() {
	    $('#addUserRoleModalLabel').text("Add New User role");
	    $('#addbtnID').text('Add User role');
	    $('#actionID').val('');
	    $('#userRoleForm')[0].reset();
	    $('#nameError').html('');
	});
</script>
</body>
</html>
