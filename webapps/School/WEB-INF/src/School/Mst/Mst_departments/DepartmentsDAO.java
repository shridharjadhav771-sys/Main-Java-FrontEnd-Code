package School.Mst.Mst_departments;

import School.Utility.DBConfig;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DepartmentsDAO {

    public List<DepartmentsDTO> getAllDepartments() {
        List<DepartmentsDTO> list = new ArrayList<>();
        String query = "SELECT * FROM mini_mst_departments WHERE is_deleted = 0";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DepartmentsDTO dto = new DepartmentsDTO();
                dto.setDept_id(rs.getInt("dept_id"));
                dto.setDept_name(rs.getString("dept_name"));
                list.add(dto);
            }
        } catch (Exception e) {
            System.out.println("Error in getAllDepartments: " + e.getMessage());
        }
        return list;
    }

    public boolean insertDept(DepartmentsDTO dto) {
        String query = "INSERT INTO mini_mst_departments (dept_name, is_deleted) VALUES (?, 0)";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, dto.getDept_name());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            System.out.println("Error in insertDept: " + e.getMessage());
        }
        return false;
    }

    public DepartmentsDTO getDeptById(int dept_id) {
        DepartmentsDTO dto = null;
        String query = "SELECT * FROM mini_mst_departments WHERE dept_id = ?";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, dept_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                dto = new DepartmentsDTO();
                dto.setDept_id(rs.getInt("dept_id"));
                dto.setDept_name(rs.getString("dept_name"));
            }
        } catch (Exception e) {
            System.out.println("Error in getDeptById: " + e.getMessage());
        }
        return dto;
    }

    public boolean updateDept(DepartmentsDTO dto) {
        String query = "UPDATE mini_mst_departments SET dept_name = ? WHERE dept_id = ?";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, dto.getDept_name());
            ps.setInt(2, dto.getDept_id());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            System.out.println("Error in updateDept: " + e.getMessage());
        }
        return false;
    }

    public boolean deleteDept(int dept_id) {
        String query = "UPDATE mini_mst_departments SET is_deleted = 1 WHERE dept_id = ?";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, dept_id);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            System.out.println("Error in deleteDept: " + e.getMessage());
        }
        return false;
    }

    public List<DepartmentsDTO> getDeletedDepts() {
        List<DepartmentsDTO> list = new ArrayList<>();
        String query = "SELECT * FROM mini_mst_departments WHERE is_deleted = 1";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DepartmentsDTO dto = new DepartmentsDTO();
                dto.setDept_id(rs.getInt("dept_id"));
                dto.setDept_name(rs.getString("dept_name"));
                list.add(dto);
            }
        } catch (Exception e) {
            System.out.println("Error in getDeletedDepts: " + e.getMessage());
        }
        return list;
    }

    public boolean restoreDept(int dept_id) {
        String query = "UPDATE mini_mst_departments SET is_deleted = 0 WHERE dept_id = ?";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, dept_id);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            System.out.println("Error in restoreDept: " + e.getMessage());
        }
        return false;
    }
}
