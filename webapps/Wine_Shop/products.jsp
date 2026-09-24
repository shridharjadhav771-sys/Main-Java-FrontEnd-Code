<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.ProductDAO,dto.ProductDTO" %>
<%
    ProductDAO dao = new ProductDAO((java.sql.Connection)application.getAttribute("DBConnection"));
    List<ProductDTO> products = dao.getAllProducts();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Products</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            /* Premium Dusky Whiskey Gradient */
            background: linear-gradient(135deg, #2c1810, #5c3d2e, #b08d57);
            min-height: 100vh;
            color: #fff;
            font-family: 'Segoe UI', sans-serif;
        }
        h2, h3 {
            color: #fdd835;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.5);
        }

        /* PREMIUM GLOWING PRODUCT CARD */
        .card {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 215, 128, 0.3);
            border-radius: 20px;
            color: #fff;
            backdrop-filter: blur(12px);
            transition: all 0.4s ease;
            box-shadow: 0 6px 18px rgba(0,0,0,0.6);
            position: relative;
            overflow: hidden;
        }
        .card::before {
            content: "";
            position: absolute;
            top: -2px; left: -2px; right: -2px; bottom: -2px;
            border-radius: 20px;
            background: linear-gradient(45deg, #ffd54f, #ff8f00, #ffcc80, #b08d57);
            z-index: -1;
            filter: blur(12px);
            opacity: 0;
            transition: opacity 0.4s ease;
        }
        .card:hover::before { opacity: 1; }
        .card:hover {
            transform: translateY(-12px) scale(1.03);
            box-shadow: 0 12px 35px rgba(255, 174, 66, 0.6);
            border-color: #ffd54f;
        }

        /* Card Image Styling */
        .card img {
            object-fit: cover;
            height: 220px;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            border-bottom: 1px solid rgba(255,215,128,0.3);
        }

        /* Title & Price Highlight */
        .card-body h5 {
            font-weight: 700;
            color: #ffd54f;
            text-shadow: 0 0 8px rgba(255, 193, 7, 0.8);
        }
        .price-tag {
            font-size: 1.2rem;
            font-weight: bold;
            color: #ffcc80;
            text-shadow: 0 0 5px rgba(255, 193, 7, 0.7);
        }

        /* BUTTONS */
        .btn-primary {
            background: linear-gradient(45deg, #a1887f, #6d4c41);
            border: none;
            border-radius: 12px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background: linear-gradient(45deg, #d7a46c, #5c3d2e);
            transform: scale(1.05);
        }
        .btn-success {
            background: linear-gradient(45deg, #ffd54f, #ffb300);
            border: none;
            border-radius: 12px;
            color: #2c1810;
            font-weight: 700;
            transition: all 0.3s ease;
        }
        .btn-success:hover {
            background: linear-gradient(45deg, #ffca28, #ff8f00);
            color: #fff;
            transform: scale(1.05);
        }

        /* Add Product Card */
        #addProductCollapse .card {
            border-radius: 16px;
            padding: 20px;
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,215,128,0.2);
            backdrop-filter: blur(8px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.5);
        }
        #addProductCollapse .form-control {
            border-radius: 10px;
            background: rgba(255,255,255,0.1);
            color: #fff;
        }
        #addProductCollapse .form-control::placeholder {
            color: #ffd54f;
        }
    </style>
</head>
<body>
<div class="container py-4">
    <h2 class="text-center mb-4"> Product Management</h2>

    <!-- Collapsible Add Product -->
    <div class="text-center mb-4">
        <button class="btn btn-primary px-4 py-2 shadow" type="button" data-bs-toggle="collapse" data-bs-target="#addProductCollapse" aria-expanded="false" aria-controls="addProductCollapse">
            ➕ Add New Product
        </button>
    </div>

    <div class="collapse" id="addProductCollapse">
        <div class="card card-body shadow-sm mb-5">
            <form id="addProductFormData" enctype="multipart/form-data">
                <div class="mb-3">
                    <label class="form-label">Product Name</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Price (₹)</label>
                    <input type="number" name="price" class="form-control" step="0.01" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Description</label>
                    <textarea name="description" class="form-control" rows="3"></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Product Image</label>
                    <input type="file" name="image" class="form-control" accept="image/*">
                </div>
                <input type="hidden" name="action" value="add">
                <button type="submit" class="btn btn-success w-100">Save Product</button>
            </form>
        </div>
    </div>

    <!-- Product List -->
    <h3 class="mb-3"> Available Products</h3>
    <div class="row">
        <% if(products != null && !products.isEmpty()){ 
            for(ProductDTO p : products){ %>
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <% if(p.getImageUrl() != null && !p.getImageUrl().isEmpty()){ %>
                            <img src="<%=request.getContextPath()%>/<%= p.getImageUrl() %>" class="card-img-top" alt="<%= p.getName() %>">
                        <% } else { %>
                            <img src="https://source.unsplash.com/400x300/?whiskey,bottle" class="card-img-top" alt="Default Image">
                        <% } %>
                        <div class="card-body">
                            <h5 class="card-title"><%= p.getName() %></h5>
                            <p class="price-tag">₹<%= p.getPrice() %></p>
                            <p class="card-text"><%= p.getDescription() %></p>
                        </div>
                    </div>
                </div>
        <%  } 
        } else { %>
            <p class="text-light">No products available.</p>
        <% } %>
    </div>
</div>

<!-- JS -->
<script>
$(document).ready(function(){
    $('#addProductFormData').submit(function(e){
        e.preventDefault();
        let formData = new FormData(this);
        $.ajax({
            url: '<%=request.getContextPath()%>/products',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function(response){
                if(response.trim()==="success"){
                    alert("✅ Product Added");
                    location.reload();
                } else {
                    alert("❌ Failed to add product");
                }
            }
        });
    });
});
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
