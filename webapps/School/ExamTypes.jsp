<%@ page import="java.util.List" %>
<%@ page import="School.Mst.Mst_examTypes.ExamTypesDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exam Types</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
<%@ include file="nav.jsp" %>
    <h2 class="text-center mb-4">Exam Types</h2>

    <div class="mb-3 text-end">
        <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addExamModal">Add New Exam Type</button>
    </div>

    <table class="table table-bordered table-hover text-center">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Exam Name</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody id="examTblBody">
       
        </tbody>
    </table>
</div>

 <div class="mt-4">

	<div class="modal fade" id="addExamModal" tabindex="-1" aria-labelledby="addExamModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content text-dark">
      <div class="modal-header">
        <h5 class="modal-title" id="addExamModalLabel">Add New Exam Type</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
        	<form action="examTypes" method="post" id="examForm">
        		<input type="hidden" id="exam_type_id" name="exam_type_id">
        		<input type="hidden" id="actionID" name="action">
                <div class="form-group mb-3">
                    <label for="exam_name">Exam Name</label>
                    <input type="text" class="form-control" id="exam_name" name="exam_name" required>
                	<span id="nameError" style="color: red"></span>
                </div>
                    <button type="button" onclick="validateInfo()" class="btn btn-primary" id="addbtnID">Add Exam Type</button>
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
	loadExamsList();
});

function validateInfo(){
	$('nameError').html('');
	
	var name = $("#exam_name").val().trim();
	var isValid = true;
	
	if(name === ''){
		$("#nameError").html("Name is required.");
        isValid = false;
	}
}

if(isValid){
	$.ajax({
		url : 'examTypes',
		type : 'POST',
		data : $('#examForm').serialize(),
		success : function(data){
			if(data === 'success'){
				loadExamsList();
				$('#addExamModal').modal('hide');
				$('#examForm')[0].reset();
			}else{
				alert('Failed to save exam type. Please try again.');
			}
		},
		error: function() {
            alert('Something went wrong. Please try again.');
        }
	});
}


function loadExamsList(){
	$.ajax({
		url: 'examTypes',
		type: 'GET',
		data: {action : 'list'},
		dataType : 'json',
		success : function(data){
			console.log(data);
			$('#examTblBody').empty();
			$.each(data, function(index, exams){
				var rowData = createRowElement(exams);
				$("#examTblBody").append(rowData);
			});
		},
		error: function() {
            alert('Error fetching exam types data.');
        }
	});
}

function createRowElement(exams) {
    var rowData = "<tr>";
    rowData += "<td>" + exams.exam_type_id + "</td>";
    rowData += "<td>" + exams.exam_name + "</td>";
    rowData += "<td>";
    rowData += "<button class='btn btn-sm btn-primary' onclick='editExams(" + exams.exam_type_id + ")'>Edit</button> ";
    rowData += "<button type='button' class='btn btn-sm btn-danger' onclick='doDelete(" + exams.exam_name + ", event)'>Delete</button>";
    rowData += "</td>";
    rowData += "</tr>";
    return rowData;
}

function doDelete(exam_type_id, event) {
    if (confirm('Are you sure you want to delete this exam type?')) {
        $.ajax({
            url: 'examTypes',
            type: 'POST',
            data: { action: 'delete', exam_type_id: exam_type_id },
            success: function(data) {
                if (data === 'success') {
                	loadExamsList();
                } else {
                    alert('Failed to delete exam type.');
                }
            },
            error: function() {
                alert('Error deleting exam type.');
            }
        });
    }
}


function editExams(exam_type_id) {
    $('#addExamModalLabel').text('Edit Exam Type');
    
    $.ajax({
        url: 'examTypes',
        type: 'GET',
        data: { exam_type_id: exam_type_id },
        dataType: 'json', // Ensure jQuery parses the JSON response
        success: function(data) {
            if (data) {
                $('#actionID').val('update');
                $('#exam_type_id').val(data.exam_type_id);
                $('#exam_name').val(data.exam_name);
                $('#addbtnID').text('Update');
                $('#addExamModal').modal('show');
            } else {
                alert('Failed to load exam type data.');
            }
        },
        error: function() {
            alert('Error fetching exam type data.');
        }
    });
}

$(document).on('click', '[data-bs-target="#addExamModal"]', function() {
    $('#addExamModalLabel').text("Add New Exam Type");
    $('#addbtnID').text('Add Exam Type');
    $('#actionID').val('');
    $('#examForm')[0].reset();
    $('#nameError').html('');
});

</script>
</body>
</html>
