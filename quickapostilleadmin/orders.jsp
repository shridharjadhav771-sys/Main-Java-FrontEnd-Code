<!DOCTYPE html>
<%@page import="com.dakshabhi.orders.dto.AddonsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dakshabhi.orders.dao.OrderDAO"%>
<%@ page isELIgnored="false"%>

<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="keyword" content=","> 
<title>Quick Apostille Orders</title>
<link rel="shortcut icon" href="img/favicon-07.png">
<link href="vendors/css/flag-icon.min.css" rel="stylesheet">
<link href="vendors/css/font-awesome.min.css" rel="stylesheet">
<link href="vendors/css/simple-line-icons.min.css" rel="stylesheet">
<!-- Main styles for this application -->
<link href="css/style.css?v=1.16" rel="stylesheet">
<!-- Styles required by this views -->
<link
	href="<%=request.getContextPath()%>/admin/css/jquery-ui-1.8.11.custom.css"
	rel="stylesheet" type="text/css" />
<link href="vendors/css/daterangepicker.min.css" rel="stylesheet">
<link href="vendors/css/select2.min.css" rel="stylesheet">
<link href="vendors/css/gauge.min.css" rel="stylesheet">
<link href="vendors/css/toastr.min.css" rel="stylesheet">
<link href="vendors/css/dataTables.bootstrap4.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/admin/scripts/jquery.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/admin/scripts/jquery-ui.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/admin/scripts/bootstrap.min.js"
	type="text/javascript"></script>

<script src="//cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
	a#changeQuantity {
	    color: #20a8d8;
	    text-decoration: underline;
	}
	#copy_to_clipboard {
	    background-color: rgb(240 240 240 / 45%);
	    border: 1px solid #d2ebf9;
	    border-left: 0px !important;
	    cursor: pointer;
	    font-size: 20px;
	    padding-left: 5px;
	    padding-right: 5px;
	}
	i.fa.fa-check {
	    color: #04a804;
	}
	a#changeQuantity, .fa-check{
	    cursor: pointer;
	}
	.addon-box {
	    width: fit-content;
	}
	span.addonquantitycls {
	    padding-left: 6px;
	    padding-right: 14px;
	}
</style>
</head>

