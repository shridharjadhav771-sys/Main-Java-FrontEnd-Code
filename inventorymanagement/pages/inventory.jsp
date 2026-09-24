<!DOCTYPE html>
<html lang="en">
<%@ include file="session-expire-check.jsp" %>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Inventory Management System | Dashboard</title>

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

  <style>
    body {
      background: #f9fafb;
      color: #1f2937;
      font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
      min-height: 100vh;
    }

    .main-content {
      padding: 2.5rem 1.5rem 4rem;
      max-width: 1400px;
      margin: 0 auto;
    }

    .dashboard-header {
      margin-bottom: 2.5rem;
      padding-bottom: 1.25rem;
      border-bottom: 1px solid #e5e7eb;
    }

    .dashboard-title {
      font-size: 1.85rem;
      font-weight: 700;
      color: #111827;
      margin-bottom: 0.35rem;
    }

    .dashboard-subtitle {
      color: #6b7280;
      font-size: 1rem;
    }

    .card-module {
      background: white;
      border: 1px solid #e5e7eb;
      border-radius: 12px;
      padding: 1.75rem;
      box-shadow: 0 1px 3px rgba(0,0,0,0.06);
      transition: all 0.25s ease;
      height: 100%;
    }

    .card-module:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(0,0,0,0.08);
      border-color: #cbd5e1;
    }

    .module-header {
      display: flex;
      align-items: center;
      gap: 0.85rem;
      margin-bottom: 1.25rem;
      font-size: 1.28rem;
      font-weight: 600;
      color: #111827;
    }

    .module-icon {
      width: 48px;
      height: 48px;
      background: #eff6ff;
      color: #3b82f6;
      border-radius: 10px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.6rem;
    }

    .module-list a {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 0.9rem 1.15rem;
      color: #374151;
      text-decoration: none;
      border-radius: 8px;
      font-size: 0.98rem;
      transition: all 0.18s ease;
      margin-bottom: 0.4rem;
    }

    .module-list a:hover {
      background: #f0f9ff;
      color: #2563eb;
      padding-left: 1.4rem;
    }

    .module-list .bi-arrow-up-right {
      font-size: 0.9rem;
      opacity: 0.65;
      transition: transform 0.2s;
    }

    .module-list a:hover .bi-arrow-up-right {
      transform: translate(3px, -3px);
      opacity: 1;
    }

    @media (max-width: 992px) {
      .main-content {
        padding: 2rem 1rem;
      }
      .dashboard-title {
        font-size: 1.65rem;
      }
    }
  </style>
</head>

<body>

  <jsp:include page="left-nav.jsp"></jsp:include>

  <main class="main-content">
    <div class="container-fluid">
      <div class="dashboard-header">
        <h1 class="dashboard-title">Inventory Dashboard</h1>
        <p class="dashboard-subtitle">Central hub for managing items, stock movements, suppliers, warehouses and settings</p>
      </div>

      <div class="row g-4">
        <!-- Items Catalogue -->
        <div class="col-xl-3 col-lg-4 col-md-6">
          <div class="card-module">
            <div class="module-header">
              <div class="module-icon"><i class="bi bi-box-seam-fill"></i></div>
              Items Catalogue
            </div>
            <div class="module-list">
              <a href="items.jsp">Items <i class="bi bi-arrow-up-right"></i></a>
              <a href="item-group.jsp">Item Group <i class="bi bi-arrow-up-right"></i></a>
              <a href="item_category.jsp">Item Category <i class="bi bi-arrow-up-right"></i></a>
              <a href="brand.jsp">Brand <i class="bi bi-arrow-up-right"></i></a>
            </div>
          </div>
        </div>

        <!-- Settings -->
        <div class="col-xl-3 col-lg-4 col-md-6">
          <div class="card-module">
            <div class="module-header">
              <div class="module-icon"><i class="bi bi-gear-fill"></i></div>
              Settings
            </div>
            <div class="module-list">
              <a href="uom.jsp">UOM <i class="bi bi-arrow-up-right"></i></a>
              <a href="warehouse.jsp">Warehouse <i class="bi bi-arrow-up-right"></i></a>
              <a href="customer.jsp">Customer <i class="bi bi-arrow-up-right"></i></a>
            </div>
          </div>
        </div>

        <!-- Stock Transactions -->
        <div class="col-xl-3 col-lg-4 col-md-6">
          <div class="card-module">
            <div class="module-header">
              <div class="module-icon"><i class="bi bi-arrow-left-right"></i></div>
              Stock Transactions
            </div>
            <div class="module-list">
              <a href="stock_material_request.jsp">Material Request <i class="bi bi-arrow-up-right"></i></a>
              <a href="stock_entry.jsp">Stock Entry <i class="bi bi-arrow-up-right"></i></a>
              <a href="purchase_order.jsp">Purchase Order <i class="bi bi-arrow-up-right"></i></a>
              <a href="material_issue.jsp">Material Issue <i class="bi bi-arrow-up-right"></i></a>
            </div>
          </div>
        </div>

        <!-- Supplier -->
        <div class="col-xl-3 col-lg-4 col-md-6">
          <div class="card-module">
            <div class="module-header">
              <div class="module-icon"><i class="bi bi-truck-flatbed"></i></div>
              Supplier & Vendor
            </div>
            <div class="module-list">
              <a href="supplier.jsp">Supplier <i class="bi bi-arrow-up-right"></i></a>
            </div>
          </div>
        </div>
      </div>

      <!-- Optional: Quick Stats Row (you can remove or keep) -->
      <!--
      <div class="row mt-5 g-4">
        <div class="col-md-3">
          <div class="card border-0 shadow-sm text-center p-4">
            <h6 class="text-muted mb-2">Total Items</h6>
            <h3 class="fw-bold text-primary">4,872</h3>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card border-0 shadow-sm text-center p-4">
            <h6 class="text-muted mb-2">Low Stock</h6>
            <h3 class="fw-bold text-warning">42</h3>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card border-0 shadow-sm text-center p-4">
            <h6 class="text-muted mb-2">Pending Orders</h6>
            <h3 class="fw-bold text-info">18</h3>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card border-0 shadow-sm text-center p-4">
            <h6 class="text-muted mb-2">Active Suppliers</h6>
            <h3 class="fw-bold text-success">134</h3>
          </div>
        </div>
      </div>
      -->

    </div>
  </main>

  <!-- Scripts -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Keep your Material Dashboard script if you still need some of its features -->
  <script src="../assets/js/material-dashboard.min.js?v=3.2.0"></script>

</body>
</html>