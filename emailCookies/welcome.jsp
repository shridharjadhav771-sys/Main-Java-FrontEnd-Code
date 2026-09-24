<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*"%>
<html>
<head>
<title>Welcome</title>
</head>
<body>
	<h2>Welcome!</h2>
	<p>
		You are logged in as:
		<%=session.getAttribute("emailCookies")%></p>
</body>
</html>