<body class="app header-fixed  aside-menu-hidden sidebar-minimized brand-minimized">
	<header class="app-header navbar">
		<button class="navbar-toggler mobile-sidebar-toggler d-lg-none"
			type="button">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar " href="#"><img src="img/favicon-07.png" alt="Quick Apostille Admin" style="width: 50px;"></a>
		<button class="navbar-toggler sidebar-toggler d-md-down-none"
			type="button">
			<span class="navbar-toggler-icon"></span>
		</button>
		<ul class="nav navbar-nav d-md-down-none mr-auto">

		</ul>
		<ul class="nav navbar-nav ml-auto">
			<li class="nav-item dropdown"><a class="nav-link nav-link"
				data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
				aria-expanded="false"> <img src="img/avatars/users.jpg"
					class="img-avatar">
			</a>
				<div class="dropdown-menu dropdown-menu-right">
					<a class="dropdown-item" href="profile.jsp"><i
						class="fa fa-user-md"></i> My Profile</a> <a class="dropdown-item"
						href="logout"><i class="fa fa-sign-out"></i> Logout</a>
				</div></li>
		</ul>
	</header>
	<div class="app-body">
		 

		<main class="main">
			<ol class="breadcrumb">
				<li class="breadcrumb-item">Home</li>
				<li class="breadcrumb-item active">Orders</li>
			</ol>
			<div class="container-fluid">
				<div class="animated fadeIn">

					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-header">
									<div class="row">
										<div class="col-sm-6 col-xs-6">
											<strong>Orders</strong>
										</div>
									</div>

								</div>

								<div class="card-body">
									<form action="" name="customersearch" id="customersearchid">


										<div class="row d-flex align-items-end flex-wrap">

											<div class="col-auto">
												<label for="searchKeyword"><strong>Name/Email</strong></label>
												<input type="text" name="searchKeyword" id="searchKeyword"
													class="form-control" />
											</div>

											<div class="col-auto">
												<label for="dateFilter"><strong>Date Filter</strong></label>
												<select id="dateFilter" class="form-control">
													<option value="today" selected>Today</option>
													<option value="yesterday">Yesterday</option> 
													<option value="this_month">This Month</option>
													<option value="custom">Custom</option>
												</select>
											</div>

											<div class="col-auto" id="fromdaterange"
												style="display: none;">
												<label for="StartDate"><strong>Previous Day</strong></label>
												<input type="text" name="fromDate" id="StartDate"
													class="form-control" />
											</div>

											<div class="col-auto" id="todaterange" style="display: none;">
												<label for="StopDate"><strong>Next Day</strong></label> <input
													type="text" name="toDate" id="StopDate"
													class="form-control" />
											</div>

											<div class="col-auto">
												<label for="statusid"><strong>Status</strong></label> <select
													name="status" id="statusid" class="form-control">
													<option value="" selected>All</option>
													<option value="1">Confirmed</option>
													<option value="0">Un-confirmed</option>
												</select>
											</div>

											<div class="col-auto" style="padding-top: 24px;">
												<button type="button" class="btn btn-primary"
													id="round_corner" onclick="getCustomers()">
													<i class="fa fa-search"></i>&nbsp; Go
												</button>
											</div>

										</div>
										
									</form>
								</div>

								<div class="card-body">
									<table
										class="table table-responsive-sm table-striped table-sm "
										id="orderlist">
										<thead>
											<tr>
												<th></th>
												<th>Order ID</th>
												<th>Dates</th>
												<th>Payment ID</th>
												<th>Customer</th>
												<th>Services</th>
												<th>Shipping</th>
												<th>Document</th>
												<th>Notes</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody id="orderlistbodyid">
										</tbody>
									</table>
								</div> 
							</div>
						</div>
					</div>

				</div>
			</div>
<<<<<<< .mine
		</main>


	<!-- Edit Order Modal -->
	<div class="modal fade" id="editOrderModal" tabindex="-1" role="dialog"
		aria-labelledby="editOrderModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<form id="editOrderForm">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Edit Order</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span>&times;</span>
						</button>
					</div>
					<div class="modal-body">
    <input type="hidden" id="editOrderId" name="orderId">

    <div class="form-row">
        <div class="form-group col-md-4">
            <label>Dates</label>
            <input type="text" class="form-control" id="editDateCreated" name="dateCreated" readonly>
        </div>
        <div class="form-group col-md-4">
            <label>Payment ID</label>
            <input type="text" class="form-control" id="editPaymentId" name="paymentId" readonly>
        </div>
        <div class="form-group col-md-4">
            <label>Email</label>
            <input type="email" class="form-control" id="email" name="email" readonly>
        </div>
    </div>

    <div class="form-row">
        <div class="form-group col-md-4">
            <label>First Name</label>
            <input type="text" class="form-control" id="firstName" name="firstName">
        </div>
        <div class="form-group col-md-4">
            <label>Last Name</label>
            <input type="text" class="form-control" id="lastName" name="lastName">
        </div>
        <div class="form-group col-md-4">
            <label>Phone</label>
            <input type="tel" class="form-control" id="phone" name="phone">
        </div>
    </div>

    <div class="form-row">
        <div class="form-group col-md-4">
            <label>Country</label>
            <input type="text" class="form-control" id="country" name="country" readonly>
        </div>        
        <div class="form-group col-md-4">
            <label>Shipping</label>
            <input type="text" class="form-control" id="editShipping" name="shipping" readonly>
        </div>
        <div class="form-group col-md-4">
            <label>Status</label>
            <select class="form-control" id="editStatus" name="status">
                <option value="1">Confirmed</option>
                <option value="0">Un-confirmed</option>
            </select>
        </div>
    </div>
	<div class="form-row">
        <div class="form-group col-md-12">
            <label>Services</label>
            <input type="text" class="form-control" id="editServices" name="services" readonly>
        </div>
    </div>
    <div class="form-row">
        <!-- <div class="form-group col-md-4">
            <label>Document</label>
            <input type="text" class="form-control" id="editDocument" name="document" readonly>
        </div> -->
        
        <div class="form-group col-md-4">
            <!-- Placeholder to keep layout consistent -->
        </div>
    </div>
