<%@ page import="School.Mst.Mst_departments.DepartmentsDTO" %>
<%
    DepartmentsDTO dept = (DepartmentsDTO) request.getAttribute("dept");
    if (dept == null) {
        out.println("<h3 class='text-center text-danger'>No department found.</h3>");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Department</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow">
                <div class="card-header bg-warning text-white text-center">
                    <h4>Edit Department</h4>
                </div>
                <div class="card-body">
                    <form action="updateDept" method="post">
                        <!-- Hidden ID Field -->
                        <input type="hidden" name="dept_id" value="<%= dept.getDept_id() %>">

                        <div class="form-group mb-3">
                            <label for="deptName">Department Name</label>
                            <input type="text" class="form-control" id="deptName" name="dept_name" value="<%= dept.getDept_name() %>" required>
                        </div>

                        <!-- Hidden is_deleted field to preserve state -->
                        <input type="hidden" name="is_deleted" value="<%= dept.getIs_deleted() %>">

                        <button type="submit" class="btn btn-success w-100">Update Department</button>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
