package School.Mst.Mst_Classes;

import School.Utility.DBConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClassesDAO {

	public List<ClassesDTO> getAllClasses() {
		// TODO Auto-generated method stub
		List<ClassesDTO> list = new ArrayList<>();
		String query = "select * from mini_mst_classes where is_deleted = 0";
		try(Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query)){
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ClassesDTO dto = new ClassesDTO();
				dto.setClassId(rs.getInt("class_id"));
				dto.setClassName(rs.getString("class_name"));
				dto.setIsDeleted(rs.getInt("is_deleted"));
				list.add(dto);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return list;
	}

	public boolean insertClass(ClassesDTO dto) {
		// TODO Auto-generated method stub
		boolean status = false;
		String query = "insert into mini_mst_classes (class_name) values (?)";
		try(Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, dto.getClassName());
			ps.executeUpdate();
			status = true;
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return status;
	}

	public ClassesDTO getClassById(int class_id) {
		// TODO Auto-generated method stub
		ClassesDTO dto = null;
		String query = "select * from mini_mst_classes where class_id = ?";
		try(Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query)){
			ps.setInt(1, class_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				dto = new ClassesDTO();
				dto.setClassId(rs.getInt("class_id"));
				dto.setClassName(rs.getString("class_name"));
				dto.setIsDeleted(rs.getInt("is_deleted"));
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return dto;
	}

	public boolean updateClass(ClassesDTO dto) {
		// TODO Auto-generated method stub
		String query = "update mini_mst_classes set class_name=? , is_deleted=? where class_id=?";
		try(Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, dto.getClassName());
			ps.setInt(2, dto.getIsDeleted());
			ps.setInt(3, dto.getClassId());
			int rows = ps.executeUpdate();
			System.out.println("Rows updated: " + rows); 
	        return rows > 0;
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return false;
	}

	public boolean deleteClassById(int class_id) {
	    String query = "UPDATE mini_mst_classes SET is_deleted = 1 WHERE class_id = ?";
	    try (Connection con = DBConfig.getConnection();
	         PreparedStatement ps = con.prepareStatement(query)) {
	        ps.setInt(1, class_id);
	        int rows = ps.executeUpdate();
	        System.out.println("Rows soft deleted (is_deleted=1): " + rows);
	        return rows > 0;
	    } catch (Exception e) {
	        System.out.println("Soft delete error: " + e.getMessage());
	    }
	    return false;
	}

	
	public boolean restoreClassById(int class_id) {
	    String query = "UPDATE mini_mst_classes SET is_deleted = 0 WHERE class_id = ?";
	    try (Connection con = DBConfig.getConnection();
	         PreparedStatement ps = con.prepareStatement(query)) {
	        ps.setInt(1, class_id);
	        int rows = ps.executeUpdate();
	        System.out.println("Rows restored: " + rows);
	        return rows > 0;
	    } catch (Exception e) {
	        System.out.println("Restore error: " + e.getMessage());
	    }
	    return false;
	}

	public List<ClassesDTO> getDeletedClasses() {
		// TODO Auto-generated method stub
		List<ClassesDTO> list = new ArrayList<>();
		String query = "select * from mini_mst_classes where is_deleted = 1";
		try(Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query)){
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ClassesDTO dto = new ClassesDTO();
				dto.setClassId(rs.getInt("class_id"));
				dto.setClassName(rs.getString("class_name"));
				dto.setIsDeleted(rs.getInt("is_deleted"));
				list.add(dto);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return list;
	}

}





