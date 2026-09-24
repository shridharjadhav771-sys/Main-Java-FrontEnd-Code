<%@ page import="java.util.List" %>
<%@ page import="School.Mst.Mst_fee_types.FeeTypesDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Fee Types</title>
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
<div class="container mt-5 text-light bg-dark">
<%@ include file="nav.jsp" %>
    <h2 class="text-center mb-4">Fee Types List</h2>

    <div class="mb-3 text-end">
<button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addFeeTypeModal">Add New Fee Type</button>    </div>

    <table class="table table-bordered text-center table-dark table-striped">
        <thead class="table-dark">
        <tr>
    <th>Fee Type ID</th>
    <th>Fee Name</th>
    <th>Actions</th>
</tr>
        </thead>
        <tbody id="feeTypeTblBody">
        
        </tbody>
    </table>
</div>

<div class="mt-4">

	
	<div class="modal fade" id="addFeeTypeModal" tabindex="-1" aria-labelledby="addFeeTypeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content text-dark">
      <div class="modal-header">
        <h5 class="modal-title" id="addFeeTypeModalLabel">Add New Fee Type</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
        	<form action="payment" method="post" id="feeTypeForm">

    <!-- Hidden fields -->
    <input type="hidden" name="fee_type_id" id="fee_type_id">
    <input type="hidden" name="action" id="actionID">

    <!-- Student ID -->
    

    <!-- Fee Type ID -->
    <div class="form-group mb-3">
        <label for="fee_name">Fee Type Name</label>
        <input type="text" class="form-control" id="fee_name" name="fee_name" placeholder="Enter Fee Type Name" required>
        <span id="nameError" style="color:red"></span>
    </div>
    <!-- Optional isDeleted field (hidden, default 0) -->
    <input type="hidden" name="is_deleted" value="0">

    <!-- Submit Button -->
    <button type="button" onclick="validateInfo()" class="btn btn-primary" id="addPaymentBtn">Add Fee Type</button>

</form>

      </div>
    </div>
  </div>
</div>
	
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<script type="text/javascript">
$(document).ready(function() {
	loadFeeTypeList();
});
	
	function validateInfo(){
		$('#nameError').html('');
		
		var name = $('#fee_name');
		var isValid = true;
		
		if(name === ''){
			$("#nameError").html("Name is required.");
			isValid = false;
		}
		
		if(isValid){
			$.ajax({
				url : 'feeTypes',
				type : 'POST',
				data : $('#feeTypeForm').serialize(),
				success : function(data){
					console.log(data);
					if(data ==='success'){
						loadFeeTypeList();
						$('addFeeTypeModal').modal('hide');
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
	
	function loadFeeTypeList(){
		$.ajax({
			url : 'feeTypes',
			type : 'GET',
			data : {
				action : 'list'
			},
			dataType : 'json',
			success : function(data){
				$("#feeTypeTblBody").empty();
				$.each(data, function(index, feeType){
					var rowData = createRowElement(feeType);
					$("#feeTypeTblBody").append(rowData);
				});
			},
			error: function() {
	            alert('Error fetching fee type data.');
	        }
		});
	}
	
	
	function createRowElement(feeType){
		var rowData = "<tr>";
		rowData += "<td>" + feeType.fee_type_id + "</td>";
		rowData += "<td>" + feeType.fee_name + "</td>";
		rowData += "<td>";
	    rowData += "<button class='btn btn-sm btn-primary' onclick='editFeeType(" + feeType.fee_type_id + ")'>Edit</button> ";
	    rowData += "<button type='button' class='btn btn-sm btn-danger' onclick='doDelete(" + feeType.fee_type_id + ", event)'>Delete</button>";
	    rowData += "</td>";
	    rowData += "</tr>";
	    return rowData;
	}
	
	function doDelete(fee_type_id, event){
		if(confirm('Are you sure you want to delete this Fee Type?')){
			$.ajax({
				url : 'feeTypes',
				type : 'POST',
				data :{action : 'delete' , fee_type_id : fee_type_id},
				success : function(data){
					if(data === 'success'){
						loadFeeTypeList();
					}else{
						alert('Failed to delete Fee Type.');
					}
				},
				error: function() {
	                alert('Error deleting Fee Type.');
	            }
			});
		}
	}
	
	function editFeeType(fee_type_id){
		$('#addFeeTypeModalLabel').text('Edit Fee Type');
		
		$.ajax({
			url : 'feeTypes',
			type : 'GET',
			data : {fee_type_id : fee_type_id},
			dataType: 'json',
			success : function(data){
				if(data){
					$('#actionID').val('update');
					$('#fee_type_id').val(data.fee_type_id);
					$('#fee_name').val(data.fee_name);
					$('#addbtnID').text('Update');
	                $('#addFeeTypeModal').modal('show');
				}else {
	                alert('Failed to load fee type data.');
	            }
			},
			error : function(){
				alert('Error fetching fee type data.');
			}
		});
	}
	
	$(document).on('click', '[data-bs-target="#addFeeTypeModal"]', function() {
	    $('#addFeeTypeModalLabel').text("Add New Fee Type");
	    $('#addbtnID').text('Add Fee Type');
	    $('#actionID').val('');
	    $('#feeTypeForm')[0].reset();
	    $('#nameError').html('');
	});
</script>
</body>
</html>
