<%@ page import="java.util.List"%>
<%@ page import="School.Mst.Mst_subjects.SubjectsDTO"%>
<!DOCTYPE html>
<html>
<head>
<title>Subjects List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
    <%@ include file="nav.jsp"%>
    <h2 class="mb-4">Subjects List</h2>
    <div class="mb-3 text-end">
        <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addSubjectModal">
            Add New Subject
        </button>
    </div>

    <table class="table table-bordered table-hover text-center table-striped table-dark table-transparent">
        <thead>
            <tr>
                <th>Subject ID</th>
                <th>Subject Name</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody id="subjectTblBody"></tbody>
    </table>
</div>
	<div class="mt-4">

		<div class="modal fade" id="addSubjectModal" tabindex="-1"
			aria-labelledby="addSubjectModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered">
				<div class="modal-content text-dark">
					<div class="modal-header">
						<h5 class="modal-title" id="addSubjectModalLabel">Add New Class</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<div class="modal-body">
						<form action="subjects" method="post" id="subjectForm">
							<input type="hidden" name="action" id="actionID">
							<input type="hidden" name="subject_id" id="subject_id">
							<div class="form-group mb-3">
								<label for="subject_name" class="form-label">Subject name</label> 
								<input type="text" class="form-control" id="subject_name" name="subject_name" aria-describedby="emailHelp">
								<span id="nameError" style="color: red"></span>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
	</script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		loadSubjectList();
	});
	
	function validateInfo(){
		$("#nameError").html('');
		
		var name = $('#subject_name').val().trim();
		var isValid = true;
		
		if(name === ''){
			$("#nameError").html("Name is required.");
			isValid = false;
		}
		
		if(isValid){
			$.ajax({
				url : 'subjects',
				type : 'POST',
				data : $('#subjectForm').serialize(),
				success : function(data){
					console.log(data);
					if(data === 'success'){
						loadSubjectList();
						$('addSubjectModal').modal('hide');
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
	
	function loadSubjectList(){
		$.ajax({
			url : 'subjects',
			type : 'GET',
			data : {action : 'list'},
			dataType : 'json',
			success : function(data){
				$('#subjectTblBody').empty();
				$.each(data, function(index, subjects){
					var rowData = createRowElement(subjects);
					$("#subjectTblBody").append(rowData);
				});
			},
			error : function(){
				alert('Error fetching subjects data.');
			}
		});
	}
	
	function createRowElement(subject){
		var rowData = "<tr>";
		rowData += "<td>" + subject.subject_id + "</td>";
		rowData += "<td>" + subject.subject_name + "</td>";
		rowData += "<td>";
	    rowData += "<button class='btn btn-sm btn-primary' onclick='editSubject(" + subject.subject_id + ")'>Edit</button> ";
	    rowData += "<button type='button' class='btn btn-sm btn-danger' onclick='doDelete(" + subject.subject_id + ", event)'>Delete</button>";
	    rowData += "</td>";
	    rowData += "</tr>";
	    return rowData;
	}
	
	function doDelete(subject_id, event){
		if(confirm('Are you sure you want to delete this subject?')){
			$.ajax({
				url : 'subjects',
				type : 'POST',
				data :{action : 'delete' , subject_id : subject_id},
				success : function(data){
					if(data === 'success'){
						loadSubjectList();
					}else{
						alert('Failed to delete subject.');
					}
				},
				error: function() {
	                alert('Error deleting subject.');
	            }
			});
		}
	}
	
	function editSubject(subject_id){
		$('#addSubjectModalLabel').text('Edit Subject');
		
		$.ajax({
			url : 'subjects',
			type : 'GET',
			data : {subject_id : subject_id},
			dataType: 'json',
			success : function(data){
				if(data){
					$('#actionID').val('update');
					$('#subject_id').val(data.subject_id);
					$('#subject_name').val(data.subject_name);
					$('#addbtnID').text('Update');
	                $('#addSubjectModal').modal('show');
				}else {
	                alert('Failed to load subject data.');
	            }
			},
			error : function(){
				alert('Error fetching subject data.');
			}
		});
	}
	
	$(document).on('click', '[data-bs-target="#addSubjectModal"]', function() {
	    $('#addSubjectModalLabel').text("Add New Subject");
	    $('#addbtnID').text('Add Subject');
	    $('#actionID').val('');
	    $('#classForm')[0].reset();
	    $('#nameError').html('');
	});
	</script>
</body>
</html>
