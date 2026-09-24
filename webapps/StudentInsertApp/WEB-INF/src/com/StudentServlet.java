package com;

import com.StudentDAO;
import com.StudentDTO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		StudentDTO s = new StudentDTO();
		s.setName(req.getParameter("name"));
		s.setEmail(req.getParameter("email"));
		s.setCourse(req.getParameter("course"));

		StudentDAO dao = new StudentDAO();
		dao.insertStudent(s);

		resp.sendRedirect("success.jsp");
	}
}
