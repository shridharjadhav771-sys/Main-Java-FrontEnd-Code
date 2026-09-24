package School.Mst.Mst_Courses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import School.Mst.Mst_Classes.ClassesDTO;
import School.Utility.DBConfig;

public class CoursesDAO {

	public List<CoursesDTO> getAllCourses() {
		List<CoursesDTO> list = new ArrayList<>();
		String query = "select * from mini_mst_courses where is_deleted = 0";
		try(Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query)){
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				CoursesDTO dto = new CoursesDTO();
				dto.setCourse_id(rs.getInt("course_id"));
				dto.setCourse_name(rs.getString("course_name"));
				dto.setCourse_duration(rs.getString("course_duration"));
				list.add(dto);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return list;
	}

	public boolean insertCourse(CoursesDTO dto) {
		boolean status = false;
		String query = "insert into mini_mst_courses (course_name, course_duration) values (?,?)";
		try(Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, dto.getCourse_name());
			ps.setString(2, dto.getCourse_duration());
			ps.executeUpdate();
			status = true;
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return status;
	}

	public CoursesDTO getCourseById(int course_id) {
		// TODO Auto-generated method stub
		CoursesDTO dto = null;
		String query = "select * from mini_mst_courses where course_id = ?";
		try(Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query)){
			ps.setInt(1, course_id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				dto = new CoursesDTO();
				dto.setCourse_id(rs.getInt("course_id"));
				dto.setCourse_name(rs.getString("course_name"));
				dto.setIs_deleted(rs.getInt("is_deleted"));
				dto.setCourse_duration(rs.getString("course_duration"));
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return dto;
	}

	public boolean updateCourse(CoursesDTO dto) {
		// TODO Auto-generated method stub
		String query = "update mini_mst_courses set course_name=? , course_duration=? where course_id=?";
		try(Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1,dto.getCourse_name());
			ps.setString(2, dto.getCourse_duration());
			ps.setInt(3, dto.getCourse_id());
			int rows = ps.executeUpdate();
			System.out.println("Rows updated: " + rows); 
	        return rows > 0;
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return false;
	}

	public boolean deleteCourse(int course_id) {
		// TODO Auto-generated method stub
		String query = "UPDATE mini_mst_courses SET is_deleted = 1 WHERE course_id = ?";
	    try (Connection con = DBConfig.getConnection();
	         PreparedStatement ps = con.prepareStatement(query)) {
	        ps.setInt(1, course_id);
	        int rows = ps.executeUpdate();
	        System.out.println("Rows soft deleted (is_deleted=1): " + rows);
	        return rows > 0;
	    } catch (Exception e) {
	        System.out.println("Soft delete error: " + e.getMessage());
	    }
	    return false;
	}

	public List<CoursesDTO> getDeletedCourses() {
		List<CoursesDTO> list = new ArrayList<>();
		String query = "select * from mini_mst_courses where is_deleted = 1";
		try(Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query)){
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				CoursesDTO dto = new CoursesDTO();
				dto.setCourse_id(rs.getInt("course_id"));
				dto.setCourse_name(rs.getString("course_name"));
				dto.setCourse_duration(rs.getString("course_duration"));
				list.add(dto);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return list;
	}

	public boolean restoreCourse(int course_id) {
		String query = "UPDATE mini_mst_courses SET is_deleted = 0 WHERE course_id = ?";
	    try (Connection con = DBConfig.getConnection();
	         PreparedStatement ps = con.prepareStatement(query)) {
	        ps.setInt(1, course_id);
	        int rows = ps.executeUpdate();
	        System.out.println("Rows restored: " + rows);
	        return rows > 0;
	    } catch (Exception e) {
	        System.out.println("Restore error: " + e.getMessage());
	    }
	    return false;
	}

	
}