</div>


					<div class="modal-footer">
						<button type="submit" class="btn btn-success">Save
							Changes</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Cancel</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- Edit Order ENDS Modal -->

	</div> 
	<!-- CONTENT ENDS HERE-->
||||||| .r5069
		</main>
	</div> 
	<!-- CONTENT ENDS HERE-->
=======
</main>
</div>
	 <div class="modal fade" id="ViewOrderModal" tabindex="-1" role="dialog"
			aria-labelledby="orderModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-scrollable modal-dialog-centered"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Order Details</h4>
						<button type="button" class="btn btn-close text-dark" onclick = "closemodal()">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body m-3">
					<div class="row">
							<div class="col-md-12">
							<label><strong>Checkout Page Link :</strong></label> 
							<div id="orderCheckoutPageLink" class = "input-group">						
								<input class="form-control" name="link" id="orderLink" />
								<div class="input-group-append p-2" id = "copy_to_clipboard">
									<i class="fa fa-copy"></i>
								</div>
								
							</div>
								
							</div>
						</div>
					<form id = "updateForm" name = "updateForm">
						<input name="action" value="updateDetails" hidden />
						<input name="orderId" id = "orderId" hidden />
						<input name="orderCost" id ="orderCost" hidden />
						
						<div class="row mt-5">
							<div class="col-md-12">
								<div>
									<span id="productName"></span> <span class="quantitycls"></span>
									<span> <a id="changeQuantity"
										onclick="changeQuantity('changeQty')">Change Quantity</a> <input
										type="number" id="productquantity"
										class="input-text qty text-center ms-2" name="productquantity"
										value="1" min="1" max="5" step="1" autocomplete="off"
										style="display: none;"> <a id="checkIcon"
										onclick="changeQuantity('checkIcon')" style="display: none;"><i
											class="fa fa-check" aria-hidden="true"></i></a>
									</span>
								</div>
							</div>
						</div>
						<div class="row mt-4">
							<div class="col-md-12">
								<div>
									<strong class="d-block">Additional Services</strong>
								</div>
								<div id="addon-container" class="p-4">
									<div class="addon-box d-flex">
										<label class="addon-label d-flex justify-content-between">
											<span><input type="checkbox" name="addon_values"
												class="form-check-input addon-checkbox addon-option"
												data-name="Add Notarization"> <span
												class="addon-title">Add Notarization 
											</span> 
											</span>
										</label>
											<span> <span class="addonquantitycls"> x 1</span><a
														class="changeQuantityForAddons"
														onclick="changeAddonQuantity(this,'showlink')"><i
															class="fa fa-pencil-square-o" aria-hidden="true"></i></a> <span
														class="addonquantitydiv" style="display: none;"><input
															type="number"
															class="input-text qty text-center ms-2 addonquantity"
															oninput="saveAddonQuantity(this)" name="addonquantity1"
															value="1" min="1" max="5" step="1" autocomplete="off">
															<a class="checkAddonIcon"
															onclick="changeAddonQuantity(this,'hidelink')"><i
																class="fa fa-check" aria-hidden="true"></i></a></span>
												</span>
											

									</div>
									<div class="addon-box d-flex">
										<label class="addon-label d-flex justify-content-between"><span>
												<input type="checkbox" name="addon_values"
												class="form-check-input addon-checkbox addon-option"
												data-name="Add Translation"> <span
												class="addon-title">Add Translation
											</span>
											</span> </label>
											 <span> <span class="addonquantitycls"> x 1</span><a
														class="changeQuantityForAddons"
														onclick="changeAddonQuantity(this,'showlink')"><i
															class="fa fa-pencil-square-o" aria-hidden="true"></i></a> <span
														class="addonquantitydiv" style="display: none;"><input
															type="number"
															class="input-text qty text-center ms-2 addonquantity"
															oninput="saveAddonQuantity(this)" name="addonquantity2"
															value="1" min="1" max="5" step="1" autocomplete="off">
															<a class="checkAddonIcon"
															onclick="changeAddonQuantity(this,'hidelink')"><i
																class="fa fa-check" aria-hidden="true"></i></a></span>
												</span>
										
									</div>
									<div class="addon-box d-flex">
										<label class="addon-label d-flex justify-content-between">
											<span><input type="checkbox" name="addon_values"
												class="form-check-input addon-checkbox addon-option"
												data-name="Add Certified Copy of Passport/ID"> <span
												class="addon-title">Add Certified Copy of Passport/ID
											</span>
											</span>
										</label>
											 <span> <span class="addonquantitycls"> x 1</span><a
														class="changeQuantityForAddons"
														onclick="changeAddonQuantity(this,'showlink')"><i
															class="fa fa-pencil-square-o" aria-hidden="true"></i></a> <span
														class="addonquantitydiv" style="display: none;"><input
															type="number"
															class="input-text qty text-center ms-2 addonquantity"
															oninput="saveAddonQuantity(this)" name="addonquantity3"
															value="1" min="1" max="5" step="1" autocomplete="off">
															<a class="checkAddonIcon"
															onclick="changeAddonQuantity(this,'hidelink')"><i
																class="fa fa-check" aria-hidden="true"></i></a></span>
												</span>
											

									</div>
									<div class="addon-box d-flex">
										<label class="addon-label d-flex justify-content-between">
											<span><input type="checkbox" name="addon_values"
												class="form-check-input addon-checkbox addon-option"
												data-name="Express Service"> <span
												class="addon-title">Express Service
											</span>
											</span>
										</label>
											 <span> <span class="addonquantitycls"> x 1</span><a
														class="changeQuantityForAddons"
														onclick="changeAddonQuantity(this,'showlink')"><i
															class="fa fa-pencil-square-o" aria-hidden="true"></i></a> <span
														class="addonquantitydiv" style="display: none;"><input
															type="number"
															class="input-text qty text-center ms-2 addonquantity"
															oninput="saveAddonQuantity(this)" name="addonquantity4"
															value="1" min="1" max="5" step="1" autocomplete="off">
															<a class="checkAddonIcon"
															onclick="changeAddonQuantity(this,'hidelink')"><i
																class="fa fa-check" aria-hidden="true"></i></a></span>
												</span>
											
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="mb-3 mt-2">
									<div>
										<strong class="d-block mb-1">Shipping Options</strong>
									</div>
									<div class="" id="shippingOptions">
										<div class="form-check mt-4">
											<input class="form-check-input" type="radio"
												name="shipping_method" id="onlineCopy"
												value="Online Copy (Email)::0.00"> <label
												class="form-check-label d-flex justify-content-between"
												for="onlineCopy"> Online Copy (Email): <span
												class="charges"><span class="currencySymbol"></span>0.00</span>
											</label>
										</div>
										<div class="form-check mt-2">
											<input class="form-check-input" type="radio"
												value="Local Registered Mail (With Tracking-nr)::49.00"
												name="shipping_method" id="localMail"> <label
												class="form-check-label d-flex justify-content-between"
												for="localMail"> Local Registered Mail (With
												Tracking-nr): <span class="charges"><span
													class="currencySymbol"></span>49.00</span>
											</label>
										</div>
										<div class="form-check mt-2">
											<input class="form-check-input" type="radio"
												value="DHL Express (With Tracking-nr)::89.00"
												name="shipping_method" id="dhlExpress"> <label
												class="form-check-label d-flex justify-content-between"
												for="dhlExpress"> DHL Express (With Tracking-nr): <span
												class="charges"><span class="currencySymbol"></span>89.00</span>
											</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
					<div class="modal-footer">
						<div id = "successmsg" style = "display: none;"></div>
						<button type="button" class="btn"
							data-bs-dismiss="modal" onclick = "closemodal()">Close</button>
						<button type="button" class="btn btn btn-primary"
							id="orderDetailsBtn" data-bs-dismiss="modal"
							onclick="saveOrderDetails();">Save</button>
					</div>
				</div>
			</div>
		</div>
