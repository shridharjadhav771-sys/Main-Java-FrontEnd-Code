<!DOCTYPE html>
<html>
<head>
    <title>Add Fee Type</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="nav.jsp" %>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-lg">
                <div class="card-header bg-primary text-white text-center">
                    <h4>Add New Fee Type</h4>
                </div>
                <div class="card-body">
                    <form action="feeTypes" method="post">
                        <div class="mb-3">
                            <label for="fee_name" class="form-label">Fee Name</label>
                            <input type="text" class="form-control" id="fee_name" name="fee_name" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-success">Add Fee Type</button>
                            <a href="feeTypes" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
