<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="login.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
    .form-check {
    padding: 20px;
}
        a.nav-link {
            color: white;
            font-weight: bold;
        }

        .nav-item {
            padding-left: 10px;
        }

        body {
            background-color: #f7f7f7;
        }

        .bg-secondary {
            background-color: #6c757d;
        }

        .bg-info {
            background-color: #17a2b8;
        }

        h1 {
            font-size: 2rem;
            margin-top: 30px;
            text-align: center;
            font-weight: bold;
            color: #ffffff;
        }

        .container {
            max-width: 600px;
            margin: auto;
            padding: 50px;
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 5px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .fixed-bottom {
            text-align: center;
            background-color: #17a2b8;
            color: white;
            padding: 10px 0;
        }

        .modal-content {
            padding: 20px;
        }

        .modal-header {
            border-bottom: 1px solid #dee2e6;
        }

        .modal-body {
            padding: 20px;
        }

        .modal-footer {
            border-top: 1px solid #dee2e6;
            text-align: right;
        }

        
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body class="bg-secondary">

    <nav class="navbar navbar-expand-lg bg-info">
        <ul class="navbar-nav">
            <li><a class="navbar-brands" href="dashboard.jsp"><img src="kbcnum.jpg" alt="logo" style="width: 60px" class="rounded-pill"></a></li>
            <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
            <li class="nav-item"><a class="nav-link" href="index.jsp">Registration</a></li>
            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">More</a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item Active" href="ViewStudent">View</a></li>
                    <li><a class="dropdown-item" href="#">Log out</a></li>
                </ul>
            </li>
        </ul>
    </nav>

    <h1>Login Form</h1>

    <form>
        <div class="container">
            <label for="email">Email:</label>
            <input type="text" id="email" name="UserName" placeholder="Enter email" required>

            <label for="password">Password:</label>
            <input type="text" id="Password" name="Password" placeholder="Enter Password" required>

            <div class="form-check">
                <input type="checkbox" id="checkbox" name="checkbox" class="form-check-input">
                <label for="checkbox" class="form-check-label">Remember me</label>
            </div>
            <br>

            <button type="button" data-bs-toggle="modal" data-bs-target="#loginModal">Submit</button>
        </div>
    </form>

    <!-- Modal -->
    <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginModalLabel">Login Status</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Your login attempt was successful!</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Go to Dashboard</button>
                </div>
            </div>
        </div>
    </div>

    <div class="fixed-bottom">
        <p>© Sinhgad Institutes's Sinhgad College of Engineering, S. No. 44/1, Vadgaon (Budruk), Off. Sinhgad Road, Pune 411 041. Maharashtra, INDIA.</p>
    </div>

</body>
</html>
