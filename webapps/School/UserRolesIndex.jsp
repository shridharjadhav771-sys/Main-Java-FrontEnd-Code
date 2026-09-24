<!DOCTYPE html>
<html>
<head>
    <title>Add User Role</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="nav.jsp" %>
<div class="container mt-5">
    <div class="card shadow-lg p-4">
        <h2 class="text-center mb-4">Add New User Role</h2>
        <form action="userRoles" method="post">
            <div class="mb-3">
                <label for="role_name" class="form-label">Role Name</label>
                <input type="text" class="form-control" id="role_name" name="role_name" required>
            </div>
            <button type="submit" class="btn btn-success">Add</button>
            <a href="userRoles" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</div>
</body>
</html>
