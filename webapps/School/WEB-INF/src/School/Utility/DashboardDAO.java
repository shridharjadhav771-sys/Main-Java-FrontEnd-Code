package School.Utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DashboardDAO {
	

    // Total Students
    public int getTotalStudents() {
        String sql = "SELECT COUNT(*) as total FROM mini_trn_students WHERE is_deleted = 0";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt("total");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Total Faculty
    public int getTotalTeachers() {
        String sql = "SELECT COUNT(*) as total FROM mini_trn_teachers WHERE is_deleted = 0";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt("total");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Active Courses
    public int getTotalCourses() {
        String sql = "SELECT COUNT(*) as total FROM mini_mst_courses WHERE is_deleted = 0";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt("total");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Departments
    public int getTotalDepartments() {
        String sql = "SELECT COUNT(*) as total FROM mini_mst_departments WHERE is_deleted = 0";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt("total");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
