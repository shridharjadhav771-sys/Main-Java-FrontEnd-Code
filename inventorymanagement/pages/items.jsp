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
								<h6 class="font-weight-bolder mb-0 breadcrumb-item active">Items</h6>
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
								placeholder="Search by Item Name, Code, Category..."
								name="searchItems" id="searchItems" onfocus="focused(this)"
								onfocusout="defocused(this)">
						</div>
					</div>
					<div class="col-md-2">
						<button class="btn btn-icon btn-2 btn-dark" id="searchItems"
							type="button" onclick="displayItemRecords()">
							<span class="btn-inner--icon"><i class="material-icons">search</i></span>
						</button>
					</div>
					<div class="col-md-4"></div>
					<div class="col-3" id="addbtbn" style="text-align: end">
						<button data-bs-toggle="modal" data-bs-target="#newTask"
							class="btn btn-link text-info border-0"
							data-bs-placement="bottom" data-bs-original-title=Item Group>
							<i class="bi bi-box"></i> Items
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
								<th style="padding: 5px;">Items_Id</th>
								<th style="padding: 5px;">Group</th>
								<th style="padding: 5px;">Category</th>
								<th style="padding: 5px;">Item Name</th>
								<th style="padding: 5px;">Code</th>
								<th style="padding: 5px;">Description</th>
								<th style="padding: 5px;">Brand</th>
								<th style="padding: 5px;">Model No.</th>
								<th style="padding: 5px;">HSN Code</th>
								<th style="padding: 5px;">Size</th>
								<th style="padding: 5px;">Warranty</th>
								<th style="padding: 5px;">Uom</th>
								<th style="padding: 5px;">Per Unit Price</th>
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
						<h5 class="modal-title" id="newTaskLabel">Add Item</h5>
						<button type="button" class="btn-close text-dark"
							data-bs-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>


					<!-- Body -->
					<!--Body-->
					<div class="modal-body p-0">
						<div class="container-fluid">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-lg-12 col-md-12">
											<form name="taskform" method="post" id="Item_formId"
												onsubmit="" class="is-filled">

												<!-- Add Item -->

												<div class="row">

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Item Group</label> <span id="spanId">*</span> <select
																type="text" class="required form-control"
																id="item_group" name="item_group"
																placeholder="Enter Item Group" onfocus="focused(this)"
																onfocusout="defocused(this)"></select> <span
																class="msgError" id="msgError_item_group"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Item Category</label> <span id="spanId">*</span> <select
																type="text" class="required form-control"
																id="item_category" name="item_category"
																placeholder="Enter Item Category"
																onfocus="focused(this)" onfocusout="defocused(this)"></select>
															<span class="msgError" id="msgError_item_category"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Item Code</label> <span id="spanId">*</span> <input
																type="text" class="required form-control" id="item_code"
																name="item_code" placeholder="Enter Item Code"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_item_code"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Item Name</label> <span id="spanId">*</span> <input
																type="text" class="required form-control" id="item_name"
																name="item_name" placeholder="Enter Item Name"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_item_name"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Item Description</label> <span id="spanId">*</span>
															<input type="text" class="required form-control"
																id="item_description" name="item_description"
																placeholder="Enter Item Description"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_item_description"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Brand Name</label> <span id="spanId">*</span><select
																type="text" class="required form-control"
																id="brand_name" name="brand_name"
																placeholder="Enter Brand Name" onfocus="focused(this)"
																onfocusout="defocused(this)"></select><span
																class="msgError" id="msgError_brand_name"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Model No</label> <span id="spanId">*</span> <input
																type="text" class="required form-control" id="model_no"
																name="model_no" placeholder="Enter Model No"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_model_no"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>HSN Code</label> <span id="spanId">*</span> <input
																type="text" class="required form-control" id="hsn_code"
																name="hsn_code" placeholder="Enter HSN Code"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_hsn_code"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Size</label> <span id="spanId">*</span> <input
																type="text" class="required form-control" id="size"
																name="size" placeholder="Enter Size"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_size"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Warranty</label> <span id="spanId">*</span> <input
																type="text" class="required form-control" id="warranty"
																name="warranty" placeholder="Enter Warranty"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_warranty"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>UOM Name</label> <span id="spanId">*</span> <select
																type="text" class="required form-control" id="uom_name"
																name="uom_name" placeholder="Enter UOM Name"
																onfocus="focused(this)" onfocusout="defocused(this)"></select>
															<span class="msgError" id="msgError_uom_name"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Per Unit Price</label> <span id="spanId">*</span>
															<input type="text" class="required form-control"
																id="per_unit_price" name="per_unit_price"
																placeholder="Enter Per Unit Price"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_per_unit_price"></span>
														</div>
													</div>

												</div>
											</form>
										</div>


										<div class="col-md-12 col-sm-12">
											<div class="input-group mb-4">
												<button type="submit" class="btn btn-primary"
													onclick="addNewItem()">Save</button>
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
						<div class="modal fade" id="editItemModal" tabindex="-1"
							style="display: none;" aria-hidden="true">
							<div
								class="modal-dialog modal-dialog-scrollable  modal-lg modal-dialog-centered"
								role="document">
								<div class="modal-content model-content-css">
									<!-- Header -->
									<div class="modal-header p-2">
										<h5 class="modal-title" id="editItem">Update Item</h5>
										<button type="button" class="btn-close text-dark"
											data-bs-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
									</div>
									<!-- Body -->
									<div class="modal-body p-0">
										<div class="container-fluid">
											<div class="card">
												<div class="card-body">
									<div class="row">

										<!-- Item Group -->
										<div class="col-md-6 col-sm-12">
											<div class="input-group input-group-static mb-4">
												<label>Item Group</label><span id="spanId">*</span> <select
													type="text" class="required form-control"
													id="edit_item_group_id" name="item_group"
													placeholder="Enter Item Group" onfocus="focused(this)"
													onfocusout="defocused(this)"></select> <span
													class="msgError" id="msgError_item_group"></span>
											</div>
										</div>

										<!-- Item Category -->
										<div class="col-md-6 col-sm-12">
											<div class="input-group input-group-static mb-4">
												<label>Item Category</label><span id="spanId">*</span> <select
													type="text" class="required form-control"
													id="edit_item_category_id" name="item_category"
													placeholder="Enter Item Category" onfocus="focused(this)"
													onfocusout="defocused(this)"> </select><span
													class="msgError" id="msgError_item_category"></span>
											</div>
										</div>

										<!-- Item Code -->
										<div class="col-md-6 col-sm-12">
											<div class="input-group input-group-static mb-4">
												<label>Item Code</label><span id="spanId">*</span> <input
													type="text" class="required form-control"
													id="edit_item_code_id" name="item_code"
													placeholder="Enter Item Code" onfocus="focused(this)"
													onfocusout="defocused(this)"> <span
													class="msgError" id="msgError_item_code"></span>
											</div>
										</div>

										<!-- Item Name -->
										<div class="col-md-6 col-sm-12">
											<div class="input-group input-group-static mb-4">
												<label>Item Name</label><span id="spanId">*</span> <input
													type="text" class="required form-control"
													id="edit_item_name_id" name="item_name"
													placeholder="Enter Item Name" onfocus="focused(this)"
													onfocusout="defocused(this)"> <span
													class="msgError" id="msgError_item_name"></span>
											</div>
										</div>

										<!-- Item Description -->
										<div class="col-md-6 col-sm-12">
											<div class="input-group input-group-static mb-4">
												<label>Item Description</label><span id="spanId">*</span> <input
													type="text" class="required form-control"
													id="edit_item_description_id" name="item_description"
													placeholder="Enter Item Description"
													onfocus="focused(this)" onfocusout="defocused(this)">
												<span class="msgError" id="msgError_item_description"></span>
											</div>
										</div>

										<!-- Brand Name -->
										<div class="col-md-6 col-sm-12">
											<div class="input-group input-group-static mb-4">
												<label>Brand Name</label><span id="spanId">*</span> <select
													type="text" class="required form-control"
													id="edit_item_brand_name_id" name="brand_name"
													placeholder="Enter Brand Name" onfocus="focused(this)"
													onfocusout="defocused(this)"></select> <span
													class="msgError" id="msgError_brand_name"></span>
											</div>
										</div>

										<!-- Model No -->
										<div class="col-md-6 col-sm-12">
											<div class="input-group input-group-static mb-4">
												<label>Model No</label><span id="spanId">*</span> <input
													type="text" class="required form-control"
													id="edit_item_model_no_id" name="model_no"
													placeholder="Enter Model No" onfocus="focused(this)"
													onfocusout="defocused(this)"> <span
													class="msgError" id="msgError_model_no"></span>
											</div>
										</div>

										<!-- HSN Code -->
										<div class="col-md-6 col-sm-12">
											<div class="input-group input-group-static mb-4">
												<label>HSN Code</label><span id="spanId">*</span> <input
													type="text" class="required form-control"
													id="edit_hsn_code_id" name="hsn_code"
													placeholder="Enter HSN Code" onfocus="focused(this)"
													onfocusout="defocused(this)"> <span
													class="msgError" id="msgError_hsn_code"></span>
											</div>
										</div>

										<!-- Size -->
										<div class="col-md-6 col-sm-12">
											<div class="input-group input-group-static mb-4">
												<label>Size</label><span id="spanId">*</span> <input
													type="text" class="required form-control" id="edit_size_id"
													name="size" placeholder="Enter Size"
													onfocus="focused(this)" onfocusout="defocused(this)">
												<span class="msgError" id="msgError_size"></span>
											</div>
										</div>

										<!-- Warranty -->
										<div class="col-md-6 col-sm-12">
											<div class="input-group input-group-static mb-4">
												<label>Warranty</label><span id="spanId">*</span> <input
													type="text" class="required form-control"
													id="edit_warranty_id" name="warranty"
													placeholder="Enter Warranty" onfocus="focused(this)"
													onfocusout="defocused(this)"> <span
													class="msgError" id="msgError_warranty"></span>
											</div>
										</div>

										<!-- UOM Name -->
										<div class="col-md-6 col-sm-12">
											<div class="input-group input-group-static mb-4">
												<label>UOM Name</label><span id="spanId">*</span> <select
													type="text" class="required form-control"
													id="edit_uom_name_id" name="edit_uom_name_id"
													placeholder="Enter UOM Name" onfocus="focused(this)"
													onfocusout="defocused(this)"> </select><span
													class="msgError" id="msgError_uom_name"></span>
											</div>
										</div>

										<!-- Per Unit Price -->
										<div class="col-md-6 col-sm-12">
											<div class="input-group input-group-static mb-4">
												<label>Per Unit Price</label><span id="spanId">*</span> <input
													type="text" class="required form-control"
													id="edit_price_per_unit_id" name="per_unit_price"
													placeholder="Enter Per Unit Price" onfocus="focused(this)"
													onfocusout="defocused(this)"> <span
													class="msgError" id="msgError_per_unit_price"></span>
											</div>
										</div>

										<!-- Save and Close Buttons -->
										<div class="row justify-content-md-end mt-4">
											<div class="col-md-auto text-end px-1">
												<button type="button" class="btn bg-gradient-info"
													id="update_item_button">Save</button>
												<button type="button" class="btn btn-link ml-auto"
													data-bs-dismiss="modal">Close</button>
											</div>
										</div>
									</div>

								</div>
											</div>
										</div>
									</div>
									<!-- End Modal Body -->
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
        getItemGroup();
        getItemCategory();
        getItemBrand();
        getItemUom(); 
        displayRecords();
    });
    
    function getItemGroup() {
        $.ajax({
            url: "<%=request.getContextPath()%>/ItemCategory",
            type: 'GET',
            data: { action: "getItemGroup" },
            success: function(data) {
                $("#item_group").empty();
                $("#edit_item_group_id").empty();
                if (data && data.length) {
                    let htmlcnt = "<option value=''>Select Group</option>";
                    for (let i = 0; i < data.length; i++) {
                        htmlcnt += "<option value='" + data[i].item_group_id + "'>" + data[i].item_group_name + "</option>";
                    }
                    $("#item_group").append(htmlcnt);
                    $("#edit_item_group_id").append(htmlcnt);
                }
            },
            error: function(error) {
                alert(error);
            }
        });
    }

    function getItemCategory() {
        $.ajax({
            url: "<%=request.getContextPath()%>/Item",
            type: 'GET',
            data: { action: "getItemCategory" },
            success: function(data) {
                $("#category").empty();
                $("#edit_item_category_id").empty();
                if (data && data.length) {
                    let htmlcnt = "<option value=''>Select Category</option>";
                    for (let i = 0; i < data.length; i++) {
                        htmlcnt += "<option value='" + data[i].item_category_id + "'>" + data[i].category_name + "</option>";
                    }
                    $("#item_category").append(htmlcnt);
                   $("#edit_item_category_id").append(htmlcnt);
                }
            },
            error: function(error) {
                alert(error);
            }
        });
    }

    function getItemBrand() {
        $.ajax({
            url: "<%=request.getContextPath()%>/Item",
            type: 'GET',
            data: { action: "getItemBrand" },
            success: function(data) {
                $("#brand_name").empty();
                $("#edit_item_brand_name_id").empty();
                if (data && data.length) {
                    let htmlcnt = "<option value=''>Select Brand</option>";
                    for (let i = 0; i < data.length; i++) {
                        htmlcnt += "<option value='" + data[i].brand_id + "'>" + data[i].brand_name + "</option>";
                    }
                    $("#brand_name").append(htmlcnt);
                    $("#edit_item_brand_name_id").append(htmlcnt); 
                }
            },
            error: function(error) {
                alert(error);
            }
        });
    }
    
    function getItemUom() {
        $.ajax({
            url: "<%=request.getContextPath()%>/Item",
            type: 'GET',
            data: { action: "getItemUom" },
            success: function(data) {
                $("#uom_name").empty(); 
                $("#edit_uom_name_id").empty(); 
                if (data && data.length) {
                    let htmlcnt = "<option value=''>Select UOM</option>";  // Default option
                    for (let i = 0; i < data.length; i++) {
                        htmlcnt += "<option value='" + data[i].uom_id + "'>" + data[i].uomName + "</option>";
                    }
                    $("#uom_name").append(htmlcnt);  // Append the generated options
                    $("#edit_uom_name_id").append(htmlcnt);
                }
            },
            error: function(error) {
                alert(error);  // Alert if there is an error
            }
        });
    }

    function addNewItem() {
        $.ajax({
            url: "<%=request.getContextPath()%>/Item", 
            type: 'POST',
            data: {
                action: "insert",
                items_group_id: $("#item_group").val(),
                items_group_category: $("#item_category").val(),
                item_name: $("#item_name").val(),
                item_code: $("#item_code").val(),
                item_description: $("#item_description").val(),
                item_brand_name: $("#brand_name").val(),
                item_model_no: $("#model_no").val(),
                hsn_code: $("#hsn_code").val(),
                size: $("#size").val(),
                warranty: $("#warranty").val(),
                uom_name: $("#uom_name").val(),
                price_per_unit: $("#per_unit_price").val()
            },
            success: function(data) {
                $("#newItem").modal("hide"); // Assuming you're hiding a modal after success
                displayRecords(); // Update the items display after success
            },
            error: function(error) {
                alert(error); // Handle any errors
            }
        });
    }

    function displayRecords() {
        $.ajax({
            url: "<%=request.getContextPath()%>/Item", 
            type: 'GET',
            data: {
                action: "display",
                searchItems: $("#searchItems").val()
            },
            success: function(data) {
                if (data && data.length) {
                    $("#myItemstbodyId").empty();  // Clear existing table body content
                    let rowdata = "";
                    for (let i = 0; i < data.length; i++) {
                        rowdata += "<tr>" +
                            "<td>" +
                            "<i onclick='openEditItem(" + data[i].items_id + ");' class='fas fa-edit'></i>" +
                            "<i onclick='confirmDeleteBtn(" + data[i].items_id + ")' class='fas fa-trash'></i>" +
                            "</td>" +
                            "<td>" + data[i].items_id + "</td>" +
                            "<td>" + data[i].group_name + "</td>" +
                            "<td>" + data[i].category_name + "</td>" +
                            "<td>" + data[i].item_name + "</td>" +
                            "<td>" + data[i].item_code + "</td>" +
                            "<td>" + data[i].item_description + "</td>" +
                            "<td>" + data[i].brand_name + "</td>" +
                            "<td>" + data[i].item_model_no + "</td>" +
                            "<td>" + data[i].hsn_code + "</td>" +
                            "<td>" + data[i].size + "</td>" +
                            "<td>" + data[i].warranty + "</td>" +
                            "<td>" + data[i].item_uom_name + "</td>" +
                            "<td>" + data[i].price_per_unit + "</td>" + 
                        "</tr>";
                    }
                    $("#myItemstbodyId").append(rowdata); // Add rows to the table body
                }
            },
            error: function(error) {
                alert("Error fetching data: " + error); // Display error message
            }
        });
    }

    function openEditItem(itemsId) {
        // populate the form fields
        $.ajax({
            url: "<%=request.getContextPath()%>/Item",
            type: "GET",
            data: {
                action: "getItemDetails",
                items_id: itemsId
            },
            success: function(data) {
                if (data) {
                	$("#edit_item_group_id").val(data.items_group_id);
                	$("#edit_item_category_id").val(data.items_group_category);
                    $("#edit_item_name_id").val(data.item_name);
                    $("#edit_item_code_id").val(data.item_code);
                    $("#edit_item_description_id").val(data.item_description);
                    $("#edit_item_brand_name_id").val(data.item_brand_name);
                    $("#edit_item_model_no_id").val(data.item_model_no);
                    $("#edit_hsn_code_id").val(data.hsn_code);
                    $("#edit_size_id").val(data.size);
                    $("#edit_warranty_id").val(data.warranty);
                    $("#edit_uom_name_id").val(data.uom_name);
                    $("#edit_price_per_unit_id").val(data.price_per_unit);
                    $('#editItemModal').modal('show'); // Open the modal to edit the item
                }
                $('#update_item_button').on('click', function() {
                	UpdateItem(itemsId);
                });
            },
            error: function(error) {
                alert("Error fetching item details: " + error);
            }
        });
    }

    function confirmDeleteBtn(itemsId) {
        // Set up the delete button to perform the deletion when confirmed
        $('#deleteModal').modal('show');
        $('#confirmDeleteBtn').on('click', function() {
            deleteItem(itemsId);
        });
    }

    function deleteItem(itemsId) {
        $.ajax({
            url: "<%=request.getContextPath()%>/Item",
            type: "POST",
            data: {
                action: "delete",
                items_id: itemsId
            },
            success: function(response) {
                $('#deleteModal').modal('hide');
                displayRecords();
            },
            error: function(error) {
                alert("Error deleting item: " + error);
            }
        });
    }
    function UpdateItem(itemsId) {
        $.ajax({
            url: "<%=request.getContextPath()%>/Item",
            type: 'POST',
            data: {
                action: "update",
                items_id: itemsId,
                
                item_group_id: $("#edit_item_group_id").val(),
                item_category_id: $("#edit_item_category_id").val(),
                item_name: $("#edit_item_name_id").val(),
                item_code: $("#edit_item_code_id").val(),
                item_description: $("#edit_item_description_id").val(),
                item_brand_name: $("#edit_item_brand_name_id").val(),
                item_model_no: $("#edit_item_model_no_id").val(),
                hsn_code: $("#edit_hsn_code_id").val(),
                size: $("#edit_size_id").val(),
                warranty: $("#edit_warranty_id").val(),
                uom_name: $("#edit_uom_name_id").val(),
                price_per_unit: $("#edit_price_per_unit_id").val()
            },
            success: function(data) {
                $("#editItemModal").modal("hide");
                displayRecords(); 
            },
            error: function(error) {
                alert("Error updating item: " + error);
            }
        });
    }


</script>


</body>
</html>