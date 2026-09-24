package com.dakshabhi.payment.service;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

import com.dakshabhi.common.StringUtility;
import com.dakshabhi.common.db.QueryHelper;
import com.dakshabhi.common.db.SQLResults;
import com.google.gson.Gson;
import com.mysql.cj.Query;

import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.http.entity.StringEntity;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;

@WebServlet("/customerorderdetails")
public class CustomerOrderDetails extends HttpServlet {
//	private static final String API_URL = "https://test.quickapostille.online/wp-json/wc/v3/orders";
//	private static final String API_KEY = "ck_2dd025b9349004f9e999d25626ebf0c1ea1b8847";
//	private static final String API_SECRET = "cs_6de98f9e1d6ca37c88699a39c0620121b2678c4a";
	
	private static final String API_URL = "https://www.quickapostille.online/wp-json/wc/v3/orders";
	private static final String API_KEY = "ck_2dd025b9349004f9e999d25626ebf0c1ea1b8847";
	private static final String API_SECRET = "cs_6de98f9e1d6ca37c88699a39c0620121b2678c4a";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userIp = request.getParameter("userIp");
		String sessionId = request.getSession().getId() + System.currentTimeMillis();
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String company = request.getParameter("company") == null ? "" : request.getParameter("company");
		String country = request.getParameter("country");
		String street = request.getParameter("street");
		String address2 = request.getParameter("apartment") == null ? "" : request.getParameter("apartment");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zip = request.getParameter("zip");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String shipping = request.getParameter("shipping_method");
		String[] shippingDetails = shipping.split("::");
		String shippingMethod = shippingDetails[0];
		double shippingCost = Double.parseDouble(shippingDetails[1]);
		String notes = request.getParameter("notes") == null ? "" : request.getParameter("notes");
		String currencyCode = request.getParameter("currencyCode");
		String currencySymbol = request.getParameter("currencySymbol");
		double orderCost = Double.parseDouble(request.getParameter("orderCost"));
		String[] addonValues = request.getParameterValues("addon_values"); 
		int orderStatus = Integer.parseInt(request.getParameter("orderStatus") == null ? "0" : request.getParameter("orderStatus")); 
		int orderId = Integer.parseInt(request.getParameter("orderId") == null ? "0" : request.getParameter("orderId"));
		String paymentId = StringUtility.removeNull(request.getParameter("paymentId"));
		String newOrderID = "";
		QueryHelper qh = new QueryHelper();
		try {
			if(orderId <= 0) {
				String sql = "INSERT INTO qa_order (date_created, time_created, session_id, user_ip, first_name, last_name, "
						+ "company_name, country, street_address, address_2, city, state, postal_code, phone_no, email, "
						+ "order_total_amount, shipping_method, shipping_cost, order_status, notes) "
						+ "VALUES (now(), now(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
				qh.addParam(sessionId);
				qh.addParam(userIp);
				qh.addParam(firstName);
				qh.addParam(lastName);
				qh.addParam(company);
				qh.addParam(country);
				qh.addParam(street);
				qh.addParam(address2);
				qh.addParam(city);
				qh.addParam(state);
				qh.addParam(zip);
				qh.addParam(phone);
				qh.addParam(email);
				qh.addParam(orderCost);
				qh.addParam(shippingMethod);
				qh.addParam(shippingCost);
				qh.addParam(orderStatus);
				qh.addParam(notes); 
				qh.runQuery(sql);
				orderId = qh.getLastGeneratedKey();
				
				System.out.println("orderId: " + orderId); 
				// Insert Selected Product
				if (orderId > 0 && addonValues != null) {
					insertAddons(orderId, addonValues);
				}
			}
			
			
			if(orderStatus == 1) {
				//update Order Status
				updateOrderStatus(orderId,paymentId,orderCost);
				
				// Send Order Details to API
				Map<String, String> billing = new HashMap<>();
				billing.put("first_name", firstName);
				billing.put("last_name", lastName);
				billing.put("address_1", street);
				billing.put("city", city);
				billing.put("state", state);
				billing.put("postcode", zip);
				billing.put("country", country);
				billing.put("email", email);
				billing.put("phone", phone);

				Map<String, String> shippingInfo = new HashMap<>(billing);

				List<Map<String, Object>> lineItems = new ArrayList<>();
				Map<String, Object> lineItem = new HashMap<>();
				lineItem.put("product_id", 2520);
				lineItem.put("quantity", 1);
				lineItems.add(lineItem);

				List<Map<String, Object>> feeLines = new ArrayList<>();
				if (addonValues != null) {
					for (String addon : addonValues) {
						String[] parts = addon.split("::");
						Map<String, Object> fee = new HashMap<>();
						fee.put("name", parts[0]);
						fee.put("total", String.format("%.2f", Double.parseDouble(parts[1])));
						feeLines.add(fee);
					}
				}
				Map<String, String> shippingLine = new HashMap<>();
				shippingLine.put("method_id", "custom_shipping");
				shippingLine.put("method_title", shippingMethod);
				shippingLine.put("total", String.format("%.2f", shippingCost));
				newOrderID = sendOrderDetailsToAPI(billing, shippingInfo, lineItems, feeLines, shippingLine, notes, currencyCode,
						currencySymbol);
				if(!newOrderID.equals("")) {
					updateOrderWithLiveOrder(newOrderID,orderId);
				}
			}
			
			Map map = new HashMap();
			map.put("orderID", orderId); 
			map.put("mainOrderId", newOrderID);
			map.put("status", "sucess");   
			Gson gson = new Gson();
			response.setContentType("application/json");
			response.getWriter().write(gson.toJson(map));

		} catch (Exception e) {
			e.printStackTrace();
			Map map = new HashMap(); 
			map.put("status", "error");   
			Gson gson = new Gson();
			response.setContentType("application/json");
			response.getWriter().write(gson.toJson(map)); 
		} finally {
			qh.releaseConnection();
		}
	}

	private void updateOrderWithLiveOrder(String newOrderID, int orderId) {
		QueryHelper qh = new QueryHelper();
		try {
			String sql = "update qa_order set mainorderid =? where id = ?";
			qh.addParam(newOrderID);
			qh.addParam(orderId);
			qh.runQuery(sql);  
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			qh.releaseConnection();
		}
		
	}

	private void updateOrderStatus(int orderId , String paymentId, double orderCost) {
		QueryHelper qh = new QueryHelper();
		try {
			String sql = "update qa_order set order_status =1 where id = ?";
			qh.addParam(orderId);
			qh.runQuery(sql);
			
			qh.clearParams();
			
			sql = "insert into qa_order_payment(order_id, payment_id, amount, payment_status) values(?,?,?,1) ";
			qh.addParam(orderId);
			qh.addParam(paymentId);
			qh.addParam(orderCost);
			
			qh.runQuery(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			qh.releaseConnection();
		}
		
	}

	private int getOrderIDBySessionId(String sessionId) {
		QueryHelper qh = new QueryHelper();
		try {
			String sql = "select id from qa_order where session_id = ?";
			qh.addParam(sessionId);
			ResultSet rs = qh.runQueryStreamResults(sql);
			if(rs.next()) {
				return rs.getInt("id");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			qh.releaseConnection();
		}
		return 0;
	}

	public void insertAddons(int orderId, String[] addonValues) throws ClassNotFoundException, SQLException { 
		for (String addon : addonValues) {
			String[] parts = addon.split("::");
			if (parts.length == 2) {
				String addonName = parts[0];
				double addonPrice = Double.parseDouble(parts[1]);
				QueryHelper qh = new QueryHelper();
				try {
					String sql = "INSERT INTO qa_order_products (order_id, product_id, prodcut_name, product_price) VALUES (?, ?, ?, ?)";
					qh.addParam(orderId);
					qh.addParam(0);
					qh.addParam(addonName);
					qh.addParam(addonPrice);
					qh.runQuery(sql);
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					qh.releaseConnection();
				} 
			}
		}
		 
	}

	public static String sendOrderDetailsToAPI(Map<String, String> billingInfo, Map<String, String> shippingInfo,
			List<Map<String, Object>> lineItems, List<Map<String, Object>> feeLines, Map<String, String> shippingLine,
			String notes, String currencyCode, String currencySymbol) {
		String orderID = "";
		try (CloseableHttpClient client = HttpClients.createDefault()) {
			HttpPost post = new HttpPost(API_URL);

			String auth = API_KEY + ":" + API_SECRET;
			String encodedAuth = Base64.getEncoder().encodeToString(auth.getBytes(StandardCharsets.UTF_8));
			post.setHeader("Authorization", "Basic " + encodedAuth);
			post.setHeader("Content-Type", "application/json");
			post.setHeader("Accept", "application/json");

			JSONObject orderJson = new JSONObject();
			orderJson.put("payment_method", "stripe");
			orderJson.put("payment_method_title", "Credit / Debit Card");
			orderJson.put("set_paid", true);
			orderJson.put("billing", new JSONObject(billingInfo));
			orderJson.put("shipping", new JSONObject(shippingInfo));
			orderJson.put("customer_note", notes);
			orderJson.put("currency", currencyCode);
			orderJson.put("currency_symbol", currencySymbol);

			JSONArray lineItemsArray = new JSONArray();
			for (Map<String, Object> item : lineItems) {
				lineItemsArray.put(new JSONObject(item));
			}
			orderJson.put("line_items", lineItemsArray);

			JSONArray feeLinesArray = new JSONArray();
			for (Map<String, Object> fee : feeLines) {
				feeLinesArray.put(new JSONObject(fee));
			}
			orderJson.put("fee_lines", feeLinesArray);

			JSONArray shippingLinesArray = new JSONArray();
			shippingLinesArray.put(new JSONObject(shippingLine));
			orderJson.put("shipping_lines", shippingLinesArray);
			System.out.println(orderJson);
			post.setEntity(new StringEntity(orderJson.toString(), "UTF-8"));

			HttpResponse response = client.execute(post);
			int statusCode = response.getStatusLine().getStatusCode();
			if (statusCode == 201) {
				System.out.println("Order created successfully.");
			} else {
				System.out.println("Failed to create order. HTTP Code: " + statusCode);
			}
			HttpEntity responseEntity = response.getEntity();
			if (responseEntity != null) {
				String result = EntityUtils.toString(responseEntity);
				System.out.println("Response: " + result);
				JSONObject jsonResult = new JSONObject(result);
				orderID = jsonResult.get("id").toString();
				System.out.println("Main orderID: " + orderID);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return orderID;
	}

}