>>>>>>> .r5080
	<div id="footer" class="app-footer">
		<div id="copy">
			Copyright &copy;
			<%=java.util.Calendar.getInstance().get(java.util.Calendar.YEAR)%>
			All rights reserved. Powered By Dakshabhi IT Solutions.
		</div>

		<!-- COPY ENDS HERE -->
	</div>


	<script src="vendors/js/popper.min.js"></script>
	<script src="vendors/js/bootstrap.min.js"></script>
	<script src="vendors/js/pace.min.js"></script>

	<!-- Plugins and scripts required by all views -->
	<script src="vendors/js/Chart.min.js"></script>

	<!-- CoreUI Pro main scripts -->

	<script src="js/app.js"></script>

	<!-- Plugins and scripts required by this views -->
	<script src="vendors/js/jquery.maskedinput.min.js"></script>
	<script src="vendors/js/moment.min.js"></script>
	<script src="vendors/js/select2.min.js"></script>
	<script src="vendors/js/daterangepicker.min.js"></script>

	<!-- Custom scripts required by this view -->
	<script src="js/views/advanced-forms.js"></script>
	<script> 
		var contextpath="<%=request.getContextPath()%>";
	</script>

	<script type="text/javascript">
	document.getElementById('dateFilter').addEventListener('change', function () {
		const showCustom = this.value === 'custom';
		document.getElementById('fromdaterange').style.display = showCustom ? 'block' : 'none';
		document.getElementById('todaterange').style.display = showCustom ? 'block' : 'none';
		if(this.value === 'today'){
			$("#StartDate").datepicker("setDate", 'today');
			$('#StopDate').datepicker('setDate', 'today');
			getCustomers();
		}else if(this.value === 'yesterday'){
			$("#StartDate").datepicker("setDate", -1);
			$('#StopDate').datepicker('setDate', -1);
			getCustomers();
		}else if(this.value === 'this_month'){
			var d = new Date();
			var currMonth = d.getMonth();
			var currYear = d.getFullYear();
			var startDate = new Date(currYear, currMonth, 1);
			$("#StartDate").datepicker("setDate", startDate);
			$('#StopDate').datepicker('setDate', 'today');
			getCustomers();
		}
		
	});
	
		$(function() {
			$("#StartDate").datepicker({
				dateFormat : 'yy-mm-dd'
			});
			$("#StopDate").datepicker({
				dateFormat : 'yy-mm-dd'
			});
			
			$("#StartDate").datepicker("setDate", 'today');
			$('#StopDate').datepicker('setDate', 'today');
			getCustomers();
		});

		function getCustomers() {
			params = "";
			$("#orderlistbodyid").empty();
			jQuery.ajax({
						type : "GET",
						url : "orders",
						data : {
							acttionType : 'list',
							searchKeyword : $('#searchKeyword').val(),
							fromDate : $('#StartDate').val(),
							toDate : $('#StopDate').val(),
							orderStatus : $('#statusid').val()
						},
						async : true,
						success : function(data) {
							console.log(data);
							var jsonData = eval(data);
							if (jsonData.length == 0) {
								$("#orderlistbodyid")
										.append(
												"<tr><td colspan='11'><center><b style='color:red'>No records found....<b></center></td></tr>");
							}
							for (var i = 0; i < jsonData.length; i++) {
								var rowdata = jsonData[i];
								newRowContent = getRowData(rowdata);
								$("#orderlistbodyid").append(newRowContent);
							}
						},
						error : function(data) {
							alert("Error in process. Please try again.");
						}
					});
		}

		function getRowData(data) {
			var rowData = "<tr>";
			rowData += "<td></td>";
			rowData += "<td>"+ data.orderId +"</td>"
			rowData += "<td>"+ data.dateCreated +":"+ data.timeCreated +"</td>" 
			rowData += "<td>"+ data.currencyCode +" " + data.totalCost + "<br/>"+ data.paymentId +"</td>"
			rowData += "<td>"+ data.firstName + " " + data.lastName + "<br/>" + data.email + "<br/>" + data.phone +" <br/>" + data.country +":"+ data.userIP +"</td>"
			rowData += "<td>"+ data.additionalServices +"</td>"
			rowData += "<td>"+ data.shippingMethod + "("+ data.shippingCost +")</td>"
			console.log("Documents: " + data.documentList.length);
			if(data.documentName !== ''){
				rowData += "<td>"+ data.documentName +" <a href='https://www.quickapostille.online/apostille/document/"+ data.orderId +"/"+data.documentName+"' target='_'><i class='fa fa-file-text-o' aria-hidden='true'></i></a></td>"
			}else if(data.documentList.length > 0 ){
				rowData += "<td>"
				for (var i = 0; i < data.documentList.length; i++) {
					var doc = data.documentList[i]; 
					rowData +=  doc +" <a href='https://www.quickapostille.online/apostille/document/"+ data.orderId +"/"+doc+"' target='_'><i class='fa fa-file-text-o' aria-hidden='true'></i></a><br/>"
				}
				rowData += "</td>"
				
			} else{
				
				rowData += "<td></td>"
			}
			
			rowData += "<td>"+ data.notes +"</td>";
			
			if(data.orderStatus =='1'){
				rowData += "<td><img src='img/Good-mark.png'></td>";
			}else if(data.orderStatus =='0'){
				rowData += "<td><img src='img/pending.png'><button class = 'btn' id = 'createLinkBtn' onclick = 'getOrderDetails("+ data.orderId +");'>Create Link</button></td>";
			}
			 
			rowData += "</tr>";
			return rowData;
		}
