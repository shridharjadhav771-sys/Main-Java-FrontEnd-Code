package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.UserDTO;
import utility.DBConnection;

public class UserDAO {

	public List<UserDTO> getAllUsers() {
		List<UserDTO> users = new ArrayList();
		String sql = "SELECT * FROM users WHERE is_deleted = 0";
		try (Connection conn = DBConnection.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				UserDTO user = new UserDTO();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setRole(rs.getString("role"));
				users.add(user);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}

	public UserDTO getUserByid(int id) {
		UserDTO user = null;
		String sql = "SELECT * FROM users WHERE id = ? AND is_deleted = 0";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setInt(1, id);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					user = new UserDTO();
					user.setId(rs.getInt("id"));
					user.setUsername(rs.getString("username"));
					user.setEmail(rs.getString("email"));
					user.setRole(rs.getString("role"));

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public boolean insertUser(UserDTO user) {
		String sql = "INSERT INTO users (username, password, email, role) VALUES (?, ?, ?, ?)";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getRole());
			int rows = ps.executeUpdate();
			return rows > 0; 
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateUser(UserDTO user) {
		String sql = "UPDATE users SET username = ?, password = ?, email = ?, role = ? WHERE id = ? AND is_deleted = 0";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getRole());
			ps.setInt(5, user.getId());
			int rows = ps.executeUpdate();
			return rows > 0; 
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean softDeleteUser(int id) {
		String sql = "UPDATE users SET is_deleted = 1 WHERE id = ? AND is_deleted = 0";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, id);
			int rows = ps.executeUpdate();
			return rows > 0; 
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public UserDTO login(String username, String password) {
		UserDTO user = null;
		String sql = "SELECT * FROM users WHERE username = ? AND password = ? AND is_deleted = 0";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, username);
			ps.setString(2, password);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					user = new UserDTO();
					user.setId(rs.getInt("id"));
					user.setUsername(rs.getString("username"));
					user.setEmail(rs.getString("email"));
					user.setRole(rs.getString("role"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public boolean updateUserWithoutPassword(UserDTO user) {
	    String sql = "UPDATE users SET username = ?, email = ?, role = ? WHERE id = ? AND is_deleted = 0";
	    try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setString(1, user.getUsername());
	        ps.setString(2, user.getEmail());
	        ps.setString(3, user.getRole());
	        ps.setInt(4, user.getId());
	        return ps.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

}