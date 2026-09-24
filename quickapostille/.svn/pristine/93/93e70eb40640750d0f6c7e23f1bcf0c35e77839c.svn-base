package com.dakshabhi.order.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dakshabhi.order.dao.CustomerOrderDAO;
import com.dakshabhi.order.dto.CustomerOrderDTO;
import com.dakshabhi.order.dto.CustomerOrderProductDto;
import com.google.gson.Gson;

@WebServlet("/updateorderdetailsservice")
public class UpdateOrderDetailsService extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action") == null ? "" : req.getParameter("action");
		if(action.equalsIgnoreCase("updateaddons")) {
			Boolean status = false;
			CustomerOrderDAO dao = new CustomerOrderDAO();
			String addons = req.getParameter("addons");
			String orderid = req.getParameter("order_id");
			String total_amount = req.getParameter("total_amount");
			String quantity = req.getParameter("quantity");
			Gson gson = new Gson();
			List<CustomerOrderProductDto> list = new ArrayList<>();
			String[] addonArray = gson.fromJson(addons, String[].class);
			if(addonArray != null) {
				try {
					list = dao.updateAddons(Integer.parseInt(orderid), addonArray);					
					status = true;
				} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
			}
			dao.updateTotalAmount(Integer.parseInt(orderid), total_amount, quantity);
			HttpSession session = req.getSession();
			CustomerOrderDTO orderDTO = (CustomerOrderDTO) session.getAttribute("orderDTO");
			orderDTO.setOrderTotalAmount(Double.valueOf(total_amount));
			orderDTO.setOrderTotalAmountRound((int)(Double.valueOf(total_amount) * 100));
			orderDTO.setQuantity(Integer.parseInt(quantity));
			req.getSession().setAttribute("addonList", list);
			resp.setContentType("application/json");
			resp.getWriter().write(gson.toJson(status)); 
		}
	}
}
