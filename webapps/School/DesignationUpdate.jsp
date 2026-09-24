<%@ page import="School.Mst.Mst_designation.DesignationDTO" %>
<%
    DesignationDTO d = (DesignationDTO) request.getAttribute("designation");
    if (d == null) {
        out.println("<h3 class='text-danger text-center'>No designation found to update.</h3>");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Designation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow">
                <div class="card-header bg-warning text-dark text-center">
                    <h4>Update Designation</h4>
                </div>
                <div class="card-body">
                    <form action="updateDesignation" method="post">
                        <!-- Hidden ID -->
                        <input type="hidden" name="designation_id" value="<%= d.getDesignation_id() %>">

                        <div class="form-group mb-3">
                            <label for="designationName">Designation Name</label>
                            <input type="text" class="form-control" id="designationName" name="designation_name"
                                   value="<%= d.getDesignation_name() %>" required>
                        </div>

                        <!-- Preserve is_deleted field (hidden) -->
                        <input type="hidden" name="is_deleted" value="<%= d.getIs_deleted() %>">

                        <button type="submit" class="btn btn-success w-100">Update</button>
                    </form>
                </div>
            </div>

            <div class="mt-3 text-end">
                <a href="designation" class="btn btn-secondary">Back to List</a>
            </div>

        </div>
    </div>
</div>
</body>
</html>
