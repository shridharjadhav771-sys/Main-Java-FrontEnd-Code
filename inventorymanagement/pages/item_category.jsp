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
								<h6 class="font-weight-bolder mb-0 breadcrumb-item active">Item category
</h6>
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
								placeholder="Search Item category by name..."
								name="searchcategory" id="searchcategory"
								onfocus="focused(this)" onfocusout="defocused(this)">
						</div>
					</div>
					<div class="col-md-2">
						<button class="btn btn-icon btn-2 btn-dark" id="searchcategory"
							type="button" onclick="displayRecords()">
							<span class="btn-inner--icon"><i class="material-icons">search</i></span>
						</button>
					</div>
					<div class="col-md-4"></div>
					<div class="col-3" id="addbtbn" style="text-align: end">
						<button data-bs-toggle="modal" data-bs-target="#newCategory"
							class="btn btn-link text-info border-0"
							data-bs-placement="bottom" data-bs-original-title="Item Group">
							<i class="bi bi-box"></i> Category
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
								<th style="padding: 5px;">Action</th>
								<th style="padding: 5px;">Id</th>
								<th style="padding: 5px;">Category Name</th>
								<th style="padding: 5px;">Category Code</th>
								<th style="padding: 5px;">Group</th>
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
		<div class="modal fade" id="newCategory" tabindex="-1"
			aria-labelledby="newCategoryLabel" style="display: none;"
			aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-scrollable  modal-lg modal-dialog-centered"
				role="document">
				<div class="modal-content model-content-css">
					<!--Header-->
					<div class="modal-header p-2">
						<h5 class="modal-title" id="newCategoryLabel">Add Category</h5>
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
											<form name="categoryform" method="post" id="category_formId"
												onsubmit="" class="is-filled">

												<div class="row">

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Category Name</label> <span id="spanId">*</span> <input
																type="text" class="required form-control"
																id="category_name" name="category_name"
																placeholder="Enter Category Name"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_category_name"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Category Code</label> <span id="spanId">*</span> <input
																type="text" class="required form-control"
																id="category_code" name="category_code"
																placeholder="Enter Category Code"
																onfocus="focused(this)" onfocusout="defocused(this)">
															<span class="msgError" id="msgError_category_code"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Group</label> <span id="spanId">*</span> <select
																class="required form-control" id="group" name="group"
																onfocus="focused(this)" onfocusout="defocused(this)"></select>
															<span class="msgError" id="msgError_group"></span>
														</div>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4">
															<label>Status</label> <span id="spanId">*</span> <select
																class="required form-control" id="status" name="status"
																onfocus="focused(this)" onfocusout="defocused(this)">
																<option value="">Select Status</option>
																<option value="active">Active</option>
																<option value="inactive">Inactive</option>
															</select> <span class="msgError" id="msgError_status"></span>
														</div>
													</div>

												</div>

											</form>
										</div>

										<div class="row justify-content-md-end mt-4">
											<div class="col-md-auto text-end px-1">
												<button type="button" class="btn bg-gradient-info"
													id="categoryactionid" onclick="addNewCategory()">Save</button>
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


		<!-- Modal For Update Category -->
		<div class="modal fade" id="editCategory" tabindex="-1" role="dialog"
			aria-labelledby="editCategoryLabel" aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered"
				role="document">
				<div class="modal-content model-content-css">
					<!--Header-->
					<div class="modal-header p-2">
						<h5 class="modal-title" id="editCategoryLabel">Update
							Category</h5>
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
											<form name="editcategoryform" method="post"
												id="edit_category_form_id" onsubmit="return false;"
												class="is-filled">
												<input type="hidden" name="actionType"
													id="edit_action_type_id" value="edit_category"> <input
													type="hidden" name="userId" id="edit_user_id" value="1">
												<input type="hidden" name="userName" value="ADMIN">
												<input type="hidden" name="employeeCode"
													id="edit_employeeCode" value="">

												<!-- Category Name -->
												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-4">
														<label>Category Name</label><span id="spanId">*</span> <input
															type="text" class="required form-control"
															id="edit_category_name_id" name="category_name"
															placeholder="Enter Category Name" onfocus="focused(this)"
															onfocusout="defocused(this)"> <span
															class="msgError" id="msgError_edit_category_name_id"></span>
													</div>
												</div>

												<!-- Category Code -->
												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-4">
														<label>Category Code</label><span id="spanId">*</span> <input
															type="text" class="required form-control"
															id="edit_category_code_id" name="category_code"
															placeholder="Enter Category Code" onfocus="focused(this)"
															onfocusout="defocused(this)"> <span
															class="msgError" id="msgError_edit_category_code_id"></span>
													</div>
												</div>

												<!-- Group -->
												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-4">
														<label>Group</label><span id="spanId">*</span> <input
															type="text" class="required form-control"
															id="edit_group_id" name="group" placeholder="Enter Group"
															onfocus="focused(this)" onfocusout="defocused(this)">
														<span class="msgError" id="msgError_edit_group_id"></span>
													</div>
												</div>

												<!-- Status -->
												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-4">
														<label>Status</label><span id="spanId">*</span> <input
															type="text" class="required form-control"
															id="edit_status_id" name="status"
															placeholder="Enter Status" onfocus="focused(this)"
															onfocusout="defocused(this)"> <span
															class="msgError" id="msgError_edit_status_id"></span>
													</div>
												</div>

												<div class="row justify-content-md-end mt-4">
													<div class="col-md-auto text-end px-1">
														<button type="button" class="btn bg-gradient-info"
															id="edit_category_action_id"  onclick="addItemCategory()" >Save</button>
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
$(document).ready(function(){
	getItemGroup();
	 displayRecords();
});
	
