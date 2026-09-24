<!DOCTYPE html>
<html lang="en">
<%@ include file="session-expire-check.jsp"%>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img/favicon.png">
<title>Inventory Management System | Dashboard</title>
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700,900" />
<!-- Nucleo Icons -->
<link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons+Round"
	rel="stylesheet">
<!-- Material Icons -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0" />
<!-- CSS Files -->
<link id="pagestyle" href="../assets/css/material-dashboard.css?v=3.2.0"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>


<body class="g-sidenav-show  bg-gray-100">
	<jsp:include page="left-nav.jsp"></jsp:include>


	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps">
		<!-- Navbar -->
		<nav
			class="navbar navbar-main navbar-expand-lg position-sticky px-0 shadow-none border-radius-xl z-index-sticky"
			id="navbarBlur" data-scroll="true">
			<div class="container-fluid py-1 px-3"
				style="display: block !important">
				<nav aria-label="breadcrumb">
					<div class="row">
						<div class="col-6">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a i=""
									class="material-icons fixed-plugin-button-nav cursor-pointer "
									href="dashboard.jsp"> home </a></li>
								<h6 class="font-weight-bolder mb-0 breadcrumb-item active">
									<a href="inventory.jsp">Materials</a>
								</h6>
								<h6 class="font-weight-bolder mb-0 breadcrumb-item active">Warehouse</h6>
							</ol>
						</div>

					</div>
				</nav>
			</div>
		</nav>
		<!--End Navbar -->



		<div class="card-body p-2 height-auto">
			<div class="container-fluid py-1">

				<div class="row">
					<div class="col-md-3">
						<div class="input-group input-group-dynamic">
							<input class="multisteps-form__input form-control" type="text"
								placeholder="Search Warehouse,Mobile No ..."
								name="search_warehouse" id="search_warehouse"
								onfocus="focused(this)" onfocusout="defocused(this)">
						</div>
					</div>
					<div class="col-md-2">
						<button class="btn btn-icon btn-2 btn-dark" id="search_warehouse"
							type="button" onclick="displayRecords()">
							<span class="btn-inner--icon"><i class="material-icons">search</i></span>
						</button>
					</div>

					<div class="col-md-3" id="addbtbn" style="text-align: end">
						<button data-bs-toggle="modal" data-bs-target="#warehouseModal"
							class="btn btn-link text-info border-0"
							data-bs-placement="bottom" data-bs-original-title="Warehouse">
							<i class="bi bi-box"></i>Warehouse
						</button>
					</div>

				</div>
			</div>
		</div>


		<div class="card-body p-2 height-auto">
			<div class="container-fluid py-1">

				<div
					class="table-responsive d-none d-md-block d-sm-none d-lg-block d-xl-block">
					<table class="table task_table" id="mytasktableId">
						<thead class="task_table_head">
							<tr>
								<th></th>
								<th style="padding: 5px;">Warehouse Name</th>
								<th style="padding: 5px;">Phone</th>
								<th style="padding: 5px;">Mobile</th>
								<th style="padding: 5px;">Address1</th>
								<th style="padding: 5px;">City</th>
								<th style="padding: 5px;">State</th>
								<th style="padding: 5px;">Zipcode</th>
								<th style="padding: 5px;">Is Active</th>

							</tr>
						</thead>
						<tbody id="myItemstbodyId">

						</tbody>

					</table>
				</div>

			</div>
		</div>




		<!-- Modal For Add New Leave-->
		<div class="modal fade" id="warehouseModal" tabindex="-1"
			aria-labelledby="newTaskLabel" style="display: none;"
			aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-scrollable  modal-lg modal-dialog-centered"
				role="document">
				<div class="modal-content model-content-css">



					<!--Header-->
					<div class="modal-header p-2">
						<h5 class="modal-title" id="newTaskLabel">Add Warehouse</h5>
						<button type="button" class="btn-close text-dark"
							data-bs-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>


					<!--Body-->
					<div class="modal-body p-0">
						<div class="container-fluid">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-lg-12 col-md-12">
											<form name="taskform" method="post" id="Warehouse_formID"
												onsubmit="" class="is-filled">



												<!-- Add Warehouse -->


												<div class="row">

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Warehouse Name</label> <span id="spanId">*</span>
															<input type="text" class="required form-control"
																id="warehouse_name" name="warehouse_name"
																placeholder="Enter Warehouse Name"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_warehouse_name"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Phone</label> <span id="spanId">*</span> <input
																type="text" class="required form-control" id="phone"
																name="phone" placeholder="Enter Phone"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_phone"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Mobile</label> <span id="spanId">*</span> <input
																type="text" class="required form-control" id="mobile"
																name="mobile" placeholder="Enter Mobile"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_mobile"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Address1</label> <span id="spanId">*</span> <input
																type="text" class="required form-control" id="address1"
																name="address1" placeholder="Enter Address1"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_address1"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>City</label> <span id="spanId">*</span> <input
																type="text" class="required form-control" id="city"
																name="city" placeholder="Enter City"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_city"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>State</label> <span id="spanId">*</span> <input
																type="text" class="required form-control" id="state"
																name="state" placeholder="Enter State"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_state"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Zipcode</label> <span id="spanId">*</span> <input
																type="text" class="required form-control" id="zipcode"
																name="zipcode" placeholder="Enter Zipcode"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_zipcode"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Is Active</label> <span id="spanId">*</span> <select
																class="required form-control" id="is_active"
																name="is_active" onfocus="focused(this)"
																onfocusout="defocused(this)">
																<option value="">Select Status</option>
																<option value="active">Active</option>
																<option value="inactive">Inactive</option>
															</select> <span class="msgError" id="msgError_is_active"></span>
														</div>
													</div>
												</div>
											</form>
										</div>


										<div class="col-md-auto text-end px-1">
											<button type="button" class="btn bg-gradient-info"
												id="taskactionid" onclick="addWarehouse()">Save</button>
											<button type="button" class="btn btn-link ml-auto"
												data-bs-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



		<!-- Modal For Delete Confirmation-->
		<div class="modal fade" id="deleteModal" tabindex="-1"
			aria-labelledby="deleteModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header p-2">
						<h5 class="modal-title" id="deleteModalLabel">Delete
							Confirmation</h5>
						<button type="button" class="btn-close text-dark"
							data-bs-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<!-- Modal Body -->
					<div class="modal-body p-0">
						<div class="container-fluid">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-lg-12 col-md-12">
											<p>Are you sure you want to delete this item?</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Modal Footer -->
					<div class="modal-footer p-2">
						<button type="button" class="btn bg-gradient-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn bg-gradient-danger"
							id="confirmDeleteBtn">Delete</button>
					</div>
				</div>
			</div>
		</div>



		<!-- Modal For Update WareHouse -->


		<div class="modal fade" id="editTask" tabindex="-1" role="dialog"
			aria-labelledby="editTaskLabel" aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-scrollable modal-xl modal-dialog-centered"
				role="document">
				<div class="modal-content model-content-css">
					<!-- Header -->
					<div class="modal-header p-2">
						<h5 class="modal-title" id="editTaskLabel">Update Warehouse</h5>
						<button type="button" class="btn-close text-dark"
							data-bs-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>

					<!--Body-->


					<div class="modal-body p-0">
    <div class="container-fluid">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <form name="edittaskform" method="post" id="edit_warehouse_form_id" onsubmit="return false;" class="is-filled">
                            <input type="hidden" name="actionType" id="edit_action_type_id" value="edit_item_group">
                            <input type="hidden" name="userId" id="edit_user_id" value="1">
                            <input type="hidden" name="userName" value="ADMIN">
                            <input type="hidden" name="employeeCode" id="edit_employeeCode" value="">

                            <div class="row">

                                <div class="col-md-6 col-sm-12">
                                    <div class="input-group input-group-static mb-4">
                                        <label>Warehouse Name</label><span id="spanId">*</span>
                                        <input type="text" class="required form-control" id="warehouse_name" name="warehouse_name" placeholder="Enter Warehouse Name" onfocus="focused(this)" onfocusout="defocused(this)">
                                        <span class="msgError" id="msgError_warehouse_name"></span>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="input-group input-group-static mb-4">
                                        <label>Phone</label><span id="spanId">*</span>
                                        <input type="text" class="required form-control" id="phone" name="phone" placeholder="Enter Phone" onfocus="focused(this)" onfocusout="defocused(this)">
                                        <span class="msgError" id="msgError_phone"></span>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="input-group input-group-static mb-4">
                                        <label>Mobile</label><span id="spanId">*</span>
                                        <input type="text" class="required form-control" id="mobile" name="mobile" placeholder="Enter Mobile" onfocus="focused(this)" onfocusout="defocused(this)">
                                        <span class="msgError" id="msgError_mobile"></span>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="input-group input-group-static mb-4">
                                        <label>Address1</label><span id="spanId">*</span>
                                        <input type="text" class="required form-control" id="address1" name="address1" placeholder="Enter Address1" onfocus="focused(this)" onfocusout="defocused(this)">
                                        <span class="msgError" id="msgError_address1"></span>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="input-group input-group-static mb-4">
                                        <label>City</label><span id="spanId">*</span>
                                        <input type="text" class="required form-control" id="city" name="city" placeholder="Enter City" onfocus="focused(this)" onfocusout="defocused(this)">
                                        <span class="msgError" id="msgError_city"></span>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="input-group input-group-static mb-4">
                                        <label>State</label><span id="spanId">*</span>
                                        <input type="text" class="required form-control" id="state" name="state" placeholder="Enter State" onfocus="focused(this)" onfocusout="defocused(this)">
                                        <span class="msgError" id="msgError_state"></span>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="input-group input-group-static mb-4">
                                        <label>Zipcode</label><span id="spanId">*</span>
                                        <input type="text" class="required form-control" id="zipcode" name="zipcode" placeholder="Enter Zipcode" onfocus="focused(this)" onfocusout="defocused(this)">
                                        <span class="msgError" id="msgError_zipcode"></span>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="input-group input-group-static mb-4">
                                        <label>Is Active</label><span id="spanId">*</span>
                                        <select class="required form-control" id="is_active" name="is_active" onfocus="focused(this)" onfocusout="defocused(this)">
                                            <option value="">Select Status</option>
                                            <option value="active">Active</option>
                                            <option value="inactive">Inactive</option>
                                        </select>
                                        <span class="msgError" id="msgError_is_active"></span>
                                    </div>
                                </div>

                            </div>

                            <div class="row justify-content-md-end mt-4">
                                <div class="col-md-auto text-end px-1">
                                    <button type="button" class="btn bg-gradient-info" id="save_task_action_id" data-id="">Save</button>
                                    <button type="button" class="btn btn-link ml-auto" data-bs-dismiss="modal">Close</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

				</div>
			</div>
		</div>

		<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
			<div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
		</div>
		<div class="ps__rail-y" style="top: 0px; right: 0px;">
			<div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div>
		</div>

	</main>


	<!--   Core JS Files   -->
	<script src="../assets/js/core/popper.min.js"></script>
	<script src="../assets/js/core/bootstrap.min.js"></script>
	<script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
	<script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
	<script src="../assets/js/plugins/chartjs.min.js"></script>


	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="../assets/js/material-dashboard.min.js?v=3.2.0"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


	<script>
		$(document).ready(function() {
			displayRecords();
			
		});
		
		
		function displayRecords() {
		    $.ajax({
		        url: "<%=request.getContextPath()%>/Warehouse", // Modify URL to your specific endpoint
		        type: 'GET',
		        data: {
		            action: "display", 
		            searchWarehouse: $("#search_warehouse").val(), // Getting the search term from input field
		        },
		        success: function(data) {
		            if (data != "" && data != null) {
		                // Clear previous rows before appending new data
		                $("#myItemstbodyId").empty(); 
		                
		                var rowdata = "";
		                
		                // Loop through the response data and append rows to the table
		                for (let i = 0; i < data.length; i++) {
		                    rowdata += "<tr>" +
		                        "<td>" +
		                            "<i onclick='editTask(" + data[i].warehouse_id + ")' class='fas fa-edit'></i>" + // Edit action
		                            "<i onclick='confirmDeleteWarehouse(" + data[i].warehouse_id + ")' class='fas fa-trash'></i>" + // Delete action
		                        "</td>" +
		                        "<td>" + data[i].warehouse_name + "</td>" +
		                        "<td>" + data[i].phone + "</td>" +
		                        "<td>" + data[i].mobile + "</td>" +
		                        "<td>" + data[i].address + "</td>" +
		                        "<td>" + data[i].city + "</td>" +
		                        "<td>" + data[i].state + "</td>" +
		                        "<td>" + data[i].zipcode + "</td>" +
		                        "<td>" + (data[i].is_active ? "Active" : "Inactive") + "</td>" +
		                    "</tr>";
		                }
		                
		                // Append all new rows to the table
		                $("#myItemstbodyId").append(rowdata);
		            }
		        },
		        error: function(error) {
		            alert("Error fetching data: " + error);
		        }
		    });
		}
		
		
		function addWarehouse(warehouseId) {
		    $.ajax({
		        url: "<%=request.getContextPath()%>/Warehouse",  // Update with your correct URL
		        type: 'POST',
		        data: {
		            action: "insert",
		            warehouse_name: $("#warehouse_name").val(),
		            phone: $("#phone").val(),
		            mobile: $("#mobile").val(),
		            address: $("#address1").val(),
		            city: $("#city").val(),
		            state: $("#state").val(),
		            zipcode: $("#zipcode").val(),
		            is_active: $("#is_active").val(),
		        },
		        success: function(data) {
		            // Close the modal after success
		            $("#newBrand").modal("hide");  // You may need to update the ID here for the warehouse modal
		            displayRecords();  // Assuming displayRecords() is used to refresh the data on the page
		        },
		        error: function(error) {
		            alert("An error occurred: " + error.statusText);
		        }
		    });
		}
		
		function editTask(warehouseId) {
		    // Fetch the warehouse details based on the warehouseId.
		    $.ajax({
		        url: "<%=request.getContextPath()%>/Warehouse",  // Update with your correct URL
		        type: "GET",
		        data: {
		            action: "getWarehouseById",  // Action to get warehouse details by ID
		            warehouse_id: warehouseId
		        },
		        success: function(data) {
		            if (data != "" && data != null) {
		                // Populate the modal form fields with the warehouse data.
		                $("#edit_warehouse_name_id").val(data.warehouse_name);
		                $("#edit_phone_id").val(data.phone);  // Assuming you have a phone field for edit
		                $("#edit_mobile_id").val(data.mobile);  // Assuming you have a mobile field for edit
		                $("#edit_address1_id").val(data.address1);
		                $("#edit_city_id").val(data.city);
		                $("#edit_state_id").val(data.state);
		                $("#edit_zipcode_id").val(data.zipcode);
		                $("#edit_is_active_warehouse_id").val(data.is_active ? "active" : "inactive");  // Handle active/inactive status

		                // Update the 'onclick' event to trigger the updateWarehouse() function with the warehouseId
		                $("#edit_task_action_id").attr("onclick", "updateWarehouse(" + warehouseId + ")");

		                // Open the modal to allow the user to edit the warehouse details.
		                $('#editTask').modal('show');  // Assuming the ID for the modal is 'editTask'
		            }
		        },
		        error: function(error) {
		            alert("Error fetching warehouse details: " + error.statusText);
		        }
		    });
		}
 
		function confirmDeleteWarehouse(warehouseId) {
		    // Set up the delete confirmation modal
		    $('#deleteModal').modal('show');
		    
		    // Unbind the previous click event to avoid multiple handlers
		    $('#confirmDeleteBtn').off('click').on('click', function() {
		        deleteWarehouse(warehouseId);
		    });
		}

		function deleteWarehouse(warehouseId) {
		    $.ajax({
		        url: "<%=request.getContextPath()%>/Warehouse",
		        type: "POST",
		        data: {
		            action: "delete",
		            warehouse_id: warehouseId
		        },
		        success: function(response) {
		            // Hide the modal after the delete action
		            $('#deleteModal').modal('hide');
		            // Refresh the records by calling displayRecords
		            displayRecords(); // This will re-fetch the records and refresh the table
		        },
		        error: function(error) {
		            alert("Error deleting warehouse: " + error);
		        }
		    });
		}
		
		function updateWarehouse(warehouseId) {
		    $.ajax({
		        url: "<%=request.getContextPath()%>/Warehouse",  // Update with your correct URL
		        type: 'POST',
		        data: {
		            action: "update",  // Assuming there's an action to handle updates
		            warehouse_id: warehouseId,  // Include warehouse ID for the update operation
		            warehouse_name: $("#edit_warehouse_name_id").val(),
		            phone: $("#edit_phone_id").val(),  // Assuming there's an ID for the phone field in the edit modal
		            mobile: $("#edit_mobile_id").val(),  // Same as above
		            address: $("#edit_address1_id").val(),
		            city: $("#edit_city_id").val(),
		            state: $("#edit_state_id").val(),
		            zipcode: $("#edit_zipcode_id").val(),
		            is_active: $("#edit_is_active_warehouse_id").val(),
		        },
		        success: function(data) {
		            // Close the modal after success
		            $("#editTask").modal("hide");  // Assuming this is the ID of the edit modal
		            displayRecords();  // Assuming displayRecords() is used to refresh the data on the page
		        },
		        error: function(error) {
		            alert("An error occurred: " + error.statusText);
		        }
		    });
		}

	</script>

</body>
</html>