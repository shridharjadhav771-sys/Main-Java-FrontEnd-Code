package com.globecreater.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.globecreater.dao.UserDAO;
import com.globecreater.dto.UserDTO;

@WebServlet("/login")
public class UserLoginService extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String userName = req.getParameter("username");
		 String password = req.getParameter("password");
		 UserDAO userDAO = new UserDAO();
		 UserDTO userDTO = userDAO.getLoggedInUser(userName, password);
		 if(userDTO == null) {
			 req.setAttribute("errMsg", "Invalid login details. Please try again.");
			 resp.sendRedirect("pages/sign-in.jsp");
		 }else {
			 req.getSession().setAttribute("loggedInUser", userDTO);
			 resp.sendRedirect("pages/dashboard.jsp");
		 }
		 
	}
}
