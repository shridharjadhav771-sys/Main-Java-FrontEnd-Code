package School.Mst.Mst_user_role;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import School.Utility.DBConfig;

public class UserRolesDAO {

    // Get all active user roles
    public List<UserRolesDTO> getAllUserRoles() {
        List<UserRolesDTO> list = new ArrayList<>();
        String query = "SELECT * FROM mini_mst_user_roles WHERE is_deleted = 0";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                UserRolesDTO dto = new UserRolesDTO();
                dto.setRole_id(rs.getInt("role_id"));
                dto.setRole_name(rs.getString("role_name"));
                list.add(dto);
            }

        } catch (Exception e) {
            System.out.println("getAllUserRoles() error: " + e.getMessage());
        }

        return list;
    }

    // Insert a new user roles
    public boolean insertUserRole(UserRolesDTO dto) {
        String query = "INSERT INTO mini_mst_user_roles (role_name) VALUES (?)";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, dto.getRole_name());
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("insertUserRole() error: " + e.getMessage());
        }

        return false;
    }

    // Get role by ID
    public UserRolesDTO getUserRoleById(int role_id) {
        UserRolesDTO dto = null;
        String query = "SELECT * FROM mini_mst_user_roles WHERE role_id = ?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, role_id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                dto = new UserRolesDTO();
                dto.setRole_id(rs.getInt("role_id"));
                dto.setRole_name(rs.getString("role_name"));
            }

        } catch (Exception e) {
            System.out.println("getUserRoleById() error: " + e.getMessage());
        }

        return dto;
    }

    // Update role
    public boolean updateUserRole(UserRolesDTO dto) {
        String query = "UPDATE mini_mst_user_roles SET role_name = ? WHERE role_id = ?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, dto.getRole_name());
            ps.setInt(2, dto.getRole_id());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("updateUserRole() error: " + e.getMessage());
        }

        return false;
    }

    // Soft delete role
    public boolean deleteUserRole(int role_id) {
        String query = "UPDATE mini_mst_user_roles SET is_deleted = 1 WHERE role_id = ?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, role_id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("deleteUserRole() error: " + e.getMessage());
        }

        return false;
    }

    // Get all deleted roles
    public List<UserRolesDTO> getDeletedUserRoles() {
        List<UserRolesDTO> list = new ArrayList<>();
        String query = "SELECT * FROM mini_mst_user_roles WHERE is_deleted = 1";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                UserRolesDTO dto = new UserRolesDTO();
                dto.setRole_id(rs.getInt("role_id"));
                dto.setRole_name(rs.getString("role_name"));
                list.add(dto);
            }

        } catch (Exception e) {
            System.out.println("getDeletedUserRoles() error: " + e.getMessage());
        }

        return list;
    }

    // Restore soft-deleted role
    public boolean restoreUserRole(int role_id) {
        String query = "UPDATE mini_mst_user_roles SET is_deleted = 0 WHERE role_id = ?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, role_id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("restoreUserRole() error: " + e.getMessage());
        }

        return false;
    }
}