<<<<<<< .mine
		function viewInfo(orderId) {
			  $.ajax({
			    type: 'GET',
			    url: 'orders',
			    data: { acttionType: 'getOrder', orderId: orderId },
			    success: function(data) {
			      const order = data;
			      $('#editOrderId').val(order.orderId);
			      $('#editDateCreated').val(order.dateCreated);
			      $('#editPaymentId').val(order.paymentId);


			      $('#firstName').val(order.firstName);
			      $('#lastName').val(order.lastName);
			      $('#email').val(order.email);
			      $('#phone').val(order.phone);
			      $('#country').val(order.country);


			      $('#editServices').val(order.additionalServices.replaceAll('<br/>', ','));
			      $('#editShipping').val(order.shippingMethod + ' (' + order.shippingCost + ')');
			      $('#editDocument').val(order.documentName);
			      $('#editStatus').val(order.orderStatus);
			      $('#editOrderModal').modal('show');
			    },
			    error: function() {
			      alert('Failed to fetch order details.');
			    }
			  });
			}

			$('#editOrderForm').on('submit', function(e) {
			  e.preventDefault();
			  const formData = {
			    orderId: $('#editOrderId').val(),
			    paymentId: $('#editPaymentId').val(),
			    customer: $('#firstName').val(),
			    last_name: $('#lastName').val(),
			    phone_no: $('#phone').val(),
			    status: $('#editStatus').val(),
			    acttionType: 'updateOrder'
			  };

			  $.ajax({
			    type: 'POST',
			    url: 'orders',
			    data: formData,
			    success: function(response) {
			      $('#editOrderModal').modal('hide');
			      alert('Order updated successfully!');
			      getCustomers();
			    },
			    error: function() {
			      alert('Update failed. Please try again.');
			    }
			  });
			});

