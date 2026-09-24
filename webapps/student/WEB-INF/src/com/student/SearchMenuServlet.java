package com.student;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchRecord")
public class SearchMenuServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		
		String search = req.getParameter("searchField");

		StudentDAO stuObj= new StudentDAO();
		try {
			ArrayList<StudentDTO> studList = stuObj.searchstudent(search);
			if(studList !=null) {
				req.getSession().setAttribute("List", studList);
				 resp.sendRedirect("display.jsp");
			}else {
				System.out.println("List is null");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

