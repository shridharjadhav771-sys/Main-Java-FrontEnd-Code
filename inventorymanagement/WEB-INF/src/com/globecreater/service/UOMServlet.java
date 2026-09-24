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
import com.globecreater.dao.UomDAO;
import com.globecreater.dto.UomDTO;
import com.google.gson.Gson;

@WebServlet("/UnitofMeasurement")
public class UOMServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");
		UomDAO dao = new UomDAO();

		if (action.equalsIgnoreCase("insert")) {
			String uomName = req.getParameter("name");
			String uomSymbol = req.getParameter("symbol");
			UomDTO dto = new UomDTO();
			dto.setUomName(uomName);
			dto.setUomSymbol(uomSymbol);
			try {
				Connection con = DBConnections.getInstance();

				if (con != null) {
					System.out.println("Insert Data Operation Done Successfully");

					PreparedStatement pstnt = con
							.prepareStatement("INSERT INTO gb_mst_uom(uomName,uomSymbol,is_deleted) VALUES (?,?,0)");

					pstnt.setString(1, uomName);
					pstnt.setString(2, uomSymbol);
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

			String uomId = req.getParameter("uomid");
			String uomName = req.getParameter("name");
			String uomSymbol = req.getParameter("symbol");

			try {
				Connection con = DBConnections.getInstance();

				if (con != null) {
					PreparedStatement pstnt = con
							.prepareStatement("UPDATE gb_mst_uom SET uomName = ?,uomSymbol = ? WHERE uom_id = ?");

					pstnt.setString(1, uomName);
					pstnt.setString(2, uomSymbol);
					pstnt.setString(3, uomId);
					pstnt.executeUpdate();
					System.out.println("Update Operation Done SucessFully");

				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			resp.setContentType("text/plain");
			resp.getWriter().write("Update Success");

		} else if (action.equalsIgnoreCase("delete")) {
			String uom_id = req.getParameter("uom_id");

			try {
				Connection con = DBConnections.getInstance();
				if (con != null) {
					PreparedStatement pstnt = con
							.prepareStatement("UPDATE gb_mst_uom set is_deleted=1 WHERE uom_id = ?");
					pstnt.setString(1, uom_id);
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

			String searchUom = req.getParameter("searchUom");
			System.out.println("Inside display action");
			try {
				List<UomDTO> uomlist = new ArrayList<UomDTO>();
				String str = "";
				if (searchUom != null && !searchUom.isEmpty()) {
					str += " AND (uomName LIKE '%" + searchUom + "%' OR uomSymbol LIKE '%" + searchUom + "%')";
				}

				Connection conn = DBConnections.getInstance();
				String sql = "Select * from gb_mst_uom WHERE is_deleted=0" + str;
				System.out.println(sql);
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {

					UomDTO uomDTO = new UomDTO();
					uomDTO.setUom_id(rs.getInt("uom_id"));
					uomDTO.setUomName(rs.getString("uomName"));
					uomDTO.setUomSymbol(rs.getString("uomSymbol"));

					uomlist.add(uomDTO);
				}
				Gson gson = new Gson();
				resp.setContentType("application/json");
				resp.getWriter().write(gson.toJson(uomlist));

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (action.equalsIgnoreCase("getbyid")) {
			System.out.println("Inside display action");
			try {
				String id = req.getParameter("item_id");
				UomDTO uomDTO = new UomDTO();
				Connection conn = DBConnections.getInstance();
				String sql = "Select * from gb_mst_uom WHERE  uom_id =" + id;
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				if (rs.next()) {
					uomDTO.setUom_id(rs.getInt("uom_id"));
					uomDTO.setUomName(rs.getString("uomName"));
					uomDTO.setUomSymbol(rs.getString("uomSymbol"));

				}
				Gson gson = new Gson();
				resp.setContentType("application/json");
				resp.getWriter().write(gson.toJson(uomDTO));

			} catch (Exception e) {
				e.printStackTrace();

			}
		}
		doPost(req, resp);
	}

}
