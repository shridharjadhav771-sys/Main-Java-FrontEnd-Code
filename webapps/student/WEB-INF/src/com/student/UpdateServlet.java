package com.student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateRegistrationForm")
public class UpdateServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Data Fetched Successfully");

		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int stdId = Integer.parseInt(req.getParameter("stdId"));
		String studentFirstName = req.getParameter("studentFirstName");
		String studentLastName = req.getParameter("studentLastName");
		String studentEmailId = req.getParameter("studentEmailId");
		String studentAddress = req.getParameter("studentAddress");

		try {
		    StudentDTO studentDTO = new StudentDTO();
		    studentDTO.setStdId(stdId);
		    studentDTO.setStudentFirstName(studentFirstName);
		    studentDTO.setStudentLastName(studentLastName);
		    studentDTO.setStudentEmailId(studentEmailId);
		    studentDTO.setStudentAddress(studentAddress);
		    
		    int status = StudentDAO.UpdateRegistrationForm(studentDTO);
		    
		    if (status > 0) {
		        System.out.println("Update Successfully");
		        resp.sendRedirect("display");
		    } else {
		        System.out.println("Registration not successfully updated");
		        resp.getWriter().write("Update failed"); 
		    }
		    
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
