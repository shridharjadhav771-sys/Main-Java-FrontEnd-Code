package School.trn.trn_marks;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import School.Utility.DBConfig;

public class MarksDAO {

	public MarksDTO getMarkById(int id) {
		MarksDTO dto = null;
		String query = "SELECT m.mark_id, m.student_id, s.name, m.subject_id, sub.subject_name, " +
                "m.exam_type_id, ex.exam_name, m.marks, m.is_deleted FROM mini_trn_marks m " +
                "JOIN mini_trn_students s ON s.student_id = m.student_id " +
                "JOIN mini_mst_subjects sub ON sub.subject_id = m.subject_id " +
                "JOIN mini_mst_exam_types ex ON ex.exam_type_id = m.exam_type_id " +
                "WHERE m.mark_id = ?";

		try (Connection con = DBConfig.getConnection();
			 PreparedStatement ps = con.prepareStatement(query)) {
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				dto = new MarksDTO();
				dto.setMark_id(rs.getInt("mark_id"));
				dto.setStudent_id(rs.getInt("student_id"));
				dto.setName(rs.getString("name"));
				dto.setSubject_id(rs.getInt("subject_id"));
				dto.setSubject_name(rs.getString("subject_name"));
				dto.setExam_type_id(rs.getInt("exam_type_id"));
				dto.setExam_name(rs.getString("exam_name"));
				dto.setMarks(rs.getDouble("marks"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	public boolean insertMarks(MarksDTO dto) {
		String query = "INSERT INTO mini_trn_marks (student_id, subject_id, exam_type_id, marks) VALUES (?, ?, ?, ?)";
		try (Connection con = DBConfig.getConnection();
			 PreparedStatement ps = con.prepareStatement(query)) {
			ps.setInt(1, dto.getStudent_id());
			ps.setInt(2, dto.getSubject_id());
			ps.setInt(3, dto.getExam_type_id());
			ps.setDouble(4, dto.getMarks());
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/*
	public List<MarksDTO> getAllMarks() {
	    List<MarksDTO> list = new ArrayList<>();
	    String query = "SELECT m.mark_id, m.student_id, s.name, m.subject_id, sub.subject_name, " +
	                   "m.exam_type_id, ex.exam_name, m.marks, m.is_deleted " +
	                   "FROM mini_trn_marks m " +
	                   "JOIN mini_trn_students s ON s.student_id = m.student_id " +
	                   "JOIN mini_mst_subjects sub ON sub.subject_id = m.subject_id " +
	                   "JOIN mini_mst_exam_types ex ON ex.exam_type_id = m.exam_type_id " +
	                   "WHERE m.is_deleted = 0 AND s.is_deleted = 0 AND sub.is_deleted = 0 AND ex.is_deleted = 0";

	    try (Connection con = DBConfig.getConnection();
	         PreparedStatement ps = con.prepareStatement(query)) {

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            MarksDTO dto = new MarksDTO();
	            dto.setMark_id(rs.getInt("mark_id"));
	            dto.setStudent_id(rs.getInt("student_id"));
	            dto.setName(rs.getString("name"));
	            dto.setSubject_id(rs.getInt("subject_id"));
	            dto.setSubject_name(rs.getString("subject_name"));
	            dto.setExam_type_id(rs.getInt("exam_type_id"));
	            dto.setExam_name(rs.getString("exam_name"));
	            dto.setMarks(rs.getDouble("marks"));
	            list.add(dto);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}

*/

	public List<MarksDTO> getDeletedMarks() {
		List<MarksDTO> list = new ArrayList<>();
		String query = "SELECT m.mark_id, m.student_id, s.name, m.subject_id, sub.subject_name, " +
                "m.exam_type_id, ex.exam_name, m.marks, m.is_deleted FROM mini_trn_marks m " +
                "JOIN mini_trn_students s ON s.student_id = m.student_id " +
                "JOIN mini_mst_subjects sub ON sub.subject_id = m.subject_id " +
                "JOIN mini_mst_exam_types ex ON ex.exam_type_id = m.exam_type_id " +
                "WHERE m.is_deleted = 1";
		try (Connection con = DBConfig.getConnection();
			 PreparedStatement ps = con.prepareStatement(query)) {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MarksDTO dto = new MarksDTO();
				dto.setMark_id(rs.getInt("mark_id"));
				dto.setStudent_id(rs.getInt("student_id"));
				dto.setName(rs.getString("name"));
				dto.setSubject_id(rs.getInt("subject_id"));
				dto.setSubject_name(rs.getString("subject_name"));
				dto.setExam_type_id(rs.getInt("exam_type_id"));
				dto.setExam_name(rs.getString("exam_name"));
				dto.setMarks(rs.getDouble("marks"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean updateMarks(MarksDTO dto) {
		String query = "UPDATE mini_trn_marks SET student_id=?, subject_id=?, exam_type_id=?, marks=? WHERE mark_id=?";
		try (Connection con = DBConfig.getConnection();
			 PreparedStatement ps = con.prepareStatement(query)) {
			ps.setInt(1, dto.getStudent_id());
			ps.setInt(2, dto.getSubject_id());
			ps.setInt(3, dto.getExam_type_id());
			ps.setDouble(4, dto.getMarks());
			ps.setInt(5, dto.getMark_id());
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteMarks(int id) {
		String query = "UPDATE mini_trn_marks SET is_deleted = 1 WHERE mark_id = ?";
		try (Connection con = DBConfig.getConnection();
			 PreparedStatement ps = con.prepareStatement(query)) {
			ps.setInt(1, id);
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean restoreMarks(int id) {
		String query = "UPDATE mini_trn_marks SET is_deleted = 0 WHERE mark_id = ?";
		try (Connection con = DBConfig.getConnection();
			 PreparedStatement ps = con.prepareStatement(query)) {
			ps.setInt(1, id);
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<MarksDTO> getSearchedMarks(String query, Integer subjectId, Integer examTypeId, int currentPage, int rowsPerPage) {
		// TODO Auto-generated method stub
		 List<MarksDTO> list = new ArrayList<>();
		 try {
			 String subQuery = "";
			 if(!"".equals(query)) {
				 subQuery += " and (s.name like '%"+ query +"%')";
			 }
			 
			 if(subjectId != null) {
				 subQuery += " and sub.subject_id = "+ subjectId;
			 }
			 
			 if(examTypeId != null) {
				 subQuery += " and ex.exam_type_id = "+ examTypeId;
			 }
			 int offset = (currentPage -1) *  rowsPerPage;
			 
			 String sql = "SELECT m.mark_id, m.student_id, s.name, m.subject_id, sub.subject_name, " +
	                   "m.exam_type_id, ex.exam_name, m.marks, m.is_deleted " +
	                   "FROM mini_trn_marks m " +
	                   "JOIN mini_trn_students s ON s.student_id = m.student_id " +
	                   "JOIN mini_mst_subjects sub ON sub.subject_id = m.subject_id " +
	                   "JOIN mini_mst_exam_types ex ON ex.exam_type_id = m.exam_type_id " +
	                   "WHERE 1=1 " + subQuery +" and m.is_deleted = 0 AND s.is_deleted = 0 AND sub.is_deleted = 0 AND ex.is_deleted = 0 order by m.mark_id limit "+ offset + "," + rowsPerPage;
			 System.out.println("SQL: "+sql);
			 try (Connection con = DBConfig.getConnection();
			         PreparedStatement ps = con.prepareStatement(sql)){
				 ResultSet rs = ps.executeQuery();
			        while (rs.next()) {
			        	MarksDTO dto = new MarksDTO();
						dto.setMark_id(rs.getInt("mark_id"));
						dto.setStudent_id(rs.getInt("student_id"));
						dto.setName(rs.getString("name"));
						dto.setSubject_id(rs.getInt("subject_id"));
						dto.setSubject_name(rs.getString("subject_name"));
						dto.setExam_type_id(rs.getInt("exam_type_id"));
						dto.setExam_name(rs.getString("exam_name"));
						dto.setMarks(rs.getDouble("marks"));
						list.add(dto);
			        }
			 }catch (Exception e) {
				// TODO: handle exception
				 e.printStackTrace();
			}
		 }catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
		}
		return list;
	}
}
