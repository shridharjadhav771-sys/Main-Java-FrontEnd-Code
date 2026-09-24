package School.Mst.Mst_subjects;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import School.Utility.DBConfig;

public class SubjectsDAO {

    // Get all non-deleted subjects
    public List<SubjectsDTO> getAllSubjects() {
        List<SubjectsDTO> list = new ArrayList<>();
        String query = "SELECT * FROM mini_mst_subjects WHERE is_deleted = 0";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SubjectsDTO dto = new SubjectsDTO();
                dto.setSubject_id(rs.getInt("subject_id"));
                dto.setSubject_name(rs.getString("subject_name"));
                list.add(dto);
            }

        } catch (Exception e) {
            System.out.println("getAllSubjects() error: " + e.getMessage());
        }

        return list;
    }

    // Insert new subject
    public boolean insertSubject(SubjectsDTO dto) {
        String query = "INSERT INTO mini_mst_subjects (subject_name) VALUES (?)";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, dto.getSubject_name());
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("insertSubject() error: " + e.getMessage());
        }

        return false;
    }

    // Get subject by ID
    public SubjectsDTO getSubjectById(int subjectId) {
        SubjectsDTO dto = null;
        String query = "SELECT * FROM mini_mst_subjects WHERE subject_id = ?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, subjectId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                dto = new SubjectsDTO();
                dto.setSubject_id(rs.getInt("subject_id"));
                dto.setSubject_name(rs.getString("subject_name"));
            }

        } catch (Exception e) {
            System.out.println("getSubjectById() error: " + e.getMessage());
        }

        return dto;
    }

    // Update subject
    public boolean updateSubject(SubjectsDTO dto) {
        String query = "UPDATE mini_mst_subjects SET subject_name = ? WHERE subject_id = ?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, dto.getSubject_name());
            ps.setInt(2, dto.getSubject_id());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("updateSubject() error: " + e.getMessage());
        }

        return false;
    }

    // Soft delete subject
    public boolean deleteSubject(int subjectId) {
        String query = "UPDATE mini_mst_subjects SET is_deleted = 1 WHERE subject_id = ?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, subjectId);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("deleteSubject() error: " + e.getMessage());
        }

        return false;
    }

    // Get all soft-deleted subjects
    public List<SubjectsDTO> getDeletedSubjects() {
        List<SubjectsDTO> list = new ArrayList<>();
        String query = "SELECT * FROM mini_mst_subjects WHERE is_deleted = 1";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SubjectsDTO dto = new SubjectsDTO();
                dto.setSubject_id(rs.getInt("subject_id"));
                dto.setSubject_name(rs.getString("subject_name"));
                list.add(dto);
            }

        } catch (Exception e) {
            System.out.println("getDeletedSubjects() error: " + e.getMessage());
        }

        return list;
    }

    // Restore soft-deleted subject
    public boolean restoreSubject(int subjectId) {
        String query = "UPDATE mini_mst_subjects SET is_deleted = 0 WHERE subject_id = ?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, subjectId);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("restoreSubject() error: " + e.getMessage());
        }

        return false;
    }
}
