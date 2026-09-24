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
import com.globecreater.dto.ItemCategoryDTO;
import com.globecreater.dto.ItemGroupDTO;
import com.google.gson.Gson;
import com.mysql.cj.xdevapi.DbDoc;

@WebServlet("/ItemCategory")
public class ItemCategoryServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");

		if (action.equalsIgnoreCase("insert")) {
			String category_name = req.getParameter("category_name");
			String category_code = req.getParameter("category_code");
			int item_group = Integer.parseInt(req.getParameter("item_group"));
			String is_active = req.getParameter("is_active");

			ItemCategoryDTO dto = new ItemCategoryDTO();
			dto.setCategory_name(category_name);
			dto.setCategory_code(category_code);
			dto.setItem_group(item_group);
			dto.setIs_active(is_active);

			try {
				Connection con = DBConnections.getInstance();

				if (con != null) {
					System.out.println("Insert Data Done Successfully");

					PreparedStatement pstnt = con.prepareStatement(
							"INSERT INTO gb_mst_item_category(category_name,category_code,item_group,is_active,is_deleted) VALUES (?,?,?,?,0)");

					pstnt.setString(1, category_name);
					pstnt.setString(2, category_code);
					pstnt.setInt(3, item_group);
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

			int item_category_id = Integer.parseInt("item_category_id");
			String category_name = req.getParameter("category_name");
			int category_code = Integer.parseInt("category_code");
			int item_group = Integer.parseInt("item_group");
			String is_active = req.getParameter("is_active");

			try {
				Connection con = DBConnections.getInstance();

				if (con != null) {
					PreparedStatement pstnt = con.prepareStatement(
							"UPDATE gb_mst_item_category SET category_name = ?,category_code = ?,item_group = ?,is_active = ? WHERE item_category_id = ?");

					pstnt.setString(1, category_name);
					pstnt.setInt(2, category_code);
					pstnt.setInt(3, item_group);
					pstnt.setString(4, is_active);
					pstnt.setInt(5, item_category_id);
					System.out.println("Update Operation Done SucessFully");

					pstnt.execute();
				}

			} catch (Exception e) {
				e.printStackTrace();

			}
			resp.setContentType("text/plain");
			resp.getWriter().write("Update Success");

		} else if (action.equalsIgnoreCase("delete")) {

			int item_category_id = Integer.parseInt(req.getParameter("item_category_id"));

			try {

				Connection con = DBConnections.getInstance();

				if (con != null) {
					PreparedStatement pstnt = con
							.prepareStatement("UPDATE gb_mst_item_category set is_deleted=1 WHERE item_category_id =?");
					pstnt.setInt(1, item_category_id);
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

			String searchcategory = req.getParameter("searchcategory");
			System.out.println("Inside display action");

			try {
				List<ItemCategoryDTO> categorylist = new ArrayList<ItemCategoryDTO>();

				String str = "";
				if (searchcategory != null && !searchcategory.isEmpty()) {
					str += " AND (gmic.category_name LIKE '%" + searchcategory + "%' OR gmic.category_code LIKE '%"
							+ searchcategory + "%' OR gmig.item_group_name LIKE '%" + searchcategory + "%' OR gmic.is_active LIKE '%"
							+ searchcategory + "%')";
				}

				Connection conn = DBConnections.getInstance();
				String sql = "SELECT gmic.*,gmig.item_group_name FROM gb_mst_item_category gmic left join gb_mst_item_group gmig on gmic.item_group = gmig.item_group_id WHERE gmic.is_deleted=0" + str;

				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {

					ItemCategoryDTO dto = new ItemCategoryDTO();
					dto.setItem_category_id(rs.getInt("item_category_id"));
					dto.setCategory_name(rs.getString("category_name"));
					dto.setCategory_code(rs.getString("category_code"));
					dto.setItem_group(rs.getInt("item_group"));
					dto.setIs_active(rs.getString("is_active"));
					dto.setItem_group_name(rs.getString("item_group_name"));;
					categorylist.add(dto);
				}
				Gson gson = new Gson();
				resp.setContentType("application/json");
				resp.getWriter().write(gson.toJson(categorylist));

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (action.equalsIgnoreCase("getbyid")) {
			System.out.println("Inside display action");
			try {
				String id = req.getParameter("item_id");
				ItemCategoryDTO dto = new ItemCategoryDTO();
				Connection conn = DBConnections.getInstance();

				String sql = "Select * from gb_mst_item_category WHERE item_category_id =" + id;
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();

				if (rs.next()) {
					dto.setItem_category_id(rs.getInt("item_category_id"));
					dto.setCategory_name(rs.getString("category_name"));
					dto.setCategory_code(rs.getString("category_code"));
					dto.setItem_group(rs.getInt("item_group"));
					dto.setIs_active(rs.getString("is_active"));

				}
				Gson gson = new Gson();
				resp.setContentType("application/json");
				resp.getWriter().write(gson.toJson(dto));

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (action.equalsIgnoreCase("getItemGroup")) {
			try {
				List<ItemGroupDTO> list = new ArrayList<ItemGroupDTO>();
				Connection conn = DBConnections.getInstance();
				String sql = "Select * from gb_mst_item_group WHERE is_deleted = 0";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					ItemGroupDTO dto = new ItemGroupDTO();
					dto.setItem_group_name(rs.getString("item_group_name"));
					dto.setItem_group_id(rs.getInt("item_group_id"));
					list.add(dto);
				}
				Gson gson = new Gson();
				resp.setContentType("application/json");
				resp.getWriter().write(gson.toJson(list));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		

		doPost(req, resp);
	}

}
