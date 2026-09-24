package School.trn.trn_students;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import School.Utility.DBConfig;

public class StudentsDAO {

    public boolean insertStudent(StudentsDTO dto) {
        String query = "INSERT INTO mini_trn_students (student_name, class_id, course_id, dob, gender, contact) "
                     + "VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, dto.getStudent_name());
            ps.setInt(2, dto.getClass_id());
            ps.setInt(3, dto.getCourse_id());
            ps.setDate(4, dto.getDob());
            ps.setString(5, dto.getGender());
            ps.setString(6, dto.getContact());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            System.out.println("insertStudent() error: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public StudentsDTO getStudentById(int student_id) {
        StudentsDTO dto = null;
        String query = "SELECT * FROM mini_trn_students WHERE student_id = ? AND is_deleted = 0";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, student_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                dto = new StudentsDTO();
                dto.setStudent_id(rs.getInt("student_id"));
                dto.setStudent_name(rs.getString("student_name"));
                dto.setDob(rs.getDate("dob"));
                dto.setGender(rs.getString("gender"));
                dto.setContact(rs.getString("contact"));
                dto.setClass_id(rs.getInt("class_id"));
                dto.setCourse_id(rs.getInt("course_id"));
            }
        } catch (Exception e) {
            System.out.println("getStudentById() error: " + e.getMessage());
            e.printStackTrace();
        }
        return dto;
    }

    public boolean updateStudent(StudentsDTO dto) {
        if (dto == null || dto.getStudent_id() <= 0 || dto.getStudent_name() == null || dto.getStudent_name().trim().isEmpty()) {
            System.out.println("updateStudent() error: Invalid DTO or missing required fields");
            return false;
        }
        String query = "UPDATE mini_trn_students SET student_name=?, class_id=?, course_id=?, dob=?, gender=?, contact=? "
                     + "WHERE student_id=?";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, dto.getStudent_name());
            ps.setInt(2, dto.getClass_id());
            ps.setInt(3, dto.getCourse_id());
            ps.setDate(4, dto.getDob());
            ps.setString(5, dto.getGender());
            ps.setString(6, dto.getContact());
            ps.setInt(7, dto.getStudent_id());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            System.out.println("updateStudent() error: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteStudent(int student_id) {
        String query = "UPDATE mini_trn_students SET is_deleted = 1 WHERE student_id = ?";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, student_id);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            System.out.println("deleteStudent() error: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public List<StudentsDTO> getDeletedStudents() {
        List<StudentsDTO> list = new ArrayList<>();
        String query = "SELECT s.student_id, s.student_name AS student_name, s.dob, s.gender, s.contact, " +
                       "c.class_id, c.class_name, co.course_id, co.course_name " +
                       "FROM mini_trn_students s " +
                       "JOIN mini_mst_classes c ON c.class_id = s.class_id " +
                       "JOIN mini_mst_courses co ON co.course_id = s.course_id " +
                       "WHERE s.is_deleted = 1";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                StudentsDTO dto = new StudentsDTO();
                dto.setStudent_id(rs.getInt("student_id"));
                dto.setStudent_name(rs.getString("student_name"));
                dto.setDob(rs.getDate("dob"));
                dto.setGender(rs.getString("gender"));
                dto.setContact(rs.getString("contact"));
                dto.setClass_id(rs.getInt("class_id"));
                dto.setClass_name(rs.getString("class_name"));
                dto.setCourse_id(rs.getInt("course_id"));
                dto.setCourse_name(rs.getString("course_name"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean restoreStudent(int student_id) {
        String query = "UPDATE mini_trn_students SET is_deleted = 0 WHERE student_id = ?";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, student_id);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            System.out.println("restoreStudent() error: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public List<StudentsDTO> getSearchedStudents(String queryStr, Integer classId, Integer courseId, int currentPage, int rowsPerPage, String sortColumn) {
        List<StudentsDTO> list = new ArrayList<>();
        StringBuilder subQuery = new StringBuilder();
        List<String> params = new ArrayList<>();

        if (queryStr != null && !queryStr.trim().isEmpty()) {
            String like = "%" + queryStr.trim() + "%";
            subQuery.append(" AND (s.student_name LIKE ? OR s.contact LIKE ?)");
            params.add(like);
            params.add(like);
        }
        if (classId != null) {
            subQuery.append(" AND c.class_id = ?");
            params.add(String.valueOf(classId));
        }
        if (courseId != null) {
            subQuery.append(" AND co.course_id = ?");
            params.add(String.valueOf(courseId));
        }

        int offset = (currentPage - 1) * rowsPerPage;

        String sql = "SELECT student_id, s.student_name AS student_name, s.dob, s.gender, s.contact, " +
                     "c.class_id, c.class_name, co.course_id, co.course_name " +
                     "FROM mini_trn_students s " +
                     "JOIN mini_mst_courses co ON co.course_id = s.course_id " +
                     "JOIN mini_mst_classes c ON c.class_id = s.class_id " +
                     "WHERE 1=1 " + subQuery.toString() +
                     " AND s.is_deleted = 0 AND c.is_deleted = 0 AND co.is_deleted = 0 " +
                     "ORDER BY " + sortColumn + " ASC " +
                     "LIMIT ?, ?";

        System.out.println("SQL: " + sql);

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            int paramIndex = 1;
            for (String param : params) {
                ps.setString(paramIndex++, param);
            }
            ps.setInt(paramIndex++, offset);
            ps.setInt(paramIndex, rowsPerPage);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                StudentsDTO dto = new StudentsDTO();
                dto.setStudent_id(rs.getInt("student_id"));
                dto.setStudent_name(rs.getString("student_name"));
                dto.setDob(rs.getDate("dob"));
                dto.setGender(rs.getString("gender"));
                dto.setContact(rs.getString("contact"));
                dto.setClass_id(rs.getInt("class_id"));
                dto.setClass_name(rs.getString("class_name"));
                dto.setCourse_id(rs.getInt("course_id"));
                dto.setCourse_name(rs.getString("course_name"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getSearchedStudentsCount(String queryStr, Integer classId, Integer courseId) {
        int count = 0;
        StringBuilder subQuery = new StringBuilder();
        List<String> params = new ArrayList<>();

        if (queryStr != null && !queryStr.trim().isEmpty()) {
            String like = "%" + queryStr.trim() + "%";
            subQuery.append(" AND (s.student_name LIKE ? OR s.contact LIKE ?)");
            params.add(like);
            params.add(like);
        }
        if (classId != null) {
            subQuery.append(" AND c.class_id = ?");
            params.add(String.valueOf(classId));
        }
        if (courseId != null) {
            subQuery.append(" AND co.course_id = ?");
            params.add(String.valueOf(courseId));
        }

        String sql = "SELECT COUNT(*) AS total FROM mini_trn_students s " +
                     "JOIN mini_mst_courses co ON co.course_id = s.course_id " +
                     "JOIN mini_mst_classes c ON c.class_id = s.class_id " +
                     "WHERE 1=1 " + subQuery.toString() +
                     " AND s.is_deleted = 0 AND c.is_deleted = 0 AND co.is_deleted = 0";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            int paramIndex = 1;
            for (String param : params) {
                ps.setString(paramIndex++, param);
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean checkContact(String contact) {
        String sql = "SELECT contact FROM mini_trn_students WHERE contact = ? AND is_deleted = 0";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, contact);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}