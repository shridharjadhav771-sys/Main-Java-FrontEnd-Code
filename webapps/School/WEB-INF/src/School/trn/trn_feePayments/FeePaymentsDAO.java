package School.trn.trn_feePayments;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import School.Utility.DBConfig;

public class FeePaymentsDAO {

	public List<FeePaymentsDTO> getAllFeePayments() {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean insertFeePayment(FeePaymentsDTO dto) {
		// TODO Auto-generated method stub
		String query = "insert into mini_trn_fee_types (student_id, fee_type_id, amount_paid, payment_date) values (?, ?, ?, ?)";
		try (Connection con = DBConfig.getConnection();
	             PreparedStatement ps = con.prepareStatement(query)){
			ps.setInt(1, dto.getStudent_id());	
			ps.setInt(2, dto.getFee_type_id());
			ps.setDouble(3, dto.getAmount_paid());
			ps.setDate(4, dto.getPayment_date());
			int rows = ps.executeUpdate();
			return rows > 0;
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return false;
	}

	public void updateFeePayment(FeePaymentsDTO dto) {
		// TODO Auto-generated method stub
		
	}

}