||||||| .r5069
=======
		
		function viewInfo(id){
			$("#orderinfodialog").modal("show");
		}
		var productprice = 0.00;
		function getOrderDetails(id){
			$("#successmsg").hide();
			$('.changeQuantityForAddons').show()
			$(".addonquantitydiv").hide();
			document.getElementById("updateForm").reset();
			changeQuantity("");
			$("#ViewOrderModal").modal('show');
			jQuery.ajax({
				type : "GET",
				url : "updateorder",
				data : {
					id : id
				},
				success : function(data) {
					let country = "";
					if(data != null){
						if(data.order != undefined){
							let order = data.order;
							$("#productName").text(order.product);
							$(".quantitycls").text(" x "+order.quantity);
							$("#productquantity").text(order.quantity);
							//$("#orderLink").val("http://localhost:8080/quickapostille/checkout?token="+order.sessionId);
							$("#orderLink").val("https://www.quickapostille.online/apostille/checkout?token="+order.sessionId);
							if(order.shippingMethod === 'DHL Express (With Tracking-nr)'){
								$("#dhlExpress").prop("checked",true);
							}else if(order.shippingMethod === 'Local Registered Mail (With Tracking-nr)'){
								$("#localMail").prop("checked",true);
							}else {
								$("#onlineCopy").prop("checked",true);
							}
							$("#orderId").val(order.orderId);
							$("#productquantity").val(order.quantity);
							productprice = order.product_price;
							country = order.country;
						}
						<%
						OrderDAO orderdao = new OrderDAO();
						ArrayList<AddonsDTO> addonsList = orderdao.getAddonsPrice();
						%>
						const prices = {
								AE: {
						            addonTexts: [
						            <% 
						                if (addonsList != null) {
						                    for (int i = 0; i < addonsList.size(); i++) {
						                        AddonsDTO addon = addonsList.get(i);
						                        String comma = (i < addonsList.size() - 1) ? "," : "";
						            %>
						                '<%= addon.getAddon_name() %>::<%= String.format("%.2f", addon.getUae_price())%>'<%= comma %>
						            <% 
						                    }
						                }
						            %>
						            ]
						        },
						        GBP: {
						            addonTexts: [
						            <% 
						                if (addonsList != null) {
						                    for (int i = 0; i < addonsList.size(); i++) {
						                        AddonsDTO addon = addonsList.get(i);
						                        String comma = (i < addonsList.size() - 1) ? "," : "";
						            %>
						                '<%= addon.getAddon_name() %>::<%= String.format("%.2f", addon.getGbp_price())%>'<%= comma %>
						            <% 
						                    }
						                }
						            %>
						            ]
						        },
						        EUR: {
						            addonTexts: [
						            <% 
						                if (addonsList != null) {
						                    for (int i = 0; i < addonsList.size(); i++) {
						                        AddonsDTO addon = addonsList.get(i);
						                        String comma = (i < addonsList.size() - 1) ? "," : "";
						            %>
						                '<%= addon.getAddon_name() %>::<%= String.format("%.2f", addon.getEuro_price())%>'<%= comma %>
						            <% 
						                    }
						                }
						            %>
						            ]
						        },
						        DEFAULT: {
						            addonTexts: [
						            <% 
						                if (addonsList != null) {
						                    for (int i = 0; i < addonsList.size(); i++) {
						                        AddonsDTO addon = addonsList.get(i);
						                        String comma = (i < addonsList.size() - 1) ? "," : "";
						            %>
						                '<%= addon.getAddon_name() %>::<%= String.format("%.2f", addon.getUs_price())%>'<%= comma %>
						            <% 
						                    }
						                }
						            %>
						            ]
						        }
						    };
						let priceSet;
						let currencySymbol = "\u0024";
						let currencyCode = "USD";

						if (country === 'AE') {
							priceSet = prices.AE;
							currencySymbol = "AED ";
							currencyCode = "AED";
						} else if (country === 'GB') {
							priceSet = prices.GBP;
							currencySymbol = "\u00A3";
							currencyCode = "GBP";
						} else if (country !== '' && country !== 'US' && country !== 'IN') {
							priceSet = prices.EUR;
							currencySymbol = "\u20AC";
							currencyCode = "EUR";
						} else {
							priceSet = prices.DEFAULT;
						}
						$('[name="addon_values"]').each(function (index) {
					        if (priceSet.addonTexts[index]) {
					            this.value = priceSet.addonTexts[index];
					        }
					    });	
						$(".addonquantitycls").text("x 1");
				        $(".addonquantity").val(1);
						if(data.addonList != undefined){
							 let checkboxValues = data.addonList;
							 checkboxValues.forEach(function (val) {							   	  
						         $('input[type="checkbox"][data-name="' + val.product_name + '"]').prop('checked', true);
						         $('input[type="checkbox"][data-name="' + val.product_name + '"]').attr('value',val.product_name+"::"+ val.product_price.toFixed(2));
						         $('input[type="checkbox"][data-name="' + val.product_name + '"]').parent().parent().parent().find(".addonquantitycls").text("x " + val.product_quantity);
						         $('input[type="checkbox"][data-name="' + val.product_name + '"]').parent().parent().parent().find(".addonquantity").val(val.product_quantity);
							 });
						}
						
					}
				},
				error : function(data) {
					alert("Error in process. Please try again.");
				}
			});
		}
		function closemodal(){
			$("#ViewOrderModal").modal('hide');
		}
		function changeQuantity(action){
			if(action === 'changeQty'){
				$('#productquantity,#checkIcon').show();
				$('#changeQuantity').hide();				
			}else{
				$('#productquantity,#checkIcon').hide();
				$('#changeQuantity').show();
				$(".quantitycls").text(" x "+$('#productquantity').val());
			}
				
		}
		function saveOrderDetails(){
			var form = document.updateForm; 
			updateTotal();
		    let formData = new FormData(form);
			$.ajax({
		        url: 'updateorder',
		        type: 'POST',
		        data: formData,
		        contentType: false,
		        processData: false,
		        success: function(response) {
		        	getCustomers();
		        	$("#successmsg").show();
		        	if(response){
						$("#successmsg").css('color', 'green').text("Data updated successfully!");
		        	}else{
		        		$("#successmsg").css('color', 'red').text("Error in process. Please try again.");
		        	}
		        },
		        error: function(error) {
		          console.log(error);
		        }
		      });
		}
		function updateTotal() {
		    total = 0;
		    document.querySelectorAll('.addon-option:checked').forEach(function (checkbox) {
				let qty = $(checkbox).parent().parent().parent().find(".addonquantity").val();
		        total += parseFloat(checkbox.value.split("::")[1]) * parseInt(qty);
		    });
			let shipping = parseFloat($('[name="shipping_method"]:checked').val().split("::")[1]);
		    let finalCost = total + shipping + (productprice * $('#productquantity').val());
		    $("#orderCost").val(finalCost.toFixed(2));
		}
		let productquantity = 1;
		$('#productquantity').on('input', function () {
		    let value = parseInt(this.value);
		    if (!isNaN(value) && value >= 1 && value <= 5) {
		        productquantity = value;
		    } else {
		        productquantity = 1;
		        this.value = 1;
		    }
		    $('.quantitycls').text(' x ' + productquantity);
		    $('.addonquantitycls').text(' x ' + productquantity);
		    $(".addonquantity").val(productquantity);
	        
	    });
		var copyTextareaBtn = document.querySelector('#copy_to_clipboard');
		copyTextareaBtn.addEventListener('click', function(event) {
			  var copyTextarea = document.querySelector('#orderLink');
			  copyTextarea.focus();
			  copyTextarea.select();
			  try {
			    var successful = document.execCommand('copy');
			    var msg = successful ? $(this).find("i").removeClass('fa-copy').addClass('fa-check') : $(this).find("i").removeClass('fa-check').addClass('fa-copy');
			  } catch (err) {
			    console.log('Oops, unable to copy');
			  }
			});
		$("body").click(function(event) {
		    const target = $(event.target);
		    if (!target.closest('#copy_to_clipboard').length) {
		    	$("#copy_to_clipboard").find("i").removeClass('fa-check').addClass('fa-copy');
		    }
		});
		function changeAddonQuantity(elm, action){
			if(action === 'showlink'){
				$(elm).hide();
				$(elm).next().show();
			}else{
				$(elm).parent().parent().find('.changeQuantityForAddons').show()
				$(elm).parent().hide();
			}
		}
		function saveAddonQuantity(elm){
			let value = parseInt(elm.value);
		    if (isNaN(value) || value < 1 || value > 5) {
		        elm.value = 1;
		    }
			$(elm).parent().parent().find(".addonquantitycls").text("x "+elm.value);
		}
>>>>>>> .r5080
	</script>

</body>
</html>
