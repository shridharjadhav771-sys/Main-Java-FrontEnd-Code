package com.dakshabhi.order.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dakshabhi.order.dao.CustomerOrderDAO;
import com.dakshabhi.order.dto.CustomerOrderDTO;
import com.dakshabhi.order.dto.CustomerOrderProductDto;

@WebServlet("/checkout")
public class SessionOrderDetails extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sessionId = req.getParameter("token");
		if(sessionId != null && !sessionId.isEmpty()){
			CustomerOrderDAO customerOrderDAO = new CustomerOrderDAO();
			CustomerOrderDTO customerOrderDTO = customerOrderDAO.getOrderDetails(sessionId);
		    List<CustomerOrderProductDto> orderaddonList = customerOrderDAO.getOrderProductDetails(customerOrderDTO.getId());
		    req.getSession().setAttribute("addonList", orderaddonList);
		    req.getSession().setAttribute("orderDTO", customerOrderDTO);
		    resp.sendRedirect("checkout.jsp");
		}
	}
}
