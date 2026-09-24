<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Designation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="nav.jsp" %>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center">
                    <h4>Add New Designation</h4>
                </div>
                <div class="card-body">
                    <form action="designation" method="post">
                        <div class="form-group mb-3">
                            <label for="designationName">Designation Name</label>
                            <input type="text" class="form-control" id="designationName" name="designation_name" placeholder="Enter designation name" required>
                        </div>

                        <!-- Optional isDeleted field (hidden, default 0) -->
                        <input type="hidden" name="isDeleted" value="0">

                        <button type="submit" class="btn btn-success w-100">Add Designation</button>
                    </form>
                </div>
            </div>

            <div class="mt-3 text-end">
                <a href="designation" class="btn btn-secondary">View All Designations</a>
            </div>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
