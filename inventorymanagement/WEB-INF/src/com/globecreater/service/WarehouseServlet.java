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
import com.globecreater.dto.WarehouseDTO;
import com.google.gson.Gson;
import com.mysql.cj.xdevapi.DbDoc;

@WebServlet("/Warehouse")
public class WarehouseServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");

		if (action.equalsIgnoreCase("insert")) {

			String company_id = "1";
			String warehouse_name = req.getParameter("warehouse_name");
			int phone = Integer.parseInt(req.getParameter("phone"));
			int mobile = Integer.parseInt(req.getParameter("mobile"));
			String address = req.getParameter("address");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			int zipcode = Integer.parseInt(req.getParameter("zipcode"));
			String is_active = req.getParameter("is_active");

			WarehouseDTO dto = new WarehouseDTO();

			dto.setCompany_id(Integer.parseInt(company_id));
			dto.setWarehouse_name(warehouse_name);
			dto.setPhone(phone);
			dto.setMobile(mobile);
			dto.setAddress(address);
			dto.setCity(city);
			dto.setState(state);
			dto.setZipcode(zipcode);
			dto.setIs_active(is_active);

			try {
				Connection con = DBConnections.getInstance();

				if (con != null) {
					System.out.println("Insert Data Operation Done Successfully");

					PreparedStatement pstnt = con.prepareStatement(
							"INSERT INTO gb_mst_warehouse(company_id,warehouse_name,phone,mobile,address,city,state,zipcode,is_active,is_deleted) VALUES(?,?,?,?,?,?,?,?,?,0)");

					pstnt.setString(1, company_id);
					pstnt.setString(2, warehouse_name);
					pstnt.setInt(3, phone);
					pstnt.setInt(4, mobile);
					pstnt.setString(5, address);
					pstnt.setString(6, city);
					pstnt.setString(7, state);
					pstnt.setInt(8, zipcode);
					pstnt.setString(9, is_active);
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

			int warehouse_id = Integer.parseInt(req.getParameter("warehouse_id"));
			String warehouse_name = req.getParameter("warehouse_name");
			int phone = Integer.parseInt(req.getParameter("phone"));
			int mobile = Integer.parseInt(req.getParameter("mobile"));
			String address = req.getParameter("address");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			int zipcode = Integer.parseInt(req.getParameter("zipcode"));
			String is_active = req.getParameter("is_active");

			try {
				Connection con = DBConnections.getInstance();

				if (con != null) {

					PreparedStatement pstnt = con.prepareStatement(
							"UPDATE gb_mst_warehouse  SET warehouse_name = ?,phone = ?,mobile = ?,address = ?,city = ?,state = ?,zipcode = ?,is_active = ? WHERE warehouse_id = ?");

					pstnt.setString(1, warehouse_name);
					pstnt.setInt(2, phone);
					pstnt.setInt(3, mobile);
					pstnt.setString(4, address);
					pstnt.setString(5, city);
					pstnt.setString(6, state);
					pstnt.setInt(7, zipcode);
					pstnt.setString(8, is_active);
					pstnt.setInt(9, warehouse_id);

					System.out.println("Update Operation Done SucessFully");

					pstnt.execute();
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			resp.setContentType("text/plain");
			resp.getWriter().write("Update Success");

		} else if (action.equalsIgnoreCase("delete")) {

			String warehouse_id = req.getParameter("warehouse_id");

			try {
				Connection con = DBConnections.getInstance();

				if (con != null) {

					PreparedStatement pstnt = con
							.prepareStatement("Update gb_mst_warehouse set is_deleted =1 WHERE warehouse_id =? ");

					pstnt.setString(1, warehouse_id);
					pstnt.execute();
					System.out.println("Delete Operation Done Successfully");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			resp.setContentType("text/plain");
			resp.getWriter().write("Delete Success");
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");

		if (action.equalsIgnoreCase("display")) {

			String search_warehouse = req.getParameter("search_warehouse");

			System.out.println("Inside display action");

			try {

				List<WarehouseDTO> warehouselist = new ArrayList<WarehouseDTO>();

				String str = "";

				if (search_warehouse != null && !search_warehouse.isEmpty()) {
					str += " AND (" + "warehouse_name LIKE '%" + search_warehouse + "%' OR " + "phone LIKE '%"
							+ search_warehouse + "%' OR " + "mobile LIKE '%" + search_warehouse + "%' OR "
							+ "address LIKE '%" + search_warehouse + "%' OR " + "city LIKE '%" + search_warehouse
							+ "%' OR " + "state LIKE '%" + search_warehouse + "%' OR " + "zipcode LIKE '%"
							+ search_warehouse + "%' OR " + "is_active LIKE '%" + search_warehouse + "%'" + ")";
				}

				Connection conn = DBConnections.getInstance();

				String sql = " Select * from gb_mst_warehouse WHERE is_deleted=0" + str;

				System.out.println(sql);

				PreparedStatement pstmt = conn.prepareStatement(sql);

				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {

					WarehouseDTO warehouseDTO = new WarehouseDTO();
					warehouseDTO.setCompany_id(rs.getInt("company_id"));
					warehouseDTO.setWarehouse_name(rs.getString("warehouse_name"));
					warehouseDTO.setPhone(rs.getInt("phone"));
					warehouseDTO.setMobile(rs.getInt("mobile"));
					warehouseDTO.setAddress(rs.getString("address"));
					warehouseDTO.setCity(rs.getString("city"));
					warehouseDTO.setState(rs.getString("state"));
					warehouseDTO.setZipcode(rs.getInt("zipcode"));
					warehouseDTO.setIs_active(rs.getString("is_active"));
					warehouseDTO.setWarehouse_id(rs.getInt("warehouse_id"));

					warehouselist.add(warehouseDTO);
				}
				Gson gson = new Gson();
				resp.setContentType("application/json");
				resp.getWriter().write(gson.toJson(warehouselist));

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (action.equalsIgnoreCase("getWarehouseById")) {

			System.out.println("Inside display action");

			try {

				String id = req.getParameter("warehouseId");

				WarehouseDTO warehouseDTO = new WarehouseDTO();

				Connection conn = DBConnections.getInstance();

				String sql = "Select * from gb_mst_warehouse WHERE warehouse_id=" + id;

				PreparedStatement pstmt = conn.prepareStatement(sql);

				ResultSet rs = pstmt.executeQuery();

				if (rs.next()) {

					warehouseDTO.setWarehouse_id(rs.getInt("warehouse_id"));
					warehouseDTO.setWarehouse_name(rs.getString("warehouse_name"));
					warehouseDTO.setPhone(rs.getInt("phone"));
					warehouseDTO.setMobile(rs.getInt("mobile"));
					warehouseDTO.setAddress(rs.getString("address"));
					warehouseDTO.setCity(rs.getString("city"));
					warehouseDTO.setState(rs.getString("state"));
					warehouseDTO.setZipcode(rs.getInt("zipcode"));
					warehouseDTO.setIs_active(rs.getString("is_active"));

				}

				Gson gson = new Gson();
				resp.setContentType("application/json");
				resp.getWriter().write(gson.toJson(warehouseDTO));

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		doPost(req, resp);
	}
}
