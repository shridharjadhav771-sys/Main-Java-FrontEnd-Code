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


	<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps">
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
								<h6 class="font-weight-bolder mb-0 breadcrumb-item active">UOM</h6>
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
								placeholder="Search Uom ..." name="searchUom"
								id="searchUom" onfocus="focused(this)"
								onfocusout="defocused(this)">
						</div>
					</div>
					<div class="col-md-2">
						<button class="btn btn-icon btn-2 btn-dark" id="searchUom"
							type="button" onclick="displayRecords()">
							<span class="btn-inner--icon"><i class="material-icons">search</i></span>
						</button>
					</div>
					<div class="col-md-4"></div>
					<div class="col-3" id="addbtbn" style="text-align: end">
						<button data-bs-toggle="modal" data-bs-target="#newTask"
							onclick="showNewTaskModel()"
							class="btn btn-link text-info border-0"
							data-bs-placement="bottom" data-bs-original-title="Item Group">
							<i class="bi bi-box"></i> UOM
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
								<th style="padding: 5px;">Uom Name</th>
								<th style="padding: 5px;">Uom Symbol</th>
								
							</tr>
						</thead>
						<tbody id="myItemstbodyId">
						
						</tbody>

					</table>
				</div>

			</div>
		</div>


		<!-- Modal For Add New Leave-->
		<div class="modal fade" id="newTask" tabindex="-1"
			aria-labelledby="newTaskLabel" style="display: none;"
			aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-scrollable  modal-lg modal-dialog-centered"
				role="document">
				<div class="modal-content model-content-css">
					<!--Header-->
					<div class="modal-header p-2">
						<h5 class="modal-title" id="newTaskLabel">Add Uom</h5>
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
											<form name="taskform" method="post" id="item_groupformId"
												onsubmit="" class="is-filled">

												<div class="row">

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Name</label> <span id="spanId">*</span> <input
																type="text" class="required form-control" id="name"
																name="name" placeholder="Enter Name"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_name"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Symbol</label> <span id="spanId">*</span> <input
																type="text" class="required form-control" id="symbol"
																name="symbol" placeholder="Enter Symbol"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_symbol"></span>
														</div>
													</div>

													<!-- <div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Common Code</label> <span id="spanId">*</span> <input
																type="text" class="required form-control"
																id="common_code" name="common_code"
																placeholder="Enter Common Code" onfocus="focused(this)"
																onfocusout="defocused(this)"> <span
																class="msgError" id="msgError_common_code"></span>
														</div>
													</div>
 -->

												</div>


											</form>
										</div>

										<div class="row justify-content-md-end mt-4">
											<div class="col-md-auto text-end px-1">
												<button type="button" class="btn bg-gradient-info"
													id="taskactionid" onclick="addNewUom()">Save</button>
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
		</div>

		<!-- Modal -->
		<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-scrollable modal-dialog-centered"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title font-weight-normal" id="deleteModalLabel">Delete
							Confirmation</h5>
						<button type="button" class="btn-close text-dark"
							data-bs-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Are you sure you want to delete this
						item?</div>
					<div class="modal-footer">
						<button type="button" class="btn bg-gradient-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn bg-gradient-primary"
							data-bs-dismiss="modal" id="deleteItem">Delete</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal For Update Uom -->
		<div class="modal fade" id="editTask" tabindex="-1" role="dialog"
			aria-labelledby="editTaskLabel" aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered"
				role="document">
				<div class="modal-content model-content-css">
					<!--Header-->
					<div class="modal-header p-2">
						<h5 class="modal-title" id="editTaskLabel">Update Uom</h5>
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
											<form name="edittaskform" method="post"
												id="edit_item_group_form_id" onsubmit="return false;"
												class="is-filled">
												<input type="hidden" name="actionType"
													id="edit_action_type_id" value="edit_item_group"> <input
													type="hidden" name="userId" id="edit_user_id" value="1">
												<input type="hidden" name="userName" value="ADMIN">
												<input type="hidden" name="employeeCode"
													id="edit_employeeCode" value="">

												
													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Name</label><span id="spanId">*</span> <input
																type="text" class="required form-control"
																id="edit_name_id" name="name" placeholder="Enter Name"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_edit_name_id"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Symbol</label><span id="spanId">*</span> <input
																type="text" class="required form-control"
																id="edit_symbol_id" name="symbol"
																placeholder="Enter Symbol" onfocus="focused(this)"
																onfocusout="defocused(this)"> <span
																class="msgError" id="msgError_edit_symbol_id"></span>
														</div>
													</div>

													<!-- <div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Common Code</label><span id="spanId">*</span> <input
																type="text" class="required form-control"
																id="edit_common_code_id" name="common_code"
																placeholder="Enter Common Code" onfocus="focused(this)"
																onfocusout="defocused(this)"> <span
																class="msgError" id="msgError_edit_common_code_id"></span>
														</div>
													</div> -->



													<div class="row justify-content-md-end mt-4">
														<div class="col-md-auto text-end px-1">
															<button type="button" class="btn bg-gradient-info"
																id="edit_task_action_id" data-id="">Update</button>
															<button type="button" class="btn btn-link ml-auto"
																data-bs-dismiss="modal">Close</button>

															<!-- <button type="button" class="btn btn-primary btn-block"
															onclick="addNewUom()">Save</button>
 -->
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


	<script type="text/javascript">
  $(document).ready(function() {
    displayRecords();
  });

  // Display all records
  function displayRecords() {
    $.ajax({
      url: "<%=request.getContextPath()%>/UnitofMeasurement",
      type: 'GET',
      data: {
        action: "display",
        searchUom: $("#searchUom").val(),
      },
      success: function(data) {
        if (data != "" && data != null) {
          $("#myItemstbodyId").empty();
          var rowdata = "";
          for (let i = 0; i < data.length; i++) {
            rowdata += "<tr>" +
              "<td><i class=\"fas fa-edit\" onclick=\"editUOM(" + data[i].uom_id + ")\"></i> <i class=\"fas fa-trash\" onclick=\"confirmDelete(" + data[i].uom_id + ")\"></i></td>" +
              "<td>" + data[i].uomName + "</td>" +
              "<td>" + data[i].uomSymbol + "</td>" +
              "</tr>";
          }
          $("#myItemstbodyId").append(rowdata);
        }
      },
      error: function(error) {
        alert(error);
      }
    });
  }

  // Function to handle the editing of an item group
  function editUOM(itemId) {
    // Fetch the existing data for the item
    $.ajax({
      url: "<%=request.getContextPath()%>/UnitofMeasurement",
      type: 'GET',
      data: {
        action: "getbyid",
        item_id: itemId
      },
      success: function(data) {
        // Populate the form with the data
        $("#edit_name_id").val(data.uomName);
        $("#edit_symbol_id").val(data.uomSymbol);
        
        $("#edit_item_group_id").val(data.id); // Store item ID for updating
        $("#edit_task_action_id").attr("onclick", "updateItemGroup(" + itemId + ")");
        $("#editTask").modal("show");
      },
      error: function(error) {
        alert(error);
      }
    });
  }

  // Function to update the item group after editing
  function updateItemGroup(id) {
    $.ajax({
      url: "<%=request.getContextPath()%>/UnitofMeasurement",
      type: 'POST',
      data: {
        action: "update",
        uomid: id,
        name: $("#edit_name_id").val(),
        symbol: $("#edit_symbol_id").val(),
       
      },
      success: function(data) {
        $("#editTask").modal("hide");
        displayRecords();
      },
      error: function(error) {
        alert(error);
      }
    });
  }

  // Function to confirm delete
  function confirmDelete(itemId) {
    // Show the confirmation modal
    $('#deleteModal').modal('show');
    $("#deleteItem").attr("onclick", "deleteItemById(" + itemId + ")");
  }

  // Function to delete an item group
  function deleteItemById(itemId) {
    $.ajax({
      url: "<%=request.getContextPath()%>/UnitofMeasurement",
      type: 'POST',
      data: {
        action: "delete",
        uom_id: itemId
      },
      success: function(data) {
        $('#deleteModal').modal('hide');
        displayRecords();
      },
      error: function(error) {
        alert(error);
      }
    });
  }

  // Function to add a new item group
  function addNewUom() {
			$.ajax({
				url : "<%=request.getContextPath()%>/UnitofMeasurement",
      type: 'POST',
      data: {
        action: "insert",
        name: $("#name").val(),
        symbol: $("#symbol").val(),
        
      },
      success: function(data) {
        $("#newTask").modal("hide");
        displayRecords();
      },
      error: function(error) {
        alert(error);
      }
    });
  }
</script>


</body>
</html>