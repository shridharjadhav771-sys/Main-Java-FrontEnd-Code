package com.student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/display")
public class StudentDisplayServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String searchField = req.getParameter("searchField");
			ArrayList<StudentDTO> list = new ArrayList<StudentDTO>();
			
			list=StudentDAO.displayStudentDetails(searchField);
			
			if(list!=null) {
				req.getSession().setAttribute("List", list);
				resp.sendRedirect("display.jsp");
			}else {
				System.out.println("List is null");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
