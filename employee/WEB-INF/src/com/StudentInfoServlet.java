package com;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sutdent")
public class StudentInfoServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 System.out.println("Inside do get");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 System.out.println("Inside do post");
		 
		 String firstname = req.getParameter("firstname");
		 String lastname = req.getParameter("lastname");
		 String emailId = req.getParameter("EmailId");
		 String phoneNumber = req.getParameter("PhoneNumber");
		 String birthday = req.getParameter("birthday");
		 
		 System.out.println("firstname: " + firstname);
		 System.out.println("lastname: " + lastname);
		 System.out.println("emailId: " + emailId);
		 System.out.println("phoneNumber: " + phoneNumber);
		 System.out.println("birthday: " + birthday);
		 
		 
		 
	}

}
