<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>
<%@ page import="java.util.*, javax.servlet.*, javax.servlet.http.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP Example</title>
</head>
<body>
	<h2>JSP Object Demonstration</h2>

	<!-- Request Object -->
	<p>
		<strong>Request Object:</strong>
		<%=request.getParameter("param") != null ? request.getParameter("param") : "No Parameter Passed"%></p>

	<!-- Response Object -->
	<p>
		<strong>Response Object:</strong> This page is generated using JSP,
		demonstrating the response to the client.
	</p>

	<!-- PageContext Object -->
	<p>
		<strong>PageContext Object:</strong> The pageContext has an attribute
		"pageExample" with value:
		<%=pageContext.getAttribute("pageExample", PageContext.PAGE_SCOPE) != null
		? pageContext.getAttribute("pageExample", PageContext.PAGE_SCOPE)
		: "Not Set"%></p>

	<!-- Session Object -->
	<%
	HttpSession httpSession = request.getSession();
	session.setAttribute("user", "John Doe");
	%>
	<p>
		<strong>Session Object:</strong> The current user's session value for
		"user" is:
		<%=session.getAttribute("user")%></p>

	<!-- Application Object -->
	<%
	ServletContext application = getServletContext();
	application.setAttribute("appInfo", "This is a simple JSP demo application.");
	%>
	<p>
		<strong>Application Object:</strong> The application attribute
		"appInfo" is:
		<%=application.getAttribute("appInfo")%></p>

	<!-- Config Object -->
	<p>
		<strong>Config Object:</strong> The servlet context name (from
		web.xml) is:
		<%=config.getServletContext().getServletContextName()%></p>

	<!-- Out Object -->
	<p>
		<strong>Out Object:</strong>
		<%=out.write("This is an example of using the 'out' object to print directly.")%></p>

	<!-- Page Object -->
	<p>
		<strong>Page Object:</strong> The current page is:
		<%=page.toString()%></p>

	<!-- Exception Handling -->
	<%
	try {
		// Simulate an exception
		int result = 10 / 0; // This will throw an ArithmeticException
	} catch (Exception e) {
	%>
	<p>
		<strong>Exception Object:</strong> An exception occurred:
		<%=e.getMessage()%></p>
	<%
	}
	%>
</body>
</html>
