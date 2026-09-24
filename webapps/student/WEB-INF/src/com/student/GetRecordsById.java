package com.student;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/getRecordById")
public class GetRecordsById extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int id = Integer.parseInt(req.getParameter("id"));
	try {	
		ArrayList<StudentDTO> list = new ArrayList<StudentDTO>();
		
		list=StudentDAO.getRecordById(id);
		
		if(list!=null) {
			req.getSession().setAttribute("recordsById", list);
			resp.sendRedirect("updateForm.jsp");
		}else {
			System.out.println("List is null");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
}
}
