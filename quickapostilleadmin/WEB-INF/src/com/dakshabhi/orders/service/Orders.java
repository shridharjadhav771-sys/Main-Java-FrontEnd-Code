package com.dakshabhi.orders.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dakshabhi.common.utility.StringUtility;
import com.dakshabhi.orders.dao.OrderDAO;
import com.dakshabhi.orders.dto.OrderDTO;
import com.google.gson.Gson;

@WebServlet("/orders")
public class Orders extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String searchKeyword = StringUtility.removeNull(req.getParameter("searchKeyword"));
		String dateType = StringUtility.removeNull(req.getParameter("dateType"));
		String fromDate = StringUtility.removeNull(req.getParameter("fromDate"));
		String toDate = StringUtility.removeNull(req.getParameter("toDate"));
		String orderStatus = StringUtility.removeNull(req.getParameter("orderStatus"));
		String acttionType = StringUtility.removeNull(req.getParameter("acttionType"));
		if (acttionType.equals("list")) {
			ArrayList<OrderDTO> orderList = OrderDAO.getOrderList(searchKeyword, fromDate, toDate, orderStatus);
			resp.setContentType("application/json");
			Gson gson = new Gson();
			resp.getWriter().write(gson.toJson(orderList));
		} else if (acttionType.equals("getOrder")) {
			String orderId = StringUtility.removeNull(req.getParameter("orderId"));
			OrderDTO order = OrderDAO.getOrderById(orderId);
			resp.setContentType("application/json");
			Gson gson = new Gson();
			resp.getWriter().write(gson.toJson(order));
		}
		doPost(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String acttionType = StringUtility.removeNull(req.getParameter("acttionType"));

		if (acttionType.equals("updateOrder")) {
			OrderDTO order = new OrderDTO();
			order.setOrderId(req.getParameter("orderId"));
			order.setFirstName(req.getParameter("customer"));
			order.setOrderStatus(req.getParameter("status"));
			order.setLastName(req.getParameter("last_name"));
			order.setPhone(req.getParameter("phone_no"));
			boolean updated = OrderDAO.updateOrder(order);
			resp.setContentType("application/json");
			resp.getWriter().write("{\"success\":" + updated + "}");
		}
	}
}
