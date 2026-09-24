package School.Mst.Mst_fee_types;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import School.Utility.DBConfig;

public class FeeTypesDAO {

    // Fetch all active fee types
    public List<FeeTypesDTO> getAllFeeTypes() {
        List<FeeTypesDTO> list = new ArrayList<>();
        String query = "SELECT * FROM mini_mst_fee_types WHERE is_deleted = 0";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                FeeTypesDTO dto = new FeeTypesDTO();
                dto.setFee_type_id(rs.getInt("fee_type_id"));
                dto.setFee_name(rs.getString("fee_name"));
                list.add(dto);
            }

        } catch (Exception e) {
            System.out.println("getAllFeeTypes() error: " + e.getMessage());
        }

        return list;
    }

    // Insert new fee type
    public boolean insertFeeType(FeeTypesDTO dto) {
        String query = "INSERT INTO mini_mst_fee_types (fee_name) VALUES (?)";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, dto.getFee_name());
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("insertFeeType() error: " + e.getMessage());
        }

        return false;
    }

    // Fetch fee type by ID
    public FeeTypesDTO getFeeTypesById(int id) {
        FeeTypesDTO dto = null;
        String query = "SELECT * FROM mini_mst_fee_types WHERE fee_type_id = ?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                dto = new FeeTypesDTO();
                dto.setFee_type_id(rs.getInt("fee_type_id"));
                dto.setFee_name(rs.getString("fee_name"));
            }

        } catch (Exception e) {
            System.out.println("getFeeTypesById() error: " + e.getMessage());
        }

        return dto;
    }

    // Update fee type
    public boolean updateFeeType(FeeTypesDTO dto) {
        String query = "UPDATE mini_mst_fee_types SET fee_name = ?WHERE fee_type_id = ?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, dto.getFee_name());
            ps.setInt(2, dto.getFee_type_id());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("updateFeeType() error: " + e.getMessage());
        }

        return false;
    }

    // Soft delete fee type
    public boolean deleteFeeType(int id) {
        String query = "UPDATE mini_mst_fee_types SET is_deleted = 1 WHERE fee_type_id = ?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("deleteFeeType() error: " + e.getMessage());
        }

        return false;
    }

    // Fetch all deleted fee types
    public List<FeeTypesDTO> getDeletedFeeTypes() {
        List<FeeTypesDTO> list = new ArrayList<>();
        String query = "SELECT * FROM mini_mst_fee_types WHERE is_deleted = 1";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                FeeTypesDTO dto = new FeeTypesDTO();
                dto.setFee_type_id(rs.getInt("fee_type_id"));
                dto.setFee_name(rs.getString("fee_name"));
                list.add(dto);
            }

        } catch (Exception e) {
            System.out.println("getDeletedFeeTypes() error: " + e.getMessage());
        }

        return list;
    }

    // Restore deleted fee type
    public boolean restoreFeeType(int id) {
        String query = "UPDATE mini_mst_fee_types SET is_deleted = 0 WHERE fee_type_id = ?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("restoreFeeType() error: " + e.getMessage());
        }

        return false;
    }
}
