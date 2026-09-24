package School.trn.trn_teachers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import School.Utility.DBConfig;

public class TeachersDAO {

    public TeachersDTO getTeacherById(int id) {
        TeachersDTO dto = null;
        String query = "SELECT t.teacher_id, t.name AS teacher_name, t.contact, t.email, " +
                       "dpt.dept_id, dpt.dept_name, dsg.designation_id, dsg.designation_name, t.is_deleted " +
                       "FROM mini_trn_teachers t " +
                       "JOIN mini_mst_departments dpt ON dpt.dept_id = t.dept_id " +
                       "JOIN mini_mst_designations dsg ON dsg.designation_id = t.designation_id " +
                       "WHERE t.teacher_id = ? AND t.is_deleted = 0";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                dto = new TeachersDTO();
                dto.setTeacher_id(rs.getInt("teacher_id"));
                dto.setName(rs.getString("teacher_name"));
                dto.setContact(rs.getString("contact"));
                dto.setEmail(rs.getString("email"));
                dto.setDept_id(rs.getInt("dept_id"));
                dto.setDept_name(rs.getString("dept_name"));
                dto.setDesignation_id(rs.getInt("designation_id"));
                dto.setDesignation_name(rs.getString("designation_name"));
                dto.setIs_deleted(rs.getInt("is_deleted"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }

    public boolean insertTeacher(TeachersDTO dto) {
        String query = "INSERT INTO mini_trn_teachers (name, email, dept_id, designation_id, contact, is_deleted) " +
                       "VALUES (?, ?, ?, ?, ?, 0)";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, dto.getName());
            ps.setString(2, dto.getEmail());
            ps.setInt(3, dto.getDept_id());
            ps.setInt(4, dto.getDesignation_id());
            ps.setString(5, dto.getContact());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateTeacher(TeachersDTO dto) {
        String query = "UPDATE mini_trn_teachers SET name = ?, email = ?, dept_id = ?, designation_id = ?, contact = ? " +
                       "WHERE teacher_id = ?";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, dto.getName());
            ps.setString(2, dto.getEmail());
            ps.setInt(3, dto.getDept_id());
            ps.setInt(4, dto.getDesignation_id());
            ps.setString(5, dto.getContact());
            ps.setInt(6, dto.getTeacher_id());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<TeachersDTO> getDeletedTeachers() {
        List<TeachersDTO> list = new ArrayList<>();
        String query = "SELECT t.teacher_id, t.name AS teacher_name, t.contact, t.email, " +
                       "dpt.dept_id, dpt.dept_name, dsg.designation_id, dsg.designation_name, t.is_deleted " +
                       "FROM mini_trn_teachers t " +
                       "JOIN mini_mst_departments dpt ON dpt.dept_id = t.dept_id " +
                       "JOIN mini_mst_designations dsg ON dsg.designation_id = t.designation_id " +
                       "WHERE t.is_deleted = 1";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TeachersDTO dto = new TeachersDTO();
                dto.setTeacher_id(rs.getInt("teacher_id"));
                dto.setName(rs.getString("teacher_name"));
                dto.setContact(rs.getString("contact"));
                dto.setEmail(rs.getString("email"));
                dto.setDept_id(rs.getInt("dept_id"));
                dto.setDept_name(rs.getString("dept_name"));
                dto.setDesignation_id(rs.getInt("designation_id"));
                dto.setDesignation_name(rs.getString("designation_name"));
                dto.setIs_deleted(rs.getInt("is_deleted"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteTeacherById(int teacher_id) {
        String query = "UPDATE mini_trn_teachers SET is_deleted = 1 WHERE teacher_id = ?";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, teacher_id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean restoreTeacher(int teacher_id) {
        String query = "UPDATE mini_trn_teachers SET is_deleted = 0 WHERE teacher_id = ?";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, teacher_id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<TeachersDTO> getSearchedTeachers(String query, Integer deptId, Integer desigId, int rowsPerPage, int currentPage, String sortColumn) {
        List<TeachersDTO> list = new ArrayList<>();
        try {
            String subQuery = "";

            if (query != null && !"".equals(query)) {
                subQuery += " AND (t.name LIKE '%" + query + "%' OR t.contact LIKE '%" + query + "%' OR t.email LIKE '%" + query + "%')";
            }

            if (deptId != null) {
                subQuery += " AND dpt.dept_id = " + deptId;
            }

            if (desigId != null) {
                subQuery += " AND dsg.designation_id = " + desigId;
            }

            int offset = (currentPage - 1) * rowsPerPage;

            String sql = "SELECT t.teacher_id, t.name AS teacher_name, t.contact, t.email, " +
                         "dpt.dept_id, dpt.dept_name, dsg.designation_id, dsg.designation_name, t.is_deleted " +
                         "FROM mini_trn_teachers t " +
                         "JOIN mini_mst_departments dpt ON dpt.dept_id = t.dept_id " +
                         "JOIN mini_mst_designations dsg ON dsg.designation_id = t.designation_id " +
                         "WHERE 1=1 " + subQuery +
                         " AND t.is_deleted = 0 AND dpt.is_deleted = 0 AND dsg.is_deleted = 0 " +
                         "ORDER BY " + sortColumn + " ASC " +
                         "LIMIT " + offset + ", " + rowsPerPage;

            try (Connection con = DBConfig.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    TeachersDTO dto = new TeachersDTO();
                    dto.setTeacher_id(rs.getInt("teacher_id"));
                    dto.setName(rs.getString("teacher_name"));
                    dto.setContact(rs.getString("contact"));
                    dto.setEmail(rs.getString("email"));
                    dto.setDept_id(rs.getInt("dept_id"));
                    dto.setDept_name(rs.getString("dept_name"));
                    dto.setDesignation_id(rs.getInt("designation_id"));
                    dto.setDesignation_name(rs.getString("designation_name"));
                    dto.setIs_deleted(rs.getInt("is_deleted"));
                    list.add(dto);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public int getSearchedTeachersCount(String query, Integer deptId, Integer desigId) {
        int count = 0;
        String subQuery = "";

        if (query != null && !"".equals(query.trim())) {
            subQuery += " AND (t.name LIKE '%" + query + "%' OR t.contact LIKE '%" + query + "%' OR t.email LIKE '%" + query + "%')";
        }

        if (deptId != null) {
            subQuery += " AND dpt.dept_id = " + deptId;
        }

        if (desigId != null) {
            subQuery += " AND dsg.designation_id = " + desigId;
        }

        String sql = "SELECT COUNT(*) AS total FROM mini_trn_teachers t " +
                     "JOIN mini_mst_departments dpt ON dpt.dept_id = t.dept_id " +
                     "JOIN mini_mst_designations dsg ON dsg.designation_id = t.designation_id " +
                     "WHERE 1=1 " + subQuery +
                     " AND t.is_deleted = 0 AND dpt.is_deleted = 0 AND dsg.is_deleted = 0";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
    
    public boolean checkEmail(String email) {
    	
    	String sql = "SELECT teacher_id FROM mini_trn_teachers where email = '" + email+ "' ";
    	try (Connection con = DBConfig.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
               if (rs.next()) {
                   return true;
               }
           } catch (Exception e) {
               e.printStackTrace();
           }
    	
    	return false;
    }
    
    
    public boolean checkContact(String contact) {
    	String sql = "select contact from mini_trn_teachers where contact = '" + contact+ "' ";
    	try (Connection con = DBConfig.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
               if (rs.next()) {
                   return true;
               }
           } catch (Exception e) {
               e.printStackTrace();
           }
		return false;
    }
}







