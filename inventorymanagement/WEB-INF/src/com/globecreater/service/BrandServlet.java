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
import com.globecreater.dto.BrandDTO;
import com.google.gson.Gson;
import com.mysql.cj.xdevapi.DbDoc;

@WebServlet("/Brand")
public class BrandServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");

		if (action.equalsIgnoreCase("insert")) {

			String company_id = "1";
			String brand_name = req.getParameter("brand_name");
			String brand_description = req.getParameter("brand_description");
			String is_active = req.getParameter("is_active");

			BrandDTO dto = new BrandDTO();

			/*
			 * dto.setCompany_id(Integer.parseInt(req.getParameter("company_id")));
			 */			dto.setBrand_name("brand_name");
			dto.setBrand_description("brand_description");
			dto.setIs_active(is_active);

			try {

				Connection con = DBConnections.getInstance();

				if (con != null) {
					System.out.println("Insert Data Done Successfully");
					PreparedStatement pstnt = con.prepareStatement(
							"INSERT INTO gb_mst_brand (company_id,brand_name,brand_description,is_active,is_deleted)VALUES(?,?,?,?,0)");

					pstnt.setString(1, company_id);
					pstnt.setString(2, brand_name);
					pstnt.setString(3, brand_description);
					pstnt.setString(4, is_active);
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

			int brand_id = Integer.parseInt("brand_id");
			String brand_name = req.getParameter("brand_name");
			String brand_description = req.getParameter("brand_description");
			String is_active = req.getParameter("is_active");

			try {
				Connection con = DBConnections.getInstance();

				if (con != null) {
					PreparedStatement pstnt = con.prepareStatement(
							"UPDATE gb_mst_brand SET brand_name = ?,brand_description,is_active = ? WHERE brand_id =?");

					pstnt.setString(1, brand_name);
					pstnt.setString(2, brand_description);
					pstnt.setString(3, is_active);
					pstnt.setInt(4, brand_id);

					System.out.println("Update Operation Done SucessFully");

					pstnt.execute();

				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			resp.setContentType("text/plain");
			resp.getWriter().write("Update Success");

		} else if (action.equalsIgnoreCase("delete")) {

			int brand_id = Integer.parseInt(req.getParameter("brand_id"));

			try {

				Connection con = DBConnections.getInstance();

				if (con != null) {
					PreparedStatement pstnt = con
							.prepareStatement("UPDATE gb_mst_brand set is_deleted =1 WHERE brand_id =? ");

					pstnt.setInt(1, brand_id);
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

		if (action.contentEquals("display")) {

			String searchBrand = req.getParameter("searchBrand");

			System.out.println("Inside display action");

			try {

				List<BrandDTO> brandlist = new ArrayList<BrandDTO>();

				String str = "";
				if (searchBrand != null && !searchBrand.isEmpty()) {
					str += " AND (brand_name LIKE '%" + searchBrand + "%' OR brand_description LIKE '%" + searchBrand
							+ "%' OR is_active LIKE '%" + searchBrand + "%')";
				}

				Connection conn = DBConnections.getInstance();

				String sql = "Select * from gb_mst_brand WHERE is_deleted =0" + str;

				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {

					BrandDTO dto = new BrandDTO();
					dto.setBrand_id(rs.getInt("brand_id"));
					dto.setCompany_id(rs.getInt("company_id"));
					dto.setBrand_name(rs.getString("brand_name"));
					dto.setBrand_description(rs.getString("brand_description"));
					dto.setIs_active(rs.getString("is_active"));

					brandlist.add(dto);

				}
				Gson gson = new Gson();
				resp.setContentType("application/json");
				resp.getWriter().write(gson.toJson(brandlist));

			} catch (Exception e) {
				e.printStackTrace();

			}

		} else if (action.equalsIgnoreCase("getBrandDetails")) {
			System.out.println("Inside display action");

			try {

				String id = req.getParameter("brand_id");
				BrandDTO dto = new BrandDTO();
				Connection conn = DBConnections.getInstance();

				String sql = "Select * from gb_mst_brand WHERE brand_id =" + id;
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();

				if (rs.next()) {
					dto.setBrand_id(rs.getInt("brand_id"));
					dto.setCompany_id(rs.getInt("company_id"));
					dto.setBrand_name(rs.getString("brand_name"));
					dto.setBrand_description(rs.getString("brand_description"));
					dto.setIs_active(rs.getString("is_active"));

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
