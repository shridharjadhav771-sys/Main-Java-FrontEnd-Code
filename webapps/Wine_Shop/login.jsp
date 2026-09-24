<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            background: linear-gradient(135deg, #fffaf0 0%, #f0e0c0 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .login-card {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        .btn-custom {
            background-color: #ff69b4;
            color: white;
            border: none;
            transition: background-color 0.3s;
        }
        .btn-custom:hover {
            background-color: #e6008c;
            color: white;
        }
        .error-message {
            color: #dc3545;
            margin-bottom: 15px;
        }
        .success-message {
            color: #28a745;
            margin-bottom: 15px;
        }
        .form-control {
            border-radius: 8px;
        }
        .form-check-label {
            margin-left: 5px;
        }
    </style>
</head>
<body>
    <div class="login-card">
        <h1 style="font-size: 36px; color: #333; margin-bottom: 20px;">Login</h1>
        <% if ("invalid".equals(request.getParameter("error"))) { %>
            <p class="error-message">Invalid username or password.</p>
        <% } %>
        <% if ("registered".equals(request.getParameter("message"))) { %>
            <p class="success-message">Registration successful. Please login.</p>
        <% } %>
        <%
            String username = "";
            String password = "";
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("username".equals(cookie.getName())) {
                        username = cookie.getValue();
                    } else if ("password".equals(cookie.getName())) {
                        password = cookie.getValue();
                    }
                }
            }
        %>
        <form action="user" method="post" class="needs-validation" novalidate>
            <input type="hidden" name="action" value="login">
            <div class="mb-3">
                <input type="text" name="username" value="<%= username %>" placeholder="Username" class="form-control" required>
            </div>
            <div class="mb-3">
                <input type="password" name="password" value="<%= password %>" placeholder="Password" class="form-control" required>
            </div>
            <div class="mb-4 form-check d-flex align-items-center justify-content-center">
                <input type="checkbox" name="rememberMe" <%= "on".equals(request.getParameter("rememberMe")) ? "checked" : "" %> class="form-check-input">
                <label class="form-check-label">Remember Me</label>
            </div>
            <button type="submit" class="btn btn-custom w-100 py-2">Login</button>
        </form>
        <p class="mt-3"><a href="register.jsp" style="color: #ff69b4; text-decoration: none;">Register</a></p>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
   <script>
        // Bootstrap validation
       $(document).ready(function() {
    $('#loginForm').submit(function(e) {
        e.preventDefault(); // prevent normal form submission

        $.ajax({
            url: 'user', // your servlet URL
            type: 'POST',
            data: $(this).serialize() + '&action=login', // send form data + action
            success: function(response) {
                // If login successful, redirect to home
                window.location.href = 'home.jsp';
            },
            error: function() {
                $('#loginMessage').html('<p style="color:red;">Invalid username or password!</p>');
            }
        });
    });
});
    </script>
</body>
</html>