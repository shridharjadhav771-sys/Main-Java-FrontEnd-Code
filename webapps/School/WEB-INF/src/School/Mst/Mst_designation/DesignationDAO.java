package School.Mst.Mst_designation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import School.Utility.DBConfig;

public class DesignationDAO {

	public List<DesignationDTO> getAllDesignations() {
		// TODO Auto-generated method stub
		List<DesignationDTO> list = new ArrayList<>();
		String query = "select * from mini_mst_designations where is_deleted=0";
		try(Connection con = DBConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(query)){
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				DesignationDTO dto = new DesignationDTO();
				dto.setDesignation_id(rs.getInt("designation_id"));
				dto.setDesignation_name(rs.getNString("designation_name"));
				list.add(dto);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	public boolean insertDesignation(DesignationDTO dto) {
		// TODO Auto-generated method stub
		String query = "insert into mini_mst_designations (designation_name) values (?)";
		try(Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, dto.getDesignation_name());
			int rows = ps.executeUpdate();
			return rows > 0;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

	public DesignationDTO getDesignationById(int designation_id) {
		// TODO Auto-generated method stub
		DesignationDTO dto = null;
		String query = "select * from mini_mst_designations where designation_id = ?";
		try(Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query)){
			ps.setInt(1, designation_id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				dto = new DesignationDTO();
				dto.setDesignation_id(rs.getInt("designation_id"));
				dto.setDesignation_name(rs.getNString("designation_name"));
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dto;
	}
	
	public boolean updateDesignation(DesignationDTO dto) {
		// TODO Auto-generated method stub
		String query = "update mini_mst_designations set designation_name = ? where designation_id = ?";
		try(Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, dto.getDesignation_name());
			ps.setInt(2, dto.getDesignation_id());
			int rows = ps.executeUpdate();
			return rows > 0;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteDesignationById(int designation_id) {
		// TODO Auto-generated method stub
		String query = "UPDATE mini_mst_designations SET is_deleted = 1 WHERE designation_id = ?";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)){
        	ps.setInt(1, designation_id);
        	int rows = ps.executeUpdate();
			return rows > 0;
        }catch (Exception e) {
			// TODO: handle exception
        	e.printStackTrace();
		}
		return false;
	}

	public List<DesignationDTO> getDeletedDesignations() {
		// TODO Auto-generated method stub
		List<DesignationDTO> list = new ArrayList<>();
		String query = "select * from mini_mst_designations where is_deleted=1";
		try(Connection con = DBConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(query)){
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				DesignationDTO dto = new DesignationDTO();
				dto.setDesignation_id(rs.getInt("designation_id"));
				dto.setDesignation_name(rs.getNString("designation_name"));
				list.add(dto);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	public boolean restoreDesignation(int designation_id) {
		// TODO Auto-generated method stub
		String query = "UPDATE mini_mst_designations SET is_deleted = 0 WHERE designation_id = ?";
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)){
        	ps.setInt(1, designation_id);
        	int rows = ps.executeUpdate();
			return rows > 0;
        }catch (Exception e) {
			// TODO: handle exception
        	e.printStackTrace();
		}
		return false;
	}

	

}
