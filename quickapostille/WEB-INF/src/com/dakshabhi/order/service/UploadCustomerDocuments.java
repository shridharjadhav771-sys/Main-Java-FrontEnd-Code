package com.dakshabhi.order.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.dakshabhi.order.dao.CustomerOrderDAO;
import com.google.gson.Gson;

@WebServlet("/uploadcustomerdocuments")
@MultipartConfig
public class UploadCustomerDocuments extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			CustomerOrderDAO dao = new CustomerOrderDAO();
			int orderId = Integer.parseInt(req.getParameter("orderid") == null ? "0" : req.getParameter("orderid"));
			String filename = dao.getUploadedDocuemnt(orderId);
			Gson gson = new Gson();
			resp.setContentType("application/json");
			resp.getWriter().write(gson.toJson(filename));
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
				CustomerOrderDAO dao = new CustomerOrderDAO();
			    Part document = req.getPart("upload_image_background");	
			    int orderId = Integer.parseInt(req.getParameter("orderid") == null ? "0" : req.getParameter("orderid"));
			    if (document != null && document.getSize() > 0) {
			    	String fileName = document.getSubmittedFileName();
			        dao.updateDocument(document, orderId, fileName);			        
			    }

		} catch (Exception e) {
			e.printStackTrace();
		}
		Gson gson = new Gson();
		resp.setContentType("application/json");
		resp.getWriter().write(gson.toJson(true)); 
	}
}
