<%@ page import="java.util.List" %>
<%@ page import="School.Mst.Mst_departments.DepartmentsDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Deleted Departments</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Deleted Departments</h2>

    <div class="mb-3 text-end">
        <a href="department" class="btn btn-primary">Back to Active Departments</a>
    </div>

    <table class="table table-bordered table-hover text-center">
        <thead class="table-danger">
        <tr>
            <th>Department ID</th>
            <th>Department Name</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<DepartmentsDTO> deptsList = (List<DepartmentsDTO>) request.getAttribute("deptsList");
            if (deptsList != null && !deptsList.isEmpty()) {
                for (DepartmentsDTO d : deptsList) {
        %>
        <tr>
            <td><%= d.getDept_id() %></td>
            <td><%= d.getDept_name() %></td>
            <td>
                <a href="restoreDept?dept_id=<%= d.getDept_id() %>" class="btn btn-success btn-sm"
                   onclick="return confirm('Are you sure you want to restore this department?')">Restore</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3" class="text-center">No deleted departments found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
