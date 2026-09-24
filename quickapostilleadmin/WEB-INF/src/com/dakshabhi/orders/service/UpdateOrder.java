package com.dakshabhi.orders.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dakshabhi.orders.dao.OrderDAO;
import com.dakshabhi.orders.dto.CustomerOrderProductDto;
import com.dakshabhi.orders.dto.OrderDTO;
import com.google.gson.Gson;

@WebServlet("/updateorder")
@MultipartConfig
public class UpdateOrder extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		OrderDAO dao = new OrderDAO();
		OrderDTO orderDTO = dao.getOrderDetails(Integer.parseInt(id));
		ArrayList<CustomerOrderProductDto> addonList = dao.getAddonsList(Integer.parseInt(id));
		HashMap<String, Object> result = new HashMap<>();
		result.put("order", orderDTO);
		result.put("addonList", addonList);
		Gson gson = new Gson();
		resp.setContentType("application/json");
		resp.getWriter().write(gson.toJson(result));
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		OrderDAO dao = new OrderDAO();
		if(action.equalsIgnoreCase("updateDetails")) {
			String productquantity = req.getParameter("productquantity");
			String[] addonValues = req.getParameterValues("addon_values"); 
			String shipping_method = req.getParameter("shipping_method");
			String orderId = req.getParameter("orderId");
			String orderCost = req.getParameter("orderCost");
			int addonquantity1 = Integer.parseInt(req.getParameter("addonquantity1"));
			int addonquantity2 = Integer.parseInt(req.getParameter("addonquantity2"));
			int addonquantity3 = Integer.parseInt(req.getParameter("addonquantity3"));
			int addonquantity4 = Integer.parseInt(req.getParameter("addonquantity4"));
			OrderDTO orderDTO = new OrderDTO();
			orderDTO.setShippingMethod(shipping_method.split("::")[0]);
			orderDTO.setShippingCost(shipping_method.split("::")[1]);
			orderDTO.setOrderId(orderId);
			orderDTO.setTotalCost(orderCost);
			orderDTO.setQuantity(Integer.parseInt(productquantity));
			boolean status = dao.updateOrderDetails(orderDTO);			
			dao.updateAddons(Integer.parseInt(orderId), addonValues,addonquantity1,addonquantity2,addonquantity3,addonquantity4);
			Gson gson = new Gson();
			resp.setContentType("application/json");
			resp.getWriter().write(gson.toJson(status));
		}
	}
}	
