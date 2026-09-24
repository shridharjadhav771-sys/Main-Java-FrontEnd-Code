<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.UserDTO" %>
<%@ page import="dao.UserDAO" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MAJAD Wine Shop - Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        /* Whiskey-inspired background */
        body {
            background: linear-gradient(135deg, #3e2723, #6d4c41, #d7a46c);
            font-family: Arial, sans-serif;
            min-height: 100vh;
            color: #fff;
        }
        .navbar {
            background-color: #5d4037 !important; /* dark whiskey tone */
        }
        .navbar .nav-link {
            color: #f5f5f5 !important;
        }
        .navbar .nav-link.active {
            font-weight: bold;
            color: #ffd54f !important; /* golden highlight */
        }
        .profile-section, .users-section {
            background-color: #ffffff;
            color: #333;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.25);
        }
        h2, h3 {
            color: #3e2723;
        }
        .btn-custom {
            background-color: #a1887f;
            color: #fff;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
        }
        .btn-custom:hover {
            background-color: #6d4c41;
        }
        .btn-success {
            background-color: #8d6e63;
            border: none;
        }
        .btn-success:hover {
            background-color: #5d4037;
        }
        .btn-danger {
            background-color: #c62828;
            border: none;
        }
        .btn-danger:hover {
            background-color: #8e0000;
        }
        .error-message {
            color: #dc3545;
            margin-top: 10px;
            display: none;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg px-3">
    <a class="navbar-brand text-white fw-bold" href="home.jsp">MAJAD</a>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link" href="shop.jsp">Shop</a></li>
            <li class="nav-item"><a class="nav-link" href="products.jsp">Products</a></li>
            <li class="nav-item"><a class="nav-link active" href="profile.jsp">Profile</a></li>
            <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
        </ul>
    </div>
</nav>

<div class="container py-4">
<%
    UserDTO user = (UserDTO) session.getAttribute("user");
    if (user == null) { response.sendRedirect("login.jsp"); return; }
    boolean isAdmin = "admin".equals(user.getRole());
%>

<div class="profile-section">
    <h2>Welcome, <%= user.getUsername() %>!</h2>
    <p>Email: <%= user.getEmail() %></p>

    <!-- Add Product (admin only) -->
    <% if (isAdmin) { %>
    <button class="btn btn-custom" id="toggleAddProduct">Add Product</button>
    <div class="add-product-form mt-3" id="addProductForm" style="display:none;">
        <form id="addProductFormData" enctype="multipart/form-data">
            <input type="text" class="form-control mb-2" name="name" placeholder="Product Name" required>
            <input type="text" class="form-control mb-2" name="category" placeholder="Category" required>
            <input type="text" class="form-control mb-2" name="origin" placeholder="Origin" required>
            <textarea class="form-control mb-2" name="description" placeholder="Description" required></textarea>
            <input type="number" class="form-control mb-2" name="price" placeholder="Price" step="0.01" required>
            <input type="file" class="form-control mb-2" name="image" accept="image/*">
            <input type="number" class="form-control mb-2" name="stock" placeholder="Stock" required>
            <input type="hidden" name="action" value="add">
            <button type="submit" class="btn btn-custom w-100">Submit</button>
        </form>
        <div class="error-message" id="errorMessage"></div>
    </div>
    <% } %>

    <!-- Link to full Products page -->
    <a href="products.jsp" class="btn btn-success mt-3">View All Products</a>
</div>

<!-- User List Section (admin only) -->
<% if (isAdmin) { %>
<div class="users-section">
    <h3>All Users</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th><th>Username</th><th>Email</th><th>Role</th><th>Actions</th>
            </tr>
        </thead>
        <tbody id="userTableBody">
        <%
            UserDAO userDAO = new UserDAO();
            List<UserDTO> users = userDAO.getAllUsers();
            for (UserDTO u : users) {
        %>
            <tr id="userRow<%=u.getId()%>">
                <td><%=u.getId()%></td>
                <td><input type="text" class="form-control username" value="<%=u.getUsername()%>"></td>
                <td><input type="email" class="form-control email" value="<%=u.getEmail()%>"></td>
                <td>
                    <select class="form-control role">
                        <option value="user" <%= "user".equals(u.getRole())?"selected":"" %>>User</option>
                        <option value="admin" <%= "admin".equals(u.getRole())?"selected":"" %>>Admin</option>
                    </select>
                </td>
                <td>
                    <button class="btn btn-sm btn-custom updateUserBtn" data-id="<%=u.getId()%>">Update</button>
                    <button class="btn btn-sm btn-danger deleteUserBtn" data-id="<%=u.getId()%>">Delete</button>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>
<% } %>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
$(document).ready(function() {
    // Toggle Add Product form
    $('#toggleAddProduct').click(function(){
        $('#addProductForm').toggle();
    });

    // Add Product AJAX with file upload
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
                    alert('✅ Product added!');
                    $('#addProductForm').hide(); 
                    $('#addProductFormData')[0].reset(); 
                } else {
                    alert('⚠️ Failed to add product.');
                }
            },
            error: function(){ 
                alert('❌ Error adding product.'); 
            }
        });
    });

    // Update User AJAX
    $('.updateUserBtn').click(function(){
        let row = $(this).closest('tr');
        let id = $(this).data('id');
        let username = row.find('.username').val();
        let email = row.find('.email').val();
        let role = row.find('.role').val();

        $.ajax({
            url: '<%=request.getContextPath()%>/user',
            method: 'POST',
            data: {
                action: 'updateAdmin',
                id: id,
                username: username,
                email: email,
                role: role
            },
            success: function(response){ 
                if(response.trim() === "success"){
                    alert('✅ User updated successfully!');
                } else {
                    alert('⚠️ Failed to update user.');
                }
            },
            error: function(){ 
                alert('❌ Error updating user.'); 
            }
        });
    });

    // Delete User AJAX
    $('.deleteUserBtn').click(function(){
        if(confirm('Are you sure you want to delete this user?')){
            let id = $(this).data('id');
            $.ajax({
                url: '<%=request.getContextPath()%>/user',
                method: 'GET',
                data: {action:'deleteAdmin', id:id},
                success: function(response){ 
                    if(response.trim() === "success"){
                        $('#userRow'+id).remove(); 
                        alert('🗑️ User deleted successfully!'); 
                    } else {
                        alert('⚠️ Failed to delete user.');
                    }
                }
            });
        }
    });
});
</script>

</body>
</html>
