<%
String logedInUser = session.getAttribute("logedInUser") == null ? "" : (String) session.getAttribute("logedInUser");
if(logedInUser.equals("")){
	response.sendRedirect("HomePage.jsp");
}
%> 