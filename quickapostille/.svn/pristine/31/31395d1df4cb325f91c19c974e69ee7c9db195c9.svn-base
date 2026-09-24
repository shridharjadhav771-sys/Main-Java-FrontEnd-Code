package com.dakshabhi.product.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dakshabhi.product.dao.ProductServiceDAO;
import com.dakshabhi.product.dto.AddonsDTO;
import com.dakshabhi.product.dto.ProductServiceDTO;
import com.google.gson.Gson;
@WebServlet("/product/*")
public class ProductService extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getPathInfo();
		String[] parts = path.split("/");
		String id = parts[1];
		String product = parts[2].replaceAll("-", " ");
		ProductServiceDAO dao = new ProductServiceDAO();
		ProductServiceDTO serviceDTO = dao.getProductDetails(Integer.parseInt(id), product);
		ArrayList<AddonsDTO> addonsList = dao.getAddonsPrice();
		req.setAttribute("product", serviceDTO);
		req.setAttribute("addonsprice", addonsList);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/ProductService.jsp");
		dispatcher.forward(req, resp);
	}
}
