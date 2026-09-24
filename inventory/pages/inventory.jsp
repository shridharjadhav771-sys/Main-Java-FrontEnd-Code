
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
</head>


<body class="g-sidenav-show  bg-gray-100">
	<jsp:include page="left-nav.jsp"></jsp:include>

	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">


		<div class="container-fluid py-2">
			<div class="row">
				<div class="ms-3">
					<h3 class="mb-0 h4 font-weight-bolder">Inventory</h3>
				</div>
			</div>
			<div class="card-body">
				<div class="content p-3">
					<div class="row">
						<div class="col-md-3">
							<span class="section-heading"><i
								class="material-icons-round text-sm">apps</i> Items Catalogue</span>
							<ul class="list-item mt-2">
								<li><a href="items.jsp" class="text-sm">Items <i
										class="material-icons-round text-sm">north_east</i></a></li>
								<li><a href="item-group.jsp" class="text-sm">Item Group
										<i class="material-icons-round text-sm">north_east</i>
								</a></li>
								<li><a href="item_category.jsp" class="text-sm">Item
										Category <i class="material-icons-round text-sm">north_east</i>
								</a></li>
								<li><a href="brand.jsp" class="text-sm">Brand <i
										class="material-icons-round text-sm">north_east</i></a></li>
							</ul>
						</div>
						<div class="col-md-3">
							<span class="section-heading"><i
								class="material-icons-round text-sm">settings</i> Settings</span>
							<ul class="list-item mt-2">
								<li><a href="uom.jsp" class="text-sm">UOM <i
										class="material-icons-round text-sm">north_east</i></a></li>
								<li><a href="warehouse.jsp" class="text-sm">Warehouse <i
										class="material-icons-round text-sm">north_east</i></a></li>
							</ul>
						</div>
						<div class="col-md-3">
							<span class="section-heading"><i
								class="material-icons-round text-sm">description</i> Stock
								Transactions</span>
							<ul class="list-item mt-2">
								<li><a href="stock_material_request.jsp" class="text-sm">Material
										Request <i class="material-icons-round text-sm">north_east</i>
								</a></li>
								<li><a href="stock_entry.jsp" class="text-sm">Stock
										Entry <i class="material-icons-round text-sm">north_east</i>
								</a></li>
								<li><a href="purchase_order.jsp" class="text-sm">Purchase
										Order <i class="material-icons-round text-sm">north_east</i>
								</a></li>
							</ul>
						</div>
						<div class="col-md-3">
							<span class="section-heading"><i
								class="material-icons-round text-sm">summarize</i> Supplier</span>
							<ul class="list-item mt-2">
								<li><a href="supplier.jsp" class="text-sm">Supplier <i
										class="material-icons-round text-sm">north_east</i></a></li>
							</ul>
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
</body>

</html>