package School.Mst.Mst_examTypes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import School.Utility.DBConfig;

public class ExamTypesDAO {

    // Get all active exam types
    public List<ExamTypesDTO> getAllExamTypes() {
        List<ExamTypesDTO> list = new ArrayList<>();
        String query = "SELECT * FROM mini_mst_exam_types WHERE is_deleted = 0";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
             
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ExamTypesDTO dto = new ExamTypesDTO();
                dto.setExam_type_id(rs.getInt("exam_type_id"));
                dto.setExam_name(rs.getString("exam_name"));
                list.add(dto);
            }
        } catch (Exception e) {
            System.out.println("getAllExamTypes() error: " + e.getMessage());
        }

        return list;
    }

    // Insert new exam type
    public boolean insertExamType(ExamTypesDTO dto) {
        String query = "INSERT INTO mini_mst_exam_types (exam_name) VALUES (?)";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
             
            ps.setString(1, dto.getExam_name());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("insertExamType() error: " + e.getMessage());
        }
        return false;
    }

    // Get exam type by ID
    public ExamTypesDTO getExamTypesById(int examId) {
        ExamTypesDTO dto = null;
        String query = "SELECT * FROM mini_mst_exam_types WHERE exam_type_id = ?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, examId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                dto = new ExamTypesDTO();
                dto.setExam_type_id(rs.getInt("exam_type_id"));
                dto.setExam_name(rs.getString("exam_name"));
            }

        } catch (Exception e) {
            System.out.println("getExamTypesById() error: " + e.getMessage());
        }

        return dto;
    }

    // Update exam type
    public boolean updateExamType(ExamTypesDTO dto) {
        String query = "UPDATE mini_mst_exam_types SET exam_name = ? WHERE exam_type_id = ?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, dto.getExam_name());
            ps.setInt(2, dto.getExam_type_id());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("updateExamType() error: " + e.getMessage());
        }

        return false;
    }

    // Soft delete exam type
    public boolean deleteExamType(int id) {
        String query = "UPDATE mini_mst_exam_types SET is_deleted = 1 WHERE exam_type_id = ?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("deleteExamType() error: " + e.getMessage());
        }

        return false;
    }

    // Get all soft-deleted exam types
    public List<ExamTypesDTO> getDeletedExamTypes() {
        List<ExamTypesDTO> list = new ArrayList<>();
        String query = "SELECT * FROM mini_mst_exam_types WHERE is_deleted = 1";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ExamTypesDTO dto = new ExamTypesDTO();
                dto.setExam_type_id(rs.getInt("exam_type_id"));
                dto.setExam_name(rs.getString("exam_name"));
                list.add(dto);
            }

        } catch (Exception e) {
            System.out.println("getDeletedExamTypes() error: " + e.getMessage());
        }

        return list;
    }

    // Restore soft-deleted exam type
    public boolean restoreExamType(int id) {
        String query = "UPDATE mini_mst_exam_types SET is_deleted = 0 WHERE exam_type_id = ?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("restoreExamType() error: " + e.getMessage());
        }

        return false;
    }
}
