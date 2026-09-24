<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*"%>
<html>
<head>
    <title>Login Form</title>
</head>
<body>
    <h2>Login Form</h2>
    <form action="LoginServlets" method="post">
        Email: <input type="email" name="email" required /><br><br>
        Password: <input type="password" name="password" required /><br><br>
        Remember me: <input type="checkbox" name="remember" /><br><br>
        <input type="submit" value="Login" />
    </form>
</body>
</html>