function getItemGroup() {
	$.ajax({
		url : "<%=request.getContextPath()%>/ItemCategory",
	    type: 'GET',
	    data: {
	    action: "getItemGroup"
	    },
	    success: function(data) {
	     $("#group").empty();
	     if(data != ""){
	    	 let htmlcnt = "<option value = ''>Select Group</option>";
	    	 for(let i = 0; i < data.length; i++){
	    		  htmlcnt += "<option value = "+data[i].item_group_id+">"+data[i].item_group_name+"</option>";
	    	 }
	    	 $("#group").append(htmlcnt);
	     }
	    },
	    error: function(error) {
	      alert(error);
	    }
  });
}
function addNewCategory() {
	$.ajax({
		url : "<%=request.getContextPath()%>/ItemCategory",
		type: 'POST',
		data: {
			action: "insert",
			category_name: $("#category_name").val(),
			category_code: $("#category_code").val(),
			item_group: $("#group").val(),
			is_active: $("#status").val(),
		
		},
		success: function(data) {
			$("#newCategory").modal("hide");
			displayRecords();
		},
		error: function(error) {
			alert(error);
		}
	});
}

// Display all records
function displayRecords() {
    $.ajax({
      url: "<%=request.getContextPath()%>/ItemCategory",
      type: 'GET',
      data: {
        action: "display",
        searchcategory: $("#searchcategory").val(),
      },
      success: function(data) {
        if (data != "" && data != null) {
          $("#myItemstbodyId").empty();
          var rowdata = "";
          for (let i = 0; i < data.length; i++) {
        	  rowdata += "<tr>" +
        	    "<td>" +
        	    "<i onclick='editCategory(" + data[i].item_category_id + ")' class='fas fa-edit'></i>" +
        	    "<i onclick='confirmDelete(" + data[i].item_category_id + ")' class='fas fa-trash'></i>" +
        	    "</td>" +
        	    "<td>" + data[i].item_category_id + "</td>" +
        	    "<td>" + data[i].category_name + "</td>" +
        	    "<td>" + data[i].category_code + "</td>" +
        	    "<td>" + data[i].item_group_name + "</td>" +
        	    "<td>" + (data[i].is_active ? "Active" : "Inactive") + "</td>" +
        	    
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
function editCategory(itemId) {
	  $.ajax({
	    url: "<%=request.getContextPath()%>/ItemCategory",
	    type: 'GET',
	    data: { 
	    	action: "getbyid",
	    	item_category_id: itemId 
	    	},
	    success: function(data) {
	      $("#edit_category_name_id").val(data.category_name);
	      $("#edit_category_code_id").val(data.category_code);
	      $("#edit_group_id").val(data.item_group);
	      $("#edit_status_id").val(data.is_active ? "active" : "inactive");
	      $("#edit_category_action_id").attr("onclick", `updateCategory(${itemId})`);
	      $("#editCategory").modal("show");
	    },
	    error: function(error) {
	      alert(error);
	    }
	  });
	}

	// Function to update category
	function updateCategory(itemId) {
	  $.ajax({
	    url: "<%=request.getContextPath()%>/ItemCategory",
	    type: 'POST',
	    data: {
	      action: "update",
	      item_category_id: itemId,
	      category_name: $("#edit_category_name_id").val(),
	      category_code: $("#edit_category_code_id").val(),
	      item_group: $("#edit_group_id").val(),
	      is_active: $("#edit_status_id").val()
	    },
	    success: function(data) {
	      $("#editCategory").modal("hide");
	      displayRecords();
	    },
	    error: function(error) {
	      alert(error);
	    }
	  });
	}

	// Function to confirm delete action
	function confirmDelete(itemId) {
	  $('#deleteModal').modal('show');
	  $("#deleteItem").attr("onclick", `deleteCategory(`+itemId+`)`);
	}

	// Function to delete category
	function deleteCategory(itemId) {
	  $.ajax({
	    url: "<%=request.getContextPath()%>/ItemCategory",
	    type: 'POST',
	    data: {
	      action: "delete",
	      item_category_id: itemId
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

	</script>

</body>
</html>