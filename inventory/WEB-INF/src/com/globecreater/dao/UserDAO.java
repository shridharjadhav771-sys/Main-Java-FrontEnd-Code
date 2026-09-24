package com.globecreater.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.common.DBConnections;
import com.globecreater.dto.UserDTO;

public class UserDAO {

	//Method to get logged in user details
	public UserDTO getLoggedInUser(String userName, String password) {
		try {
			Connection conn = DBConnections.getInstance();
			String sql = "select * from gb_users where username = ? and password = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				UserDTO userDTO = new UserDTO();
				userDTO.setId(rs.getInt("id"));
				userDTO.setFirstName(rs.getString("first_name"));
				userDTO.setLastName(rs.getString("last_name"));
				userDTO.setUserRole(rs.getString("user_role"));
				
				return userDTO;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
