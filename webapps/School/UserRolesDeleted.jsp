<%@ page import="java.util.List" %>
<%@ page import="School.Mst.Mst_user_role.UserRolesDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Deleted User Roles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Deleted User Roles</h2>

    <div class="mb-3 text-end">
        <a href="userRoles" class="btn btn-primary">Back to Roles</a>
    </div>

    <table class="table table-bordered table-hover text-center">
        <thead class="table-danger">
            <tr>
                <th>Role ID</th>
                <th>Role Name</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<UserRolesDTO> deleted = (List<UserRolesDTO>) request.getAttribute("deletedRoles");
            if (deleted != null && !deleted.isEmpty()) {
                for (UserRolesDTO r : deleted) {
        %>
            <tr>
                <td><%= r.getRole_id() %></td>
                <td><%= r.getRole_name() %></td>
                <td>
                    <a href="restoreUserRole?role_id=<%= r.getRole_id() %>" class="btn btn-success btn-sm"
                       onclick="return confirm('Restore this role?')">Restore</a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr><td colspan="3">No deleted roles found.</td></tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
