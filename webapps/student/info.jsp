<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="path/to/your/custom-styles.css">
<style>
.modal-content {
	background-color: #f8f9fa;
	padding: 20px;
	border-radius: 10px;
}

.input-group {
	margin-bottom: 15px;
}

.input-group label {
	font-size: 14px;
	font-weight: bold;
}

.input-group input, .input-group select, .input-group textarea {
	border-radius: 4px;
	padding: 10px;
}

.radio-container input {
	margin-right: 5px;
}

.msgError {
	color: red;
	font-size: 12px;
}

.btn {
	border-radius: 5px;
}

.btn-close {
	color: #6c757d;
}

.container-fluid {
	padding: 0;
}
</style>


</head>
<body>
	<div class="modal fade show" id="newTask" tabindex="-1"
		aria-labelledby="newTaskLabel" aria-modal="true" role="dialog"
		style="display: block; padding-left: 0px;">
		<div class="modal-dialog  modal-xl modal-dialog-centered"
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
				<!--Body-->
				<div class="modal-body p-0">
					<div class="container-fluid">
						<div class="card">
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12 col-md-12">
										<form name="taskform" method="post" id="Item_formId"
											onsubmit="" class="is-filled">
											<input type="hidden" name="actionType" id="action_type_id"
												value="add_item">
											<div class="row">

												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-1">
														<label>Item Group</label> <span id="spanId">*</span>
														<div class="relative-container">
															<input class="required form-control" type="text"
																id="search_item_group_id" placeholder="Select"
																onclick="loadRequestedItemGroup(this.value)"
																oninput="loadRequestedItemGroup(this.value)"
																autocomplete="off" onfocus="focused(this)"
																onfocusout="defocused(this)"> <span
																class="msgError" id="msgError_search_item_group_id"></span>
															<select class="required form-control p-2"
																id="item_group_id" name="item_group" size="5"
																style="display: none;">
															</select>
														</div>
														<span class="msgError" id="msgError_item_group_id"></span>
													</div>
												</div>
												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-1">
														<label>Item Category</label><span id="spanId">*</span>
														<div class="relative-container">
															<input class="required form-control" type="text"
																name="uom_category" id="search_item_category_id"
																placeholder="Select"
																onclick="loadRequestedItemCategory(this.value)"
																autocomplete="off" onfocus="focused(this)"
																onfocusout="defocused(this)"> <span
																class="msgError" id="msgError_search_item_category_id"></span>
															<select class="required form-control p-2"
																id="item_category_id" name="from_item_category"
																onchange="generateCodeNew()" size="5"
																style="display: none;">
															</select>
														</div>
														<span class="msgError" id="msgError_item_category_id"></span>
													</div>
												</div>

											</div>

											<div class="row">

												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-1">
														<label>Item Code </label> <span id="spanId">*</span> <input
															type="text" class="required form-control"
															id="item_code_id" name="item_code" readonly=""
															onfocus="focused(this)" onfocusout="defocused(this)">
														<span class="msgError" id="msgError_item_code_id"></span>
													</div>
												</div>
												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-1">
														<label>Item Name </label><span id="spanId">*</span> <input
															type="text" class="required form-control"
															id="item_name_id" name="item_name"
															placeholder="Enter Item Name" onfocus="focused(this)"
															onfocusout="defocused(this)"> <span
															class="msgError" id="msgError_item_name_id"></span>
													</div>
												</div>

											</div>

											<div class="row">
												<div class="col-md-12 col-sm-12">
													<div class="input-group input-group-static mb-1">
														<label>Item Description</label> <span id="spanId">*</span>
														<textarea type="text" rows="2"
															class="required form-control" id="item_description_id"
															name="item_description"
															placeholder="Enter Item Description"></textarea>
														<span class="msgError" id="msgError_item_description_id"></span>
													</div>
												</div>

											</div>
											<div class="row">
												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-1">
														<label>Brand Name</label><span id="spanId">*</span> <input
															class="required form-control" type="text"
															id="search_brand_id"
															onclick="loadRequestedBrand(this.value)"
															oninput="loadRequestedBrand(this.value)"
															placeholder="Select" autocomplete="off"
															onfocus="focused(this)" onfocusout="defocused(this)">
														<span class="msgError" id="msgError_search_brand_id"></span>
														<select class="required form-control p-2" id="brand_id"
															name="brand" size="5" style="display: none;">
														</select>
													</div>
													<span class="msgError" id="msgError_brand_id"></span>
												</div>

												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-1">
														<label>Model No.</label> <input type="text"
															class="form-control" id="model_no_id"
															placeholder="Enter Model No." onfocus="focused(this)"
															onfocusout="defocused(this)"> <span
															class="msgError" id="msgError_model_no_id"></span>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-1">
														<label>HSN Code</label><span id="spanId">*</span> <input
															type="text" class="required form-control"
															id="hsn_code_id" placeholder="Enter HSN Code"
															onfocus="focused(this)" onfocusout="defocused(this)">
														<span class="msgError" id="msgError_hsn_code_id"></span>
													</div>
												</div>
												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-1">
														<label>Size</label> <input type="text"
															class="form-control" id="size_id"
															placeholder="Enter Size" onfocus="focused(this)"
															onfocusout="defocused(this)"> <span
															class="msgError" id="msgError_size_id"></span>
													</div>
												</div>

											</div>

											<div class="row">
												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-1">
														<label>Warranty</label> <input type="text"
															class="form-control" id="warranty_id"
															placeholder="Enter Warranty" onfocus="focused(this)"
															onfocusout="defocused(this)"> <span
															class="msgError" id="msgError_warranty_id"></span>
													</div>
												</div>
												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-1">
														<label>Uom name</label> <span id="spanId">*</span>
														<div class="relative-container">
															<input class="required form-control" type="text"
																placeholder="Select" id="search_uom_id"
																onclick="loadRequestedUomNames(this.value)"
																oninput="loadRequestedUomNames(this.value)"
																autocomplete="off" onfocus="focused(this)"
																onfocusout="defocused(this)"> <span
																class="msgError" id="msgError_search_uom_id"></span> <select
																class="required form-control p-2" id="uom_id" name="uom"
																size="5" style="display: none;">
															</select>
														</div>
														<span class="msgError" id="msgError_uom_id"></span>
													</div>
												</div>

											</div>
											<div class="row">
												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-1">
														<label>Per Unit Price</label><span id="spanId">*</span> <input
															class="required form-control" type="text"
															id="per_unit_price" placeholder="Enter Per Unit Price"
															onfocus="focused(this)" onfocusout="defocused(this)">
														<span class="msgError" id="msgError_per_unit_price"></span>
													</div>
												</div>
												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-1">
														<label>Is Active</label>
														<div class="radio-container is-filled">
															<input type="radio" id="yes" name="is_active_option"
																value="1" checked=""> <label class="radio-label"
																for="yes">Yes</label> <input type="radio" id="no"
																name="is_active_option" value="0"> <label
																class="radio-label" for="no">No</label>
														</div>
														<span class="msgError" id="msgError_is_active_id"></span>
													</div>
												</div>
											</div>



											<div class="row">
												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-4">
														<label>Assignee type </label><span id="spanId">*</span>
														<div class="radio-container is-filled">
															<input type="radio" id="group" name="assignee_type"
																value="1" onchange="toggleAssigneeSection(this)"
																class="radio-input">&nbsp;&nbsp; <label
																class="radio-label" for="group">Group</label> <input
																type="radio" id="user" name="assignee_type" value="0"
																onchange="toggleAssigneeSection(this)"
																class="radio-input" checked="">&nbsp;&nbsp; <label
																class="radio-label" for="user">User</label>
														</div>
														<span class="msgError" id="msgError_assignee_type"></span>
													</div>
												</div>

												<div class="col-md-6 col-sm-12">
													<div class="input-group input-group-static mb-4"
														id="assigneeGroupSection" style="display: none;">
														<label>Approval</label><span id="spanId">*</span>
														<div class="relative-container">
															<input class="form-control required" type="text"
																id="search_employee_group_id"
																onclick="loadAssigneeToGroup(this.value)"
																placeholder="Select Employee Group Name"
																autocomplete="off" onfocus="focused(this)"
																onfocusout="defocused(this)"> <span
																class="msgError" id="msgError_search_employee_group_id"></span>
															<select class="form-control required p-2"
																id="employee_group_id" name="employee_group" size="5"
																style="display: none; background-color: white;"></select>
														</div>
														<span class="msgError" id="msgError_employee_group_id"></span>
													</div>

													<div class="col-md-6 col-sm-12">
														<div class="input-group input-group-static mb-4"
															id="assigneeUserSection" style="display: block;">
															<label>Approval</label><span id="spanId">*</span>
															<div class="relative-container">
																<input class="form-control required" type="text"
																	id="search_emp_name_id"
																	onclick="loadAssigneeTo(this.value)"
																	placeholder="Select Employee  Name" autocomplete="off"
																	onfocus="focused(this)" onfocusout="defocused(this)">
																<span class="msgError" id="msgError_search_emp_name_id"></span>
																<select class="form-control required p-2"
																	id="employee_id" name="employee" size="5"
																	style="display: none; background-color: white;"></select>
															</div>
															<span class="msgError" id="msgError_employee_id"></span>
														</div>
													</div>
												</div>
											</div>


											<div class="row justify-content-md-end mt-2">
												<div class="col-md-auto text-end px-1">
													<button type="button" class="btn bg-gradient-info"
														id="taskactionid" onclick="addNewItem()">Save</button>
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

</body>
</html>