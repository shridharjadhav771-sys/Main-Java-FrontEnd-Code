<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Clear session cart
    session.removeAttribute("cart");

    // Redirect to confirmation or home page
    response.sendRedirect("orderConfirmation.jsp"); 
%>