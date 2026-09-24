<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Exam Type</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="nav.jsp" %>
<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-primary text-white text-center">
            <h4>Add New Exam Type</h4>
        </div>
        <div class="card-body">
            <form action="examTypes" method="post">
                <div class="form-group mb-3">
                    <label for="exam_name">Exam Name</label>
                    <input type="text" class="form-control" id="exam_name" name="exam_name" required>
                </div>
                <button type="submit" class="btn btn-success w-100">Add</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
