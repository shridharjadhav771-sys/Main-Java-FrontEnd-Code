package com.company;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SaveCompanyInfo")
public class CompanyServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String studentFirstName = req.getParameter("studentFirstName"); // Corrected from "fname"
	        String studentLastName = req.getParameter("studentLastName");   // Corrected from "lname"
	        String studentEmailId = req.getParameter("studentEmailId");
	        String studentAddress = req.getParameter("studentAddress");
	        
	        try {
	            CompanyDTO companyDTO = new CompanyDTO();
	            companyDTO.setStudentFirstName(studentFirstName);
	            companyDTO.setStudentLastName(studentLastName);
	            companyDTO.setStudentEmailId(studentEmailId);
	            companyDTO.setStudentAddress(studentAddress);

	            int status = CompanyDAO.RegistrationForm(companyDTO);
	            if (status > 0) {
	                System.out.println("Registration Successfully");
	                resp.sendRedirect("display");
	            } else {
	                System.out.println("Registration not successful");
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}
