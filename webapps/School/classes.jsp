<%@ page import="java.util.List"%>
<%@ page import="School.Mst.Mst_Classes.ClassesDTO"%>
<!DOCTYPE html>
<html>
<head>
<title>Classes List</title>
<!-- Bootstrap CSS CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-image: url('Images/img6.jpg');
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
	<div class="container mt-5 bg-dark mb-5 text-light">
		<%@ include file="nav.jsp"%>
		<h2 class="mb-4">Classes List</h2>
		<div class="mb-3 text-end">
			<button type="button" class="btn btn-primary mb-3"
				data-bs-toggle="modal" data-bs-target="#addClassModal">Add
				New Class</button>
		</div>
		<table
			class="table table-bordered table-hover text-center table-dark table-striped">
			<thead class="table-dark">
				<tr>
					<th>Class ID</th>
					<th>Class Name</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody id="classesTblBody">


			</tbody>
		</table>

	</div>

	<div class="mt-4">

		<div class="modal fade" id="addClassModal" tabindex="-1"
			aria-labelledby="addClassModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered">
				<div class="modal-content text-dark">
					<div class="modal-header">
						<h5 class="modal-title" id="addClassModalLabel">Add New Class</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<div class="modal-body">
						<form action="class" method="post" id="classForm">

							<input type="hidden" name="class_id" id="class_id"> <input
								type="hidden" name="action" id="actionID">

							<div class="form-group mb-3">
								<label for="className">Class Name</label> <input type="text"
									class="form-control" id="className" name="className"
									placeholder="Enter class name" required> <span
									id="nameError" style="color: red"></span>
							</div>

							<!-- Optional Hidden Field -->
							<input type="hidden" name="isDeleted" value="0">

							<button type="button" onclick="validateInfo()"
								class="btn btn-primary" id="addbtnID">Add Class</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>


	<!-- Bootstrap JS CDN (optional) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			loadClassList();
		});

		function validateInfo() {
			$("#nameError").html('');

			var name = $("#className").val().trim();
			var isValid = true;

			if (name === '') {
				$("#nameError").html("Name is required.");
				isValid = false;
			}

			if (isValid) {
				$.ajax({
					url : 'class',
					type : 'POST',
					data : $("#classForm").serialize(),
					success : function(data) {
						if (data === 'success') {
							loadClassList();
							$('#addClassModal').modal('hide');
							$('#classForm')[0].reset();
						} else {
							alert('Failed to save class. Please try again.');
						}
					},
					error : function() {
						alert('Something went wrong. Please try again.');
					}
				});
			}
		}

		function loadClassList() {
			$.ajax({
				url : 'class',
				type : 'GET',
				data : {
					action : 'list'
				},
				dataType : 'json', // Ensure jQuery parses the JSON response
				success : function(data) {
					$("#classesTblBody").empty();
					$.each(data, function(index, classes) {
						var rowData = createRowElement(classes);
						$("#classesTblBody").append(rowData);
					});
				},
				error : function() {
					alert('Error fetching classes data.');
				}
			});
		}

		function createRowElement(classes) {
			var rowData = "<tr>";
			rowData += "<td>" + classes.classId + "</td>";
			rowData += "<td>" + classes.className + "</td>";
			rowData += "<td>";
			rowData += "<button class='btn btn-sm btn-primary' onclick='editClass("
					+ classes.classId + ")'>Edit</button> ";
			rowData += "<button type='button' class='btn btn-sm btn-danger' onclick='doDelete("
					+ classes.classId + ", event)'>Delete</button>";
			rowData += "</td>";
			rowData += "</tr>";
			return rowData;
		}

		function editClass(classId) {
			$('#addClassModalLabel').text('Edit Class');

			$.ajax({
				url : 'class',
				type : 'GET',
				data : {
					class_id : classId
				},
				dataType : 'json', // Ensure jQuery parses the JSON response
				success : function(data) {
					if (data) {
						$('#actionID').val('update');
						$('#class_id').val(data.classId);
						$('#className').val(data.className);
						$('#addbtnID').text('Update');
						$('#addClassModal').modal('show');
					} else {
						alert('Failed to load class data.');
					}
				},
				error : function() {
					alert('Error fetching class data.');
				}
			});
		}

		function doDelete(classId, event) {
			if (confirm('Are you sure you want to delete this class?')) {
				$.ajax({
					url : 'class',
					type : 'POST',
					data : {
						action : 'delete',
						class_id : classId
					},
					success : function(data) {
						if (data === 'success') {
							loadClassList();
						} else {
							alert('Failed to delete class.');
						}
					},
					error : function() {
						alert('Error deleting class.');
					}
				});
			}
		}

		$(document).on('click', '[data-bs-target="#addClassModal"]',
				function() {
					$('#addClassModalLabel').text("Add New Class");
					$('#addbtnID').text('Add Class');
					$('#actionID').val('');
					$('#classForm')[0].reset();
					$('#nameError').html('');
				});
	</script>
</body>
</html>
