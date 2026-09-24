<%@page import="com.globecreater.dto.UserDTO"%>
<%
UserDTO userDTO = (UserDTO)session.getAttribute("loggedInUser");
if(userDTO == null){
	System.out.println("Invalid session");
	response.sendRedirect(request.getContextPath()+ "/pages/sign-in.jsp");
	return;
}
%>