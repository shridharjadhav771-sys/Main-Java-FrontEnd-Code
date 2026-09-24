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
								<h6 class="font-weight-bolder mb-0 breadcrumb-item active">Brand</h6>
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
								placeholder="Search Brand ......" name="searchBrand"
								id="searchBrand" onfocus="focused(this)"
								onfocusout="defocused(this)">
						</div>
					</div>
					<div class="col-md-2">
						<button class="btn btn-icon btn-2 btn-dark" id="searchBrand"
							type="button" onclick="displayRecords()">
							<span class="btn-inner--icon"><i class="material-icons">search</i></span>
						</button>
					</div>
					<div class="col-md-4"></div>
					<div class="col-3" id="addbtbn" style="text-align: end">
						<button data-bs-toggle="modal" data-bs-target="#newBrand"
							class="btn btn-link text-info border-0"
							data-bs-placement="bottom" data-bs-original-title="Item Group">
							<i class="bi bi-box"></i> Brand
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
								<!-- <th style="padding: 5px;">Company ID</th> -->
								<th style="padding: 5px;">Action</th>
								<th style="padding: 5px;">Brand_ID</th>
								<th style="padding: 5px;">Brand Name</th>
								<th style="padding: 5px;">Brand Description</th>
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
		<div class="modal fade" id="newBrand" tabindex="-1"
			aria-labelledby="newTaskLabel" style="display: none;"
			aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-scrollable  modal-lg modal-dialog-centered"
				role="document">
				<div class="modal-content model-content-css">



					<!--Header-->
					<div class="modal-header p-2">
						<h5 class="modal-title" id="newTaskLabel">Add Brand</h5>
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
											<form name="taskform" method="post" id="brand_formId"
												onsubmit="" class="is-filled">


												<!-- Add Brand -->

												<div class="row">

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Brand Name</label> <span id="spanId">*</span> <input
																type="text" class="required form-control"
																id="brand_name" name="brand_name"
																placeholder="Enter Brand Name" onfocus="focused(this)"
																onfocusout="defocused(this)"> <span
																class="msgError" id="msgError_brand_name"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Brand Description</label> <span id="spanId">*</span>
															<input type="text" class="required form-control"
																id="brand_description" name="brand_description"
																placeholder="Enter Brand Description"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_brand_description"></span>
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
												id="taskactionid" onclick="addNewBrand()">Save</button>
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

		<!-- Modal For Update Brand -->

		<div class="modal fade" id="editBrand" tabindex="-1" role="dialog"
			aria-labelledby="editBrandLabel" aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered"
				role="document">
				<div class="modal-content model-content-css">
					<!--Header-->
					<div class="modal-header p-2">
						<h5 class="modal-title" id="editBrandLabel">Update Brand</h5>
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
											<form name="editBrandForm" method="post"
												id="edit_brand_form_id" onsubmit="return false;"
												class="is-filled">
												<input type="hidden" name="actionType"
													id="edit_action_type_id" value="edit_brand"> <input
													type="hidden" name="userId" id="edit_user_id" value="1">
												<input type="hidden" name="userName" value="ADMIN">
												<input type="hidden" name="employeeCode"
													id="edit_employeeCode" value="">

												<!-- Brand Name -->
												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-4">
														<label>Brand Name</label><span id="spanId">*</span> <input
															type="text" class="required form-control"
															id="edit_brand_name_id" name="brand_name"
															placeholder="Enter Brand Name" onfocus="focused(this)"
															onfocusout="defocused(this)"> <span
															class="msgError" id="msgError_edit_brand_name_id"></span>
													</div>
												</div>

												<!-- Brand Description -->
												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-4">
														<label>Brand Description</label><span id="spanId">*</span>
														<input type="text" class="required form-control"
															id="edit_brand_description_id" name="brand_description"
															placeholder="Enter Brand Description"
															onfocus="focused(this)" onfocusout="defocused(this)">
														<span class="msgError"
															id="msgError_edit_brand_description_id"></span>
													</div>
												</div>

												<!-- Is Active -->
												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-4">
														<label>Is Active</label><span id="spanId">*</span> <select
															class="required form-control" id="edit_is_active_id"
															name="is_active" onfocus="focused(this)"
															onfocusout="defocused(this)">
															<option value="">Select Status</option>
															<option value="active">Active</option>
															<option value="inactive">Inactive</option>
														</select> <span class="msgError" id="msgError_edit_is_active_id"></span>
													</div>
												</div>

												<div class="row justify-content-md-end mt-4">
													<div class="col-md-auto text-end px-1">
														<button type="button" class="btn bg-gradient-info"
															id="edit_brand_action_id" onclick="editBrand()">Save</button>
														<button type="button" class="btn btn-link ml-auto"
															data-bs-dismiss="modal">Close</button>
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

		function addNewBrand() {
			$.ajax({
				url : "<%=request.getContextPath()%>/Brand", 
				type: 'POST',
				data: {
					action: "insert",
					brand_name: $("#brand_name").val(),
					brand_description: $("#brand_description").val(),
					is_active: $("#is_active").val(),
				},
				success: function(data) {
					$("#newBrand").modal("hide");
					displayRecords();
				},
				error: function(error) {
					alert(error);
				}
			});
		}
		
		function displayRecords() {
		    $.ajax({
		      url: "<%=request.getContextPath()%>/Brand", 
		      type: 'GET',
		      data: {
		        action: "display",
		        searchBrand: $("#searchBrand").val(),
		      },
		      success: function(data) {
		        if (data != "" && data != null) {
		          $("#myItemstbodyId").empty();
		          var rowdata = "";
		          for (let i = 0; i < data.length; i++) {
		            rowdata += "<tr>" +
		              "<td>" +
		              "<i onclick='(" + data[i].brand_id + ")' class='fas fa-edit'></i>" +
		              "<i onclick='(" + data[i].brand_id + ")' class='fas fa-trash'></i>" +
		              "</td>" +
		              "<td>" + data[i].brand_id + "</td>" +
		              "<td>" + data[i].brand_name + "</td>" +
		              "<td>" + data[i].brand_description + "</td>" +
		              "<td>" + (data[i].is_active ? "Active" : "Inactive") + "</td>" +
		            "</tr>";
		          }
		          $("#myItemstbodyId").append(rowdata);
		        }
		      },
		      error: function(error) {
		        alert("Error fetching data: " + error);
		      }
		    });
		}

		function editBrand(brandId) {
		  // populate the form fields.
		  $.ajax({
		    url: "<%=request.getContextPath()%>/Brand",
		    type: "GET",
		    data: {
		      action: "getBrandDetails",
		      brand_id: brandId
		    },
		    success: function(data) {
		      if (data != "" && data != null) {
		        // Assuming the response contains the brand details.
		        $("#edit_brand_name_id").val(data.brand_name);
		        $("#edit_brand_description_id").val(data.brand_description);
		        $("#edit_is_active_id").val(data.is_active ? "active" : "inactive");
		        // You can open the modal to edit the brand.
		        $('#editBrand').modal('show');
		      }
		    },
		    error: function(error) {
		      alert("Error fetching brand details: " + error);
		    }
		  });
		}

		function confirmDelete(brandId) {
		  // Set up the delete button to perform the deletion when confirmed.
		 // Set up the delete confirmation modal.
		  $('#deleteModal').modal('show');
		  
		  $('#confirmDeleteBtn').on('click', function() {
		    deleteBrand(brandId);
		  });
		}

		function deleteBrand(brandId) {
		  $.ajax({
		    url: "<%=request.getContextPath()%>
		/Brand",
				type : "POST",
				data : {
					action : "delete",
					brand_id : brandId
				},
				success : function(response) {
					$('#deleteModal').modal('hide');
					displayRecords();
				},
				error : function(error) {
					alert("Error deleting brand: " + error);
				}
			});
		}
	</script>

</body>
</html>