<%@ page import="java.util.List" %>
<%@ page import="School.Mst.Mst_designation.DesignationDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deleted Designations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Deleted Designations</h2>

    <div class="text-end mb-3">
        <a href="designation" class="btn btn-primary">Back to Active</a>
    </div>

    <table class="table table-bordered table-hover text-center">
        <thead class="table-danger">
        <tr>
            <th>ID</th>
            <th>Designation Name</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<DesignationDTO> deletedList = (List<DesignationDTO>) request.getAttribute("deletedDesignations");
            if (deletedList != null && !deletedList.isEmpty()) {
                for (DesignationDTO d : deletedList) {
        %>
        <tr>
            <td><%= d.getDesignation_id() %></td>
            <td><%= d.getDesignation_name() %></td>
            <td>
                <a href="restoreDesignation?designation_id=<%= d.getDesignation_id() %>" class="btn btn-success btn-sm"
                   onclick="return confirm('Restore this designation?')">Restore</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3" class="text-center">No deleted designations found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
