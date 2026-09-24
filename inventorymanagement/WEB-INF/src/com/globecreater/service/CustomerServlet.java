package com.globecreater.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.DBConnections;
import com.globecreater.dto.CustomerDTO;
import com.google.gson.Gson;
import com.mysql.cj.xdevapi.DbDoc;

@WebServlet("/Customer")
public class CustomerServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");

		if (action.equalsIgnoreCase("insert")) {

			String company_id = "1";
			String customer_name = req.getParameter("customer_name");
			String customer_address = req.getParameter("customer_address");
			String customer_email = req.getParameter("customer_email");
			int customer_phone = Integer.parseInt(req.getParameter("customer_phone"));

			CustomerDTO dto = new CustomerDTO();
			dto.setCustomer_name(customer_name);
			dto.setCustomer_address(customer_address);
			dto.setCustomer_email(customer_email);
			dto.setCustomer_phone(customer_phone);

			try {

				Connection con = DBConnections.getInstance();

				if (con != null) {
					System.out.println("Insert Data Done Successfully");

					PreparedStatement pstnt = con.prepareStatement(
							"INSERT INTO gb_mst_customer(company_id,customer_name,customer_address,customer_email,customer_phone,is_deleted)VALUES(?,?,?,?,?,0)");

					pstnt.setString(1, company_id);
					pstnt.setString(2, customer_name);
					pstnt.setString(3, customer_address);
					pstnt.setString(4, customer_email);
					pstnt.setInt(5, customer_phone);
					pstnt.execute();

				} else {
					System.out.println("Insert Data Operation failed ....please check the code");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			resp.setContentType("text/plain");
			resp.getWriter().write("Success");

		} else if (action.equalsIgnoreCase("update")) {

			String customer_id =req.getParameter("customer_id");
			String customer_name = req.getParameter("customer_name");
			String customer_address = req.getParameter("customer_address");
			String customer_email = req.getParameter("customer_email");
			int customer_phone = Integer.parseInt(req.getParameter("customer_phone"));

			try {

				Connection con = DBConnections.getInstance();

				if (con != null) {

					PreparedStatement pstnt = con.prepareStatement(
							"UPDATE gb_mst_customer SET customer_name = ?,customer_address = ?,customer_email = ?,customer_phone = ? WHERE customer_id =?");

					pstnt.setString(1, customer_name);
					pstnt.setString(2, customer_address);
					pstnt.setString(3, customer_email);
					pstnt.setInt(4, customer_phone);
					pstnt.setInt(5, Integer.parseInt(customer_id));			

					System.out.println("Update Operation Done SucessFully");
					pstnt.execute();
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			resp.setContentType("text/plain");
			resp.getWriter().write("Update Success");
		} else if (action.equalsIgnoreCase("delete")) {

			int customer_id = Integer.parseInt(req.getParameter("customer_id"));

			try {

				Connection con = DBConnections.getInstance();

				if (con != null) {

					PreparedStatement pstnt = con
							.prepareStatement("UPDATE gb_mst_customer set is_deleted =1 WHERE customer_id=?");

					pstnt.setInt(1, customer_id);
					pstnt.execute();

					System.out.println("Delete Operation Done Successfully");

				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");

		if (action.equalsIgnoreCase("display")) {

			String searchCustomers = req.getParameter("searchCustomers");

			System.out.println("Inside display action");

			try {
				List<CustomerDTO> customerlist = new ArrayList<CustomerDTO>();

				String str = "";

				if (searchCustomers != null && !searchCustomers.isEmpty()) {
					str += " AND (" + "customer_name LIKE '%" + searchCustomers + "%' OR " + "customer_address LIKE '%"
							+ searchCustomers + "%' OR " + "customer_email LIKE '%" + searchCustomers + "%' OR "
							+ "customer_phone LIKE '%" + searchCustomers + "%'" + ")";
				}

				Connection conn = DBConnections.getInstance();

				String sql = "Select * from gb_mst_customer WHERE is_deleted = 0" + str;
				System.out.println(sql);

				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {

					CustomerDTO dto = new CustomerDTO();

					dto.setCustomer_id(rs.getInt("customer_id"));
					dto.setCompany_id(rs.getString("company_id"));
					dto.setCustomer_name(rs.getString("customer_name"));
					dto.setCustomer_address(rs.getString("customer_address"));
					dto.setCustomer_email(rs.getString("customer_email"));
					dto.setCustomer_phone(rs.getInt("customer_phone"));

					customerlist.add(dto);

				}
				Gson gson = new Gson();
				resp.setContentType("application/json");
				resp.getWriter().write(gson.toJson(customerlist));

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (action.equalsIgnoreCase("getCustomerDetails")) {
			System.out.println("Inside display action");

			try {

				String id = req.getParameter("customer_id");

				CustomerDTO dto = new CustomerDTO();

				Connection conn = DBConnections.getInstance();

				String sql = "Select * from gb_mst_customer WHERE customer_id=" + id;
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();

				if (rs.next()) {

					dto.setCustomer_id(rs.getInt("customer_id"));
					dto.setCompany_id(rs.getString("company_id"));
					dto.setCustomer_name(rs.getString("customer_name"));
					dto.setCustomer_address(rs.getString("customer_address"));
					dto.setCustomer_email(rs.getString("customer_email"));
					dto.setCustomer_phone(rs.getInt("customer_phone"));

				}
				Gson gson = new Gson();
				resp.setContentType("application/json");
				resp.getWriter().write(gson.toJson(dto));

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		doPost(req, resp);
	}

}
