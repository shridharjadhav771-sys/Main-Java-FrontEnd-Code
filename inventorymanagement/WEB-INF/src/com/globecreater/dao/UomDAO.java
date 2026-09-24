package com.globecreater.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.common.DBConnections;

import com.globecreater.dto.UomDTO;

public class UomDAO {

	public UomDTO getUomList(int uom_id, String uomName, String uomSymbol) {

		UomDTO UomList = null;

		String sql = "SELECT * FROM gb_mst_uom WHERE uomName = ? AND uomSymbol = ?";

		try {
			Connection conn = DBConnections.getInstance();
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, uomName);
			pstmt.setString(2, uomSymbol);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				UomDTO UomList1 = new UomDTO();
				UomList1.setUom_id(rs.getInt("id"));
				UomList1.setUomName(rs.getString("uomName"));
				UomList1.setUomSymbol(rs.getString("uomSymbol"));

				return UomList;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return UomList;

	}

	public boolean createUom(String uomName, String uomSymbol) {
		String sql = "INSERT INTO gb_mst_uom (uomName, uomSymbol) VALUES (?, ?)";

		try (Connection conn = DBConnections.getInstance(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, uomName);
			pstmt.setString(2, uomSymbol);

			int rowsAffected = pstmt.executeUpdate();
			return rowsAffected > 0;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateUom(int uomId, String uomName, String uomSymbol) {
		String sql = "UPDATE gb_mst_uom SET uomName = ?, uomSymbol = ? WHERE id = ?";

		try (Connection conn = DBConnections.getInstance(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, uomName);
			pstmt.setString(2, uomSymbol);
			pstmt.setInt(3, uomId);

			int rowsAffected = pstmt.executeUpdate();
			return rowsAffected > 0;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteUom(int uomId) {
		String sql = "DELETE FROM gb_mst_uom WHERE id = ?";

		try (Connection conn = DBConnections.getInstance(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, uomId);

			int rowsAffected = pstmt.executeUpdate();
			return rowsAffected > 0;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}