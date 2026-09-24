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
import com.globecreater.dao.ItemGroupDAO;
import com.globecreater.dto.ItemGroupDTO;

@WebServlet("/items")
public class ItemGroupServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		ItemGroupDAO dao = new ItemGroupDAO();

		if (action.equalsIgnoreCase("insert")) {
			String company_id = "1";
			String item_group_name = req.getParameter("item_group_name");
			ItemGroupDTO dto = new ItemGroupDTO();
			dto.setCompany_id(Integer.parseInt(company_id));
			dto.setItem_group_name(item_group_name);
			try {
				Connection con = DBConnections.getInstance();

				if (con != null) {
					System.out.println("Insert Data Operation Done Successfully");

					PreparedStatement pstnt = con.prepareStatement(
							"INSERT INTO gb_mst_item_group (company_id, item_group_name) VALUES (?, ?)");
					pstnt.setString(1, company_id);
					pstnt.setString(2, item_group_name);
					pstnt.execute();
				} else {
					System.out.println("Insert Data Operation failed ....please check the code");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			resp.setContentType("text/plain");
			resp.getWriter().write("Success");
		}

		else if (action.equalsIgnoreCase("update")) {
			String company_id = req.getParameter("company_id");
			String item_group_name = req.getParameter("item_group_name");
			String item_group_id = req.getParameter("item_group_id");

			try {
				Connection con = DBConnections.getInstance();
				if (con != null) {
					PreparedStatement pstnt = con.prepareStatement(
							"UPDATE gb_mst_item_group SET item_group_name = ? WHERE item_group_id = ? AND company_id = ?");
					pstnt.setString(1, item_group_name);
					pstnt.setString(2, item_group_id);
					pstnt.setString(3, company_id);
					pstnt.executeUpdate();
					System.out.println("Update Operation Done Successfully");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			resp.setContentType("text/plain");
			resp.getWriter().write("Update Success");
		}

		else if (action.equalsIgnoreCase("delete")) {
			String item_group_id = req.getParameter("item_group_id");

			try {
				Connection con = DBConnections.getInstance();
				if (con != null) {
					PreparedStatement pstnt = con
							.prepareStatement("DELETE FROM gb_mst_item_group WHERE item_group_id = ?");
					pstnt.setString(1, item_group_id);
					pstnt.executeUpdate();
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
			System.out.println("Inside display action");
			try {
				List<ItemGroupDTO> contactlist = new ArrayList<ItemGroupDTO>();

				Connection conn = DBConnections.getInstance();
				String sql = "Select * from gb_mst_item_group";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					ItemGroupDTO itemGroupDTO = new ItemGroupDTO();
					itemGroupDTO.setCompany_id(rs.getInt("company_id"));
					itemGroupDTO.setItem_group_name(rs.getString("item_group_name"));
					itemGroupDTO.setItem_group_id(rs.getInt("item_group_id"));
					contactlist.add(itemGroupDTO);
				}

				resp.setContentType("application/json");
				resp.getWriter().write(contactlist.toString());

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
