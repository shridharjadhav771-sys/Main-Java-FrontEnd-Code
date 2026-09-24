<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.Cookie"%>
<html>
<head>
    <title>Login Form</title>
    <!-- Bootstrap 5.0.2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #5a5a5a;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .btn-primary, .btn-danger {
            width: 100%;
        }
        .cookie-info {
            margin-top: 20px;
        }
        .user-details {
            margin-top: 20px;
        }
    </style>
    
</head>
<body>
    <h2 class="text-center">Login Form</h2>
    <div class="container">
        <form action="cookies.jsp" method="post">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>

        <% 
            // Handle the form submission (Create cookies)
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            if (email != null && password != null) {
                // Create cookies
                Cookie emailCookie = new Cookie("email", email);
                Cookie sessionCookie = new Cookie("session_token", java.util.UUID.randomUUID().toString());

                // Set cookie expiry times
                emailCookie.setMaxAge(60 * 60 * 24); // 1 day for email
                sessionCookie.setMaxAge(-1); // Session cookie, lasts until browser is closed

                // Set secure attributes
                emailCookie.setHttpOnly(true);  
                emailCookie.setSecure(true);    

                // Add cookies to response
                response.addCookie(emailCookie);
                response.addCookie(sessionCookie);

                out.println("<div class='alert alert-success mt-4' role='alert'>Login details saved in cookies!</div>");
            }
        %>

        <% 
            // Handle reading cookies (display their names)
            Cookie[] cookies = request.getCookies();
            boolean userLoggedIn = false;
            String userEmail = null;

            if (cookies != null) {
                out.println("<div class='cookie-info'><h4>Stored Cookies:</h4><ul>");
                for (Cookie cookie : cookies) {
                    out.println("<li><strong>" + cookie.getName() + "</strong>: " + cookie.getValue() + "</li>");
                    // Check if email cookie exists
                    if (cookie.getName().equals("email")) {
                        userLoggedIn = true;
                        userEmail = cookie.getValue();
                    }
                }
                out.println("</ul></div>");
            } else {
                out.println("<div class='cookie-info'><h4>No cookies stored.</h4></div>");
            }

            // Display user details if logged in
            if (userLoggedIn) {
                out.println("<div class='user-details alert alert-info mt-4' role='alert'>Logged in as: " + userEmail + "</div>");
            }
        %>

        <!-- Button to delete cookies -->
        <form action="cookies.jsp" method="post">
            <button type="submit" name="deleteCookies" class="btn btn-danger mt-3">Delete Cookies</button>
        </form>

        <% 
            // Handle cookie deletion
            String deleteCookies = request.getParameter("deleteCookies");

            if (deleteCookies != null) {
                Cookie[] cookiesToDelete = request.getCookies();
                if (cookiesToDelete != null) {
                    for (Cookie cookie : cookiesToDelete) {
                        // Set max age to 0 to delete cookies
                        cookie.setMaxAge(0);  
                        response.addCookie(cookie); // Add again to delete the cookies
                    }
                    out.println("<div class='alert alert-warning mt-4' role='alert'>Cookies have been deleted!</div>");
                }
            }
        %>
    </div>
</body>
</html>
