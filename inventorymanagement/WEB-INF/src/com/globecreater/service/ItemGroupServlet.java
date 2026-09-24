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
import com.google.gson.Gson;

@WebServlet("/items")
public class ItemGroupServlet extends HttpServlet {

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String action = req.getParameter("action");
	    ItemGroupDAO dao = new ItemGroupDAO();

	    if (action.equalsIgnoreCase("insert")) {
	        String company_id = "1";
	        String item_group_name = req.getParameter("item_group_name");
	        String item_group_code = req.getParameter("item_group_code"); // New field
	        ItemGroupDTO dto = new ItemGroupDTO();
	        dto.setCompany_id(Integer.parseInt(company_id));
	        dto.setItem_group_name(item_group_name);
	        dto.setItem_group_code(item_group_code); // Set item_group_code
	        try {
	            Connection con = DBConnections.getInstance();

	            if (con != null) {
	                System.out.println("Insert Data Operation Done Successfully");

	                PreparedStatement pstnt = con.prepareStatement(
	                        "INSERT INTO gb_mst_item_group (company_id, item_group_name, item_group_code) VALUES (?, ?, ?)");
	                pstnt.setString(1, company_id);
	                pstnt.setString(2, item_group_name);
	                pstnt.setString(3, item_group_code); // Insert item_group_code
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
	        String company_id = "1";
	        String item_group_name = req.getParameter("item_group_name");
	        String item_group_code = req.getParameter("item_group_code"); // New field
	        String item_group_id = req.getParameter("item_group_id");

	        try {
	            Connection con = DBConnections.getInstance();
	            if (con != null) {
	                PreparedStatement pstnt = con.prepareStatement(
	                        "UPDATE gb_mst_item_group SET item_group_name = ?, item_group_code = ? WHERE item_group_id = ? AND company_id = ?");
	                pstnt.setString(1, item_group_name);
	                pstnt.setString(2, item_group_code); // Update item_group_code
	                pstnt.setString(3, item_group_id);
	                pstnt.setString(4, company_id);
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
	                        .prepareStatement("UPDATE gb_mst_item_group set is_deleted=1 WHERE item_group_id = ?");
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

	        String searchItemGroup = req.getParameter("searchItemGroup");
	        System.out.println("Inside display action");
	        try {
	            List<ItemGroupDTO> contactlist = new ArrayList<ItemGroupDTO>();
	            String str = "";

	            if (searchItemGroup != null && !searchItemGroup.isEmpty()) {
	                str += " AND (company_id LIKE '%" + searchItemGroup + "%' OR item_group_name LIKE '%"
	                        + searchItemGroup + "%' OR item_group_code LIKE '%" + searchItemGroup + "%')"; // Search by code too
	            }

	            Connection conn = DBConnections.getInstance();
	            String sql = "Select * from gb_mst_item_group WHERE is_deleted=0" + str;
	            System.out.println(sql);
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            ResultSet rs = pstmt.executeQuery();
	            while (rs.next()) {
	                ItemGroupDTO itemGroupDTO = new ItemGroupDTO();
	                itemGroupDTO.setCompany_id(rs.getInt("company_id"));
	                itemGroupDTO.setItem_group_name(rs.getString("item_group_name"));
	                itemGroupDTO.setItem_group_code(rs.getString("item_group_code")); // Fetch the item_group_code
	                itemGroupDTO.setItem_group_id(rs.getInt("item_group_id"));
	                contactlist.add(itemGroupDTO);
	            }
	            Gson gson = new Gson();
	            resp.setContentType("application/json");
	            resp.getWriter().write(gson.toJson(contactlist));

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    } else if (action.equalsIgnoreCase("getItemGroupById")) {
	        System.out.println("Inside display action");
	        try {
	            String id = req.getParameter("item_id");
	            ItemGroupDTO itemGroupDTO = new ItemGroupDTO();
	            Connection conn = DBConnections.getInstance();
	            String sql = "Select * from gb_mst_item_group WHERE item_group_id=" + id;
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            ResultSet rs = pstmt.executeQuery();
	            if (rs.next()) {
	                itemGroupDTO.setItem_group_name(rs.getString("item_group_name"));
	                itemGroupDTO.setItem_group_code(rs.getString("item_group_code")); // Fetch item_group_code
	            }
	            Gson gson = new Gson();
	            resp.setContentType("application/json");
	            resp.getWriter().write(gson.toJson(itemGroupDTO));

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}
}

