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
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
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
								<h6 class="font-weight-bolder mb-0 breadcrumb-item active">Customer</h6>
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
								placeholder="Search by Customer Name, Code, Email..."
								name="searchCustomers" id="searchCustomers"
								onfocus="focused(this)" onfocusout="defocused(this)">
						</div>
					</div>
					<div class="col-md-2">
						<button class="btn btn-icon btn-2 btn-dark" id="searchCustomers"
							type="button" onclick="displayCustomerRecords()">
							<span class="btn-inner--icon"><i class="material-icons">search</i></span>
						</button>
					</div>
					<div class="col-md-4"></div>
					<div class="col-3" id="addbtnCustomer" style="text-align: end">
						<button data-bs-toggle="modal" data-bs-target="#newCustomerModal"
							class="btn btn-link text-info border-0"
							data-bs-placement="bottom" data-bs-original-title="Customer">
							<i class="bi bi-person"></i> Customers
						</button>
					</div>

				</div>

			</div>
		</div>


		<div class="card-body p-2 height-auto">
			<div class="container-fluid py-1">

				<div
					class="table-responsive d-none d-md-block d-sm-none d-lg-block d-xl-block">
					<table class="table customer_table" id="myCustomerTableId">
						<thead class="customer_table_head">
							<tr>
								<th></th>
								<th style="padding: 5px;">Id</th>
								<th style="padding: 5px;">Customer Name</th>
								<th style="padding: 5px;">Customer Address</th>
								<th style="padding: 5px;">Customer Email</th>
								<th style="padding: 5px;">Customer Phone</th>
							</tr>
							
						</thead>
						<tbody id="myItemstbodyId">

						</tbody>
					</table>
				</div>
			</div>
		</div>


		<!-- Modal For Add New Leave-->
		<div class="modal fade " id="newCustomerModal" tabindex="-1"
			role="dialog" aria-labelledby="newCustomerModalLabel"
			aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered"
				role="document">
				<div class="modal-content model-content-css">



					<!--Header-->
					<div class="modal-header p-2">
						<h5 class="modal-title" id="newCustomerModalLabel">New
							Customer</h5>
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
											<form name="customerform" method="post" id="customer_form"
												onsubmit="" class="is-filled">



												<!-- Add Item -->

												<div class="row">

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Customer Name</label> <span id="spanId">*</span> <input
																type="text" class="required form-control"
																id="customer_name" name="customer_name"
																placeholder="Enter Customer Name"
																onfocus="focused(this)" onfocusout="defocused(this)" />
															<span class="msgError" id="msgError_customer_name"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Customer Address</label> <span id="spanId">*</span>
															<input type="text" class="required form-control"
																id="customer_address" name="customer_address"
																placeholder="Enter Customer Address"
																onfocus="focused(this)" onfocusout="defocused(this)" />
															<span class="msgError" id="msgError_customer_address"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Customer Email</label> <span id="spanId">*</span>
															<input type="email" class="required form-control"
																id="customer_email" name="customer_email"
																placeholder="Enter Customer Email"
																onfocus="focused(this)" onfocusout="defocused(this)" />
															<span class="msgError" id="msgError_customer_email"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Customer Phone</label> <span id="spanId">*</span>
															<input type="text" class="required form-control"
																id="customer_phone" name="customer_phone"
																placeholder="Enter Customer Phone"
																onfocus="focused(this)" onfocusout="defocused(this)" />
															<span class="msgError" id="msgError_customer_phone"></span>
														</div>
													</div>



												</div>
											</form>
										</div>

										<div class="col-md-12 col-sm-12">
											<div class="input-group mb-4">
												<button type="submit" class="btn btn-primary"
													onclick="addNewCustomer()">Save</button>
												<button type="button" class="btn btn-secondary">Close</button>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- Modal for Delete Confirmation -->
		<div class="modal fade" id="deleteCustomerModal" tabindex="-1"
			role="dialog" aria-labelledby="deleteCustomerModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header p-2">
						<h5 class="modal-title" id="deleteCustomerModalLabel">Delete
							Customer Confirmation</h5>
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
											<p>Are you sure you want to delete this customer?</p>
											<p id="customerToDeleteName"></p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Modal Footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-danger"
							id="deleteCustomerBtn">Delete</button>
					</div>
				</div>
			</div>
		</div>


		<!-- Modal For Update Brand -->


		<div class="modal fade" id="updateCustomerModal" tabindex="-1"
			style="display: none;" aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered"
				role="document">
				<div class="modal-content model-content-css">
					<!-- Header -->
					<div class="modal-header p-2">
						<h5 class="modal-title font-weight-normal"
							id="updateCustomerModalLabel">Update Customer</h5>
						<button type="button" class="btn-close text-dark"
							data-bs-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<!-- Body  -->

					<div class="modal-body p-0">
						<div class="container-fluid">
							<div class="card">
								<div class="card-body">
									<div class="row">


										<div class="col-md-6 col-sm-12">
											<div class="input-group input-group-static mb-4">
												<label>Customer Name</label><span id="spanId">*</span> <input
													type="text" class="required form-control"
													id="edit_customer_name" name="customer_name"
													placeholder="Enter Customer Name" onfocus="focused(this)"
													onfocusout="defocused(this)"> <span
													class="msgError" id="msgError_customer_name"></span>
											</div>
										</div>

										<div class="col-md-6 col-sm-12">
											<div class="input-group input-group-static mb-4">
												<label>Customer Address</label><span id="spanId">*</span> <input
													type="text" class="required form-control"
													id="edit_customer_address" name="customer_address"
													placeholder="Enter Customer Address"
													onfocus="focused(this)" onfocusout="defocused(this)">
												<span class="msgError" id="msgError_customer_address"></span>
											</div>
										</div>

										<div class="col-md-6 col-sm-12">
											<div class="input-group input-group-static mb-4">
												<label>Customer Email</label><span id="spanId">*</span> <input
													type="email" class="required form-control"
													id="edit_customer_email" name="customer_email"
													placeholder="Enter Customer Email" onfocus="focused(this)"
													onfocusout="defocused(this)"> <span
													class="msgError" id="msgError_customer_email"></span>
											</div>
										</div>

										<div class="col-md-6 col-sm-12">
											<div class="input-group input-group-static mb-4">
												<label>Customer Phone</label><span id="spanId">*</span> <input
													type="tel" class="required form-control"
													id="edit_customer_phone" name="customer_phone"
													placeholder="Enter Customer Phone" onfocus="focused(this)"
													onfocusout="defocused(this)"> <span
													class="msgError" id="msgError_customer_phone"></span>
											</div>
										</div>


										<div class="col-md-auto text-end px-1 mt-4">
											<button type="button" class="btn bg-gradient-info"
												id="update_customer_button">Update Customer</button>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

	<script>
    $(document).ready(function() {
    	displayCustomerRecords(); 
    });
    function displayCustomerRecords() {
        $.ajax({
            url: "<%=request.getContextPath()%>/Customer", // Correct URL for your endpoint
            type: "GET",
            data: {
                action: "display",
                searchCustomers: $("#searchCustomers").val() // Get value from search input field
            },
            success: function(data) {
                // Clear the table body before adding new rows
                $('#myItemstbodyId').empty();

                if (data && data.length) {
                    let rowdata = "";
                    for (let i = 0; i < data.length; i++) {
                        const customer = data[i]; // Access each customer object
                        rowdata += "<tr>" +
                            "<td>" +
                                "<button class='btn btn-warning btn-sm' onclick='editCustomer(" + customer.customer_id + ")'>Edit</button>" +
                                "<button class='btn btn-danger btn-sm' onclick='confirmDeleteCustomerBtn(" + customer.customer_id + ")'>Delete</button>" +
                            "</td>" +
                            "<td>" + customer.customer_id + "</td>" +
                            "<td>" + customer.customer_name + "</td>" +
                            "<td>" + customer.customer_address + "</td>" +
                            "<td>" + customer.customer_email + "</td>" +
                            "<td>" + customer.customer_phone + "</td>" +
                        "</tr>";
                    }
                    // Append the new rows to the table body
                    $('#myItemstbodyId').append(rowdata);
                } else {
                    // If no data is found, display a message
                    $('#myItemstbodyId').append('<tr><td colspan="6">No customers found.</td></tr>');
                }
            },
            error: function(error) {
                alert("Error fetching customer records: " + error);
            }
        });
    }
    function addNewCustomer() {
        $.ajax({
            url: "<%=request.getContextPath()%>/Customer", // Correct URL for your endpoint
            type: 'POST',
            data: {
                action: "insert",
                customer_name: $("#customer_name").val(),
                customer_address: $("#customer_address").val(),
                customer_email: $("#customer_email").val(),
                customer_phone: $("#customer_phone").val()
            },
            success: function(data) {
                $("#newCustomer").modal("hide"); 
                displayCustomerRecords(); 
            },
            error: function(error) {
                alert("Error adding customer: " + error);
            }
        });
    }

    function confirmDeleteCustomerBtn(customerId) {
       
        $('#deleteCustomerModal').modal('show');
        $('#deleteCustomerBtn').on('click', function() {
            deleteCustomer(customerId);
        });
    }

    function deleteCustomer(customerId) {
        $.ajax({
            url: "<%=request.getContextPath()%>/Customer", // Correct URL for your endpoint
            type: "POST",
            data: {
                action: "delete",
                customer_id: customerId
            },
            success: function(response) {
                $('#deleteCustomerModal').modal('hide');
                displayCustomerRecords(); // Refresh customer records after deletion
            },
            error: function(error) {
                alert("Error deleting customer: " + error); // Handle error
            }
        });
    }

    function updateCustomer(customerId) {
        $.ajax({
            url: "<%=request.getContextPath()%>/Customer", // Correct URL for your endpoint
            type: 'POST',
            data: {
                action: "update",
                customer_id: customerId,
                customer_name: $("#edit_customer_name").val(),
                customer_address: $("#edit_customer_address").val(),
                customer_email: $("#edit_customer_email").val(),
                customer_phone: $("#edit_customer_phone").val()
            },
            success: function(data) {
                $("#updateCustomerModal").modal("hide");
                displayCustomerRecords(); // Refresh customer records after update
            },
            error: function(error) {
                alert("Error updating customer: " + error); // Error handling
            }
        });
    }

    function editCustomer(customerId) {
        // Fetch customer details to populate the form for editing
        $.ajax({
            url: "<%=request.getContextPath()%>/Customer", // Correct URL for your endpoint
				type : "GET",
				data : {
					action : "getCustomerDetails",
					customer_id : customerId
				},
				success : function(data) {
					if (data) {
						// Populate the form fields with customer data
						$("#edit_customer_name").val(data.customer_name);
						$("#edit_customer_address").val(data.customer_address);
						$("#edit_customer_email").val(data.customer_email);
						$("#edit_customer_phone").val(data.customer_phone);

						// Show the modal to edit the customer details
						$('#updateCustomerModal').modal('show');
					}

					// Set up the update button to trigger the update when clicked
					$('#update_customer_button').on('click', function() {
						updateCustomer(customerId);
					});
				},
				error : function(error) {
					alert("Error fetching customer details: " + error); // Error handling
				}
			});
		}
	</script>

</body>
</html>

