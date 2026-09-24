<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Management</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
/* Add basic modal styles */
.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background: white;
	padding: 20px;
	margin: 50px auto;
	width: 50%;
}
</style>
</head>
<body>

	<h1>Employee Management</h1>

	<!-- Button to open modal -->
	<button id="addEmployeeBtn">Add Employee</button>

	<!-- Employee Table -->
	<table id="employeeTable" border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Position</th>
				<th>Salary</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>

	<!-- Modal Form for Add/Edit Employee -->
	<div id="employeeModal" class="modal">
		<div class="modal-content">
			<h3 id="modalTitle">Add Employee</h3>
			<form id="employeeForm">
				<input type="hidden" id="employeeId" name="id"> <label
					for="name">Name:</label> <input type="text" id="name" name="name"
					required><br> <label for="email">Email:</label> <input
					type="email" id="email" name="email" required><br> <label
					for="position">Position:</label> <input type="text" id="position"
					name="position" required><br> <label for="salary">Salary:</label>
				<input type="number" id="salary" name="salary" required><br>
				<br>
				<button type="submit" id="submitBtn">Submit</button>
				<button type="button" id="closeModalBtn">Close</button>
			</form>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			// Fetch the employee list
			function loadEmployees() {
				$.ajax({
					url : 'EmployeeServlet?action=list',
					type : 'GET',
					success : function(data) {
						$('#employeeTable tbody').html(data);
					}
				});
			}
			loadEmployees();

			// Show modal for adding a new employee
			$('#addEmployeeBtn').click(function() {
				$('#employeeModal').show();
				$('#modalTitle').text('Add Employee');
				$('#employeeForm')[0].reset();
				$('#employeeId').val('');
			});

			// Close the modal
			$('#closeModalBtn').click(function() {
				$('#employeeModal').hide();
			});

			// Submit the form (Add/Edit employee)
			$('#employeeForm').submit(function(e) {
				e.preventDefault();
				let action = ($('#employeeId').val()) ? 'update' : 'create';
				$.ajax({
					url : 'EmployeeServlet',
					type : 'POST',
					data : $(this).serialize() + '&action=' + action,
					success : function(response) {
						alert(response);
						$('#employeeModal').hide();
						loadEmployees(); // Reload employee list
					}
				});
			});

			// Edit button click (populate modal with existing data)
			$('#employeeTable').on('click', '.edit', function() {
				let employeeId = $(this).data('id');
				$.ajax({
					url : 'EmployeeServlet',
					type : 'GET',
					data : {
						action : 'get',
						id : employeeId
					},
					success : function(data) {
						let employee = JSON.parse(data);
						$('#employeeId').val(employee.id);
						$('#name').val(employee.name);
						$('#email').val(employee.email);
						$('#position').val(employee.position);
						$('#salary').val(employee.salary);
						$('#modalTitle').text('Edit Employee');
						$('#employeeModal').show();
					}
				});
			});

			// Delete button click
			$('#employeeTable').on('click', '.delete', function() {
				let employeeId = $(this).data('id');
				if (confirm('Are you sure you want to delete this employee?')) {
					$.ajax({
						url : 'EmployeeServlet',
						type : 'POST',
						data : {
							action : 'delete',
							id : employeeId
						},
						success : function(response) {
							alert(response);
							loadEmployees();
						}
					});
				}
			});
		});
	</script>
</body>
</html>
