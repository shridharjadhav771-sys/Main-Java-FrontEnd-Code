<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration</title>

<!-- ✅ Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #74ebd5, #acb6e5);
        min-height: 100vh;
    }
</style>

</head>
<body class="d-flex justify-content-center align-items-center">

<div class="card shadow-lg" style="width: 400px;">
    <div class="card-body p-4">

        <h3 class="text-center mb-4">Student Registration</h3>

        <form action="studentss" method="post">

            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" name="name" class="form-control" placeholder="Enter your name" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Phone Number</label>
                <input type="text" name="phonenumber" class="form-control" placeholder="Enter your phone number" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Address</label>
                <input type="text" name="address" class="form-control" placeholder="Enter your address" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" placeholder="Enter your email id" required>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-primary">
                    Register
                </button>
            </div>

        </form>

    </div>
</div>



</body>
</html>
