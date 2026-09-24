package com.globecreater.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.common.DBConnections;
import com.globecreater.dto.ItemGroupDTO;
import com.globecreater.dto.UserDTO;

public class ItemGroupDAO {

	public ItemGroupDTO getItemGroup(int companyId, String itemGroupName) {
		ItemGroupDTO itemGroup = null;

		String sql = "SELECT * FROM gb_mst_item_group WHERE company_id = ? AND item_group_name = ?";

		try {
			Connection conn = DBConnections.getInstance();
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, companyId);
			pstmt.setString(2, itemGroupName);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				ItemGroupDTO itemGroup1 = new ItemGroupDTO();
				itemGroup1.setId(rs.getInt("id"));
				itemGroup1.setCompany_id(rs.getInt("company_id"));
				itemGroup1.setItem_group_name(rs.getString("item_group_name"));

				return itemGroup;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public boolean insertItemDetails1(ItemGroupDTO dto) {
		boolean isInserted = false;

		String sql = "INSERT INTO gb_mst_item_group (company_id, item_group_name) VALUES (?, ?)";

		try (Connection conn = DBConnections.getInstance(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, dto.getCompany_id());
			pstmt.setString(2, dto.getItem_group_name());

			int rowsAffected = pstmt.executeUpdate();
			if (rowsAffected > 0) {
				isInserted = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isInserted;
	}

	public boolean insertItemDetails(ItemGroupDTO dto) {

		return false;
	}

	public ItemGroupDAO getLoggedInUser(int item_group_id, int company_id, String item_group_name) {

		return null;
	}

	public boolean updateItemGroup(ItemGroupDTO dto) {
		boolean isUpdated = false;

		String sql = "UPDATE gb_mst_item_group SET item_group_name = ? WHERE id = ?";

		try (Connection conn = DBConnections.getInstance(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, dto.getItem_group_name());
			pstmt.setInt(2, dto.getCompany_id());

			int rowsAffected = pstmt.executeUpdate();
			if (rowsAffected > 0) {
				isUpdated = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isUpdated;
	}

	public boolean deleteItemGroup(int id) {
		boolean isDeleted = false;

		String sql = "DELETE FROM gb_mst_item_group WHERE id = ?";

		try (Connection conn = DBConnections.getInstance(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, id);

			int rowsAffected = pstmt.executeUpdate();
			if (rowsAffected > 0) {
				isDeleted = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isDeleted;
	}
}
