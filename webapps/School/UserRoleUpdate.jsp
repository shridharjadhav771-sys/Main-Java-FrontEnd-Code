<%@ page import="School.Mst.Mst_user_role.UserRolesDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update User Role</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%
    UserRolesDTO role = (UserRolesDTO) request.getAttribute("role");
%>
<div class="container mt-5">
    <div class="card shadow p-4">
        <h2 class="text-center mb-4">Update User Role</h2>
        <form action="updateUserRole" method="post">
            <input type="hidden" name="role_id" value="<%= role.getRole_id() %>">
            <div class="mb-3">
                <label for="role_name" class="form-label">Role Name</label>
                <input type="text" class="form-control" id="role_name" name="role_name" value="<%= role.getRole_name() %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
            <a href="userRoles" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</div>
</body>
</html>
