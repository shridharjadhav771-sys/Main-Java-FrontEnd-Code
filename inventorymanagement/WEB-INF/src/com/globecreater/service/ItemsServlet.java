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
import com.globecreater.dto.ItemCategoryDTO;
import com.globecreater.dto.ItemGroupDTO;
import com.globecreater.dto.ItemsDTO;
import com.globecreater.dto.UomDTO;
import com.google.gson.Gson;

@WebServlet("/Item")
public class ItemsServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");

		if (action.equalsIgnoreCase("insert")) {

			String company_id = "1";
			int items_group_category = Integer.parseInt(req.getParameter("items_group_category"));
			int items_group_id = Integer.parseInt(req.getParameter("items_group_id"));
			String item_name = req.getParameter("item_name");
			String item_code = req.getParameter("item_code");
			String item_description = req.getParameter("item_description");
			int item_brand_name = Integer.parseInt(req.getParameter("item_brand_name"));
			String item_model_no = req.getParameter("item_model_no");
			String hsn_code = req.getParameter("hsn_code");
			String size = req.getParameter("size");
			String warranty = req.getParameter("warranty");
			int uom_name = Integer.parseInt(req.getParameter("uom_name"));
			String price_per_unit = req.getParameter("price_per_unit");

			ItemsDTO dto = new ItemsDTO();

			dto.setItems_group_category(items_group_category);
			dto.setItems_id(items_group_id);
			dto.setItem_name(item_name);
			dto.setItem_code(item_code);
			dto.setItem_description(item_description);
			dto.setItem_brand_name(item_brand_name);
			dto.setItem_model_no(item_model_no);
			dto.setHsn_code(hsn_code);
			dto.setSize(size);
			dto.setWarranty(warranty);
			dto.setUom_name(uom_name);
			dto.setPrice_per_unit(price_per_unit);

			try {

				Connection con = DBConnections.getInstance();

				if (con != null) {
					System.out.println("Insert Data Operation Done SuccessFully");

					PreparedStatement pstnt = con.prepareStatement(
							"INSERT INTO gb_mst_items(company_id,items_group_id,items_group_category,item_name,item_code,item_description,item_brand_name,item_model_no,hsn_code,size,warranty,uom_name,price_per_unit,is_deleted)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,0)");

					pstnt.setString(1, company_id);
					pstnt.setInt(2, items_group_id);
					pstnt.setInt(3, items_group_category);
					pstnt.setString(4, item_name);
					pstnt.setString(5, item_code);
					pstnt.setString(6, item_description);
					pstnt.setInt(7, item_brand_name);
					pstnt.setString(8, item_model_no);
					pstnt.setString(9, hsn_code);
					pstnt.setString(10, size);
					pstnt.setString(11, warranty);
					pstnt.setInt(12, uom_name);
					pstnt.setString(13, price_per_unit);
					pstnt.execute();

				} else {
					System.out.println("Insert Data Operation failed....please check the code ");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			resp.setContentType("text/plain");
			resp.getWriter().write("Success");

		} else if (action.equalsIgnoreCase("update")) {

			int items_id = Integer.parseInt(req.getParameter("items_id"));
			int items_group_id = Integer.parseInt(req.getParameter("item_group_id"));
			int items_group_category = Integer.parseInt(req.getParameter("item_category_id"));
			String item_name = req.getParameter("item_name");
			String item_code = req.getParameter("item_code");
			String item_description = req.getParameter("item_description");
			int item_brand_name = Integer.parseInt(req.getParameter("item_brand_name"));
			String item_model_no = req.getParameter("item_model_no");
			String hsn_code = req.getParameter("hsn_code");
			String size = req.getParameter("size");
			String warranty = req.getParameter("warranty");
			int uom_name = Integer.parseInt(req.getParameter("uom_name"));
			String price_per_unit = req.getParameter("price_per_unit");

			try {

				Connection con = DBConnections.getInstance();

				if (con != null) {

					PreparedStatement pstnt = con.prepareStatement(
							"UPDATE gb_mst_items SET items_group_id = ?,items_group_category = ?,item_name = ?,item_code = ?,item_description = ?,item_brand_name = ?,item_model_no = ?,hsn_code =?,size = ?,warranty = ?,uom_name = ?,price_per_unit = ? WHERE items_id =?");

					pstnt.setInt(1, items_group_id);
					pstnt.setInt(2, items_group_category);
					pstnt.setString(3, item_name);
					pstnt.setString(4, item_code);
					pstnt.setString(5, item_description);
					pstnt.setInt(6, item_brand_name);
					pstnt.setString(7, item_model_no);
					pstnt.setString(8, hsn_code);
					pstnt.setString(9, size);
					pstnt.setString(10, warranty);
					pstnt.setInt(11, uom_name);
					pstnt.setString(12, price_per_unit);
					pstnt.setInt(13, items_id);

					System.out.println("Update Operation Done SucessFully");

					pstnt.execute();
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			resp.setContentType("text/plain");
			resp.getWriter().write("Update Success");

		} else if (action.equalsIgnoreCase("delete")) {

			int items_id = Integer.parseInt(req.getParameter("items_id"));

			try {

				Connection con = DBConnections.getInstance();

				if (con != null) {
					PreparedStatement pstnt = con
							.prepareStatement("UPDATE gb_mst_items set is_deleted =1 WHERE items_id =? ");

					pstnt.setInt(1, items_id);
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

			String searchItems = req.getParameter("searchItems");

			System.out.println("Inside display action");

			try {

				List<ItemsDTO> itemslist = new ArrayList<ItemsDTO>();

				String str = "";
				if (searchItems != null && !searchItems.isEmpty()) {
					str += " AND (" + "items_group_id LIKE '%" + searchItems + "%' OR " + "items_group_category LIKE '%"
							+ searchItems + "%' OR " + "item_name LIKE '%" + searchItems + "%' OR "
							+ "item_code LIKE '%" + searchItems + "%' OR " + "item_description LIKE '%" + searchItems
							+ "%' OR " + "item_brand_name LIKE '%" + searchItems + "%' OR " + "item_model_no LIKE '%"
							+ searchItems + "%' OR " + "hsn_code LIKE '%" + searchItems + "%' OR " + "size LIKE '%"
							+ searchItems + "%' OR " + "warranty LIKE '%" + searchItems + "%' OR " + "uom_name LIKE '%"
							+ searchItems + "%' OR " + "price_per_unit LIKE '%" + searchItems + "%'" + ")";
				}

				Connection conn = DBConnections.getInstance();

				String sql = "Select * from gb_item_view WHERE is_deleted =0" + str;

				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {

					ItemsDTO dto = new ItemsDTO();
					dto.setItems_id(rs.getInt("items_id"));
					dto.setItems_group_id(rs.getInt("items_group_id"));
					dto.setItems_group_category(rs.getInt("items_group_category"));
					dto.setItem_name(rs.getString("item_name"));
					dto.setItem_code(rs.getString("item_code"));
					dto.setItem_description(rs.getString("item_description"));
					dto.setItem_brand_name(rs.getInt("item_brand_name"));
					dto.setItem_model_no(rs.getString("item_model_no"));
					dto.setHsn_code(rs.getString("hsn_code"));
					dto.setSize(rs.getString("size"));
					dto.setWarranty(rs.getString("warranty"));
					dto.setUom_name(rs.getInt("uom_name"));
					dto.setPrice_per_unit(rs.getString("price_per_unit"));
					dto.setCategory_name(rs.getString("category_name"));
					dto.setGroup_name(rs.getString("item_group_name"));
					dto.setBrand_name(rs.getString("brand_name"));
					dto.setItem_uom_name(rs.getString("uomName"));

					itemslist.add(dto);

				}
				Gson gson = new Gson();
				resp.setContentType("application/json");
				resp.getWriter().write(gson.toJson(itemslist));

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (action.equalsIgnoreCase("getItemDetails")) {
			System.out.println("Inside display action");

			try {

				String id = req.getParameter("items_id");
				ItemsDTO dto = new ItemsDTO();
				Connection conn = DBConnections.getInstance();

				String sql = "Select * from gb_mst_items WHERE items_id =" + id;

				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();

				if (rs.next()) {
					dto.setItems_id(rs.getInt("items_id"));
					dto.setItems_group_id(rs.getInt("items_group_id"));
					dto.setItems_group_category(rs.getInt("items_group_category"));
					dto.setItem_name(rs.getString("item_name"));
					dto.setItem_code(rs.getString("item_code"));
					dto.setItem_description(rs.getString("item_description"));
					dto.setItem_brand_name(rs.getInt("item_brand_name"));
					dto.setItem_model_no(rs.getString("item_model_no"));
					dto.setHsn_code(rs.getString("hsn_code"));
					dto.setSize(rs.getString("size"));
					dto.setWarranty(rs.getString("warranty"));
					dto.setUom_name(rs.getInt("uom_name"));
					dto.setPrice_per_unit(rs.getString("price_per_unit"));

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
		} else if (action.equalsIgnoreCase("getItemCategory")) {
			try {
				List<ItemCategoryDTO> list = new ArrayList<ItemCategoryDTO>();
				Connection conn = DBConnections.getInstance();
				String sql = "Select * from gb_mst_item_category WHERE is_deleted = 0";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					ItemCategoryDTO dto = new ItemCategoryDTO();
					dto.setCategory_name(rs.getString("category_name"));
					dto.setItem_category_id(rs.getInt("item_category_id"));
					list.add(dto);
				}
				Gson gson = new Gson();
				resp.setContentType("application/json");
				resp.getWriter().write(gson.toJson(list));
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (action.equalsIgnoreCase("getItemBrand")) {
			try {
				List<BrandDTO> list = new ArrayList<BrandDTO>();
				Connection conn = DBConnections.getInstance();
				String sql = "Select * from gb_mst_brand WHERE is_deleted = 0";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					BrandDTO dto = new BrandDTO();
					dto.setBrand_name(rs.getString("brand_name"));
					dto.setBrand_id(rs.getInt("brand_id"));
					list.add(dto);
				}
				Gson gson = new Gson();
				resp.setContentType("application/json");
				resp.getWriter().write(gson.toJson(list));
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (action.equalsIgnoreCase("getItemUom")) {
			try {
				List<UomDTO> list = new ArrayList<UomDTO>();
				Connection conn = DBConnections.getInstance();
				String sql = "Select * from gb_mst_uom WHERE is_deleted = 0";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					UomDTO dto = new UomDTO();
					dto.setUomName(rs.getString("uomName"));
					dto.setUom_id(rs.getInt("uom_id"));
					list.add(dto);
				}
				Gson gson = new Gson();
				resp.setContentType("application/json");
				resp.getWriter().write(gson.toJson(list));
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (action.equalsIgnoreCase("getbyid")) {
			System.out.println("Inside display action");
			try {
				String id = req.getParameter("items_id");
				ItemsDTO itemsDTO = new ItemsDTO();
				Connection conn = DBConnections.getInstance();
				String sql = "Select * from gb_mst_items WHERE  uom_id =" + id;
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				if (rs.next()) {
					itemsDTO.setItems_id(rs.getInt("items_id"));
					itemsDTO.setItems_group_id(rs.getInt("items_group_id"));
					itemsDTO.setItems_group_category(rs.getInt("items_group_category"));
					itemsDTO.setItem_name(rs.getString("item_name"));
					itemsDTO.setItem_code(rs.getString("item_code"));
					itemsDTO.setItem_description(rs.getString("item_description"));
					itemsDTO.setItem_brand_name(rs.getInt("item_brand_name"));
					itemsDTO.setItem_model_no(rs.getString("item_model_no"));
					itemsDTO.setHsn_code(rs.getString("hsn_code"));
					itemsDTO.setSize(rs.getString("size"));
					itemsDTO.setWarranty(rs.getString("warranty"));
					itemsDTO.setUom_name(rs.getInt("uom_name"));
					itemsDTO.setPrice_per_unit(rs.getString("price_per_unit"));

				}

				Gson gson = new Gson();
				resp.setContentType("application/json");
				resp.getWriter().write(gson.toJson(itemsDTO));

			} catch (Exception e) {
				e.printStackTrace();

			}
		}

		doPost(req, resp);
	}

}
