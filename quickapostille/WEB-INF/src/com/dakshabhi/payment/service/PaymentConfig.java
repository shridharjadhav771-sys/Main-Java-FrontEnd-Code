package com.dakshabhi.payment.service;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dakshabhi.common.db.QueryHelper;
import com.dakshabhi.payment.dto.PaymentKeysDTO;
import com.google.gson.Gson;

@WebServlet("/paykeys")
public class PaymentConfig extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PaymentKeysDTO paymentKeysDTO = req.getSession().getAttribute("paymentKeysDTO")== null ? null: (PaymentKeysDTO)req.getSession().getAttribute("paymentKeysDTO");
	 
		if(paymentKeysDTO == null) {
			QueryHelper qh = new QueryHelper();
			try {
				 
				String sql = "select * from qa_payment_config where is_deleted =0 and is_active = 1";
				ResultSet rs = qh.runQueryStreamResults(sql);
				if(rs.next()) {
					paymentKeysDTO = new PaymentKeysDTO();
					paymentKeysDTO.setMerchantID(rs.getString("merchant_id"));
					paymentKeysDTO.setGateway(rs.getString("gateway"));
					paymentKeysDTO.setAuthId(rs.getString("auth_id"));
					paymentKeysDTO.setAuthKey(rs.getString("auth_key"));
					paymentKeysDTO.setDescriptor(rs.getString("descriptor"));
					req.getSession().setAttribute("paymentKeysDTO", paymentKeysDTO);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				qh.releaseConnection();
			}
		}
		if(paymentKeysDTO != null) {
			Map map = new HashMap();
			map.put("gateway", paymentKeysDTO.getGateway()); 
			map.put("authId", paymentKeysDTO.getAuthId());
			map.put("status", "success");   
			Gson gson = new Gson();
			resp.setContentType("application/json");
			resp.getWriter().write(gson.toJson(map));
		}else {
			Map map = new HashMap(); 
			map.put("status", "error");   
			Gson gson = new Gson();
			resp.setContentType("application/json");
			resp.getWriter().write(gson.toJson(map)); 
		} 
	}

}
