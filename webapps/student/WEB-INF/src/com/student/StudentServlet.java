package com.student;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/RegistrationServlet")
public class StudentServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Data Fetched Successfully");

		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		if (action.equalsIgnoreCase("insert")) {
			String studentFirstName = req.getParameter("fname");
			String studentLastName = req.getParameter("lname");
			String studentEmailId = req.getParameter("email");
			String studentAddress = req.getParameter("address");
			try {

				StudentDTO studentDTO = new StudentDTO();
				studentDTO.setStudentFirstName(studentFirstName);
				studentDTO.setStudentLastName(studentLastName);
				studentDTO.setStudentEmailId(studentEmailId);
				studentDTO.setStudentAddress(studentAddress);

				int status = StudentDAO.RegistrationForm(studentDTO);
				if (status > 0) {
					System.out.println("Registation Successfully");
					resp.sendRedirect("display");
				} else {
					System.out.println("Registration not successfully");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (action.equalsIgnoreCase("update")) {
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

		} else if (action.equalsIgnoreCase("delete")) {
			int id = Integer.parseInt(req.getParameter("id"));

			try {

				int status = StudentDAO.DeleteServlet(id);
				if (status > 0) {
					System.out.println("Delete Successfully");
					resp.sendRedirect("display");
				} else {
					System.out.println("Delete not successfully");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if(action.equalsIgnoreCase("getRecordsById")) {
			int id = Integer.parseInt(req.getParameter("id"));
			try {	
				ArrayList<StudentDTO> list = new ArrayList<StudentDTO>();				
				list=StudentDAO.getRecordById(id);
				Gson gson = new Gson();
				resp.setContentType("application/json");
				resp.getWriter().write(gson.toJson(list));
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
