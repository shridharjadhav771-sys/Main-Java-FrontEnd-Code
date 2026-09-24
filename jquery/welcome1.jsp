<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Page</title>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <%
            String name = request.getParameter("uname");
            if (name != null && !name.isEmpty()) {
                session.setAttribute("user", name);
                out.print("<h2>Welcome " + name + "!</h2>");
            } else {
                out.print("<h2>No username provided!</h2>");
            }
        %>
        <a href="second1.jsp" class="button">Go to Second Page</a>
        <a href="logout.jsp" class="button">Logout</a>
    </div>
</body>
</html>
