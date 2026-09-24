<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Inventory Management System</title>

<!-- Latest Bootstrap & Material Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons+Round"
	rel="stylesheet">
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps">

		<!-- Navbar -->
		<nav
			class="navbar navbar-main navbar-expand-lg position-sticky px-0 shadow-none border-radius-xl z-index-sticky"
			id="navbarBlur" data-scroll="true">
			<div class="container-fluid py-1 px-3">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="workspace.jsp"
							class="material-icons">home</a></li>
						<li class="breadcrumb-item active">Materials</li>
					</ol>
				</nav>
			</div>
		</nav>
		<!-- End Navbar -->

		<div class="container-fluid">
			<div class="card mt-2">
				<div class="card-header p-2">
					<span class="h5"><b>Masters & Reports</b></span>
				</div>
				<div class="card-body">
					<div class="content p-3">
						<div class="row">
							<div class="col-md-3">
								<span class="section-heading"><i
									class="material-icons-round">apps</i> Items Catalogue</span>
								<ul class="list-item mt-2">
									<li><a href="items.jsp">Items <i
											class="material-icons-round">north_east</i></a></li>
									<li><a href="item_group.jsp">Item Group <i
											class="material-icons-round">north_east</i></a></li>
									<li><a href="item_category.jsp">Item Category <i
											class="material-icons-round">north_east</i></a></li>
									<li><a href="brand.jsp">Brand <i
											class="material-icons-round">north_east</i></a></li>
								</ul>
							</div>
							<div class="col-md-3">
								<span class="section-heading"><i
									class="material-icons-round">settings</i> Settings</span>
								<ul class="list-item mt-2">
									<li><a href="uom.jsp">UOM <i
											class="material-icons-round">north_east</i></a></li>
									<li><a href="warehouse.jsp">Warehouse <i
											class="material-icons-round">north_east</i></a></li>
								</ul>
							</div>
							<div class="col-md-3">
								<span class="section-heading"><i
									class="material-icons-round">description</i> Stock Transactions</span>
								<ul class="list-item mt-2">
									<li><a href="stock_material_request.jsp">Material
											Request <i class="material-icons-round">north_east</i>
									</a></li>
									<li><a href="stock_entry.jsp">Stock Entry <i
											class="material-icons-round">north_east</i></a></li>
									<li><a href="purchase_order.jsp">Purchase Order <i
											class="material-icons-round">north_east</i></a></li>
								</ul>
							</div>
							<div class="col-md-3">
								<span class="section-heading"><i
									class="material-icons-round">summarize</i> Supplier</span>
								<ul class="list-item mt-2">
									<li><a href="supplier.jsp">Supplier <i
											class="material-icons-round">north_east</i></a></li>
								</ul>
							</div>
						</div>

						<!-- Search and Add Button -->
						<div class="mt-4 d-flex justify-content-between">
							<input type="text" id="searchBox" class="form-control w-50"
								placeholder="Search Item..." onkeyup="searchItem()">
							<button class="btn btn-primary" data-bs-toggle="modal"
								data-bs-target="#addItemModal">Add Item</button>
						</div>

						<!-- Inventory Table -->
						<div class="table-responsive mt-3">
							<table class="table table-bordered" id="inventoryTable">
								<thead class="table-dark">
									<tr>
										<th>Actions</th>
										<th>Group</th>
										<th>Category</th>
										<th>Item Name</th>
										<th>Code</th>
										<th>Brand</th>
										<th>Price</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
									<%
									try {
										Class.forName("com.mysql.cj.jdbc.Driver");
										Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_db", "root", "password");
										Statement stmt = con.createStatement();
										ResultSet rs = stmt.executeQuery("SELECT * FROM items");

										while (rs.next()) {
									%>
									<tr>
										<td>
											<button class="btn btn-info btn-sm">View</button>
											<button class="btn btn-warning btn-sm">Edit</button>
											<button class="btn btn-danger btn-sm">Delete</button>
										</td>
										<td><%=rs.getString("item_group")%></td>
										<td><%=rs.getString("category")%></td>
										<td><%=rs.getString("item_name")%></td>
										<td><%=rs.getString("code")%></td>
										<td><%=rs.getString("brand")%></td>
										<td><%=rs.getDouble("price")%></td>
										<td><span class="badge bg-success"><%=rs.getString("status")%></span></td>
									</tr>
									<%
									}
									con.close();
									} catch (Exception e) {
									e.printStackTrace();
									}
									%>
								</tbody>
							</table>
						</div>

						<!-- Add Item Modal -->
						<div class="modal fade" id="addItemModal">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title">Add Item</h4>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal"></button>
									</div>
									<div class="modal-body">
										<form action="addItem.jsp" method="post">
											<input type="text" name="item_name" class="form-control mb-2"
												placeholder="Item Name" required> <input type="text"
												name="category" class="form-control mb-2"
												placeholder="Category"> <input type="text"
												name="code" class="form-control mb-2" placeholder="Code">
											<input type="text" name="brand" class="form-control mb-2"
												placeholder="Brand"> <input type="number"
												name="price" class="form-control mb-2" placeholder="Price">
											<button type="submit" class="btn btn-success">Add</button>
										</form>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</main>

</body>
</html>
