<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success</title>

<!-- Bootstrap CSS -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    rel="stylesheet">

<!-- Custom CSS -->
<style>
    body {
        background-color: #f4f6f9;
    }

    .success-card {
        max-width: 400px;
        margin: 100px auto;
        background: #ffffff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.15);
        text-align: center;
    }

    .success-icon {
        font-size: 50px;
        color: #28a745;
        margin-bottom: 15px;
    }
</style>
</head>

<body>

<div class="container">
    <div class="success-card">
        <div class="success-icon">✅</div>
        <h3 class="text-success mb-3">Data Inserted Successfully</h3>

        <a href="index.jsp" class="btn btn-primary mt-3">
            Insert Another Record
        </a>
    </div>
</div>

<!-- Bootstrap JS -->
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>

</body>
</html>
