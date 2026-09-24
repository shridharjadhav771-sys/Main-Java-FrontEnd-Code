package ajaxProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RegisterDAO {

	static Connection con;
	static ResultSet rs = null;
	static PreparedStatement ps = null;

	public static Connection getDBConnection() {
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kbcnmu", "root", "123456");

			if (con != null) {
				System.out.println("Connection Successful...");
			} else {
				System.out.println("Connection failed...");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public static int insertRegisterDetails(RegisterDTO regObj) {
		int status = 0;
		try {
			con = getDBConnection();
			String insertQuery = "insert into tbl_kbcnmu_registaration(reg_fname, reg_lname, reg_mbno, reg_emailid, reg_address, reg_gender, reg_dob, reg_branch, reg_specialization,reg_Password) values(?,?,?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(insertQuery);
			ps.setString(1, regObj.getReg_fname());
			ps.setString(2, regObj.getReg_lname());
			ps.setLong(3, regObj.getReg_mbno());
			ps.setString(4, regObj.getReg_emailid());
			ps.setString(5, regObj.getReg_address());
			ps.setString(6, regObj.getReg_gender());
			ps.setDate(7, regObj.getReg_dob());
			ps.setString(8, regObj.getReg_branch());
			ps.setString(9, regObj.getReg_specialization());
			ps.setString(10, regObj.getReg_Password());

			status = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;

	}

	public static ArrayList<RegisterDTO> displayRegisterDetails() {
		ArrayList<RegisterDTO> registerList = new ArrayList<RegisterDTO>();
		try {
			con = getDBConnection();
			String selectQuery = "Select * from tbl_kbcnmu_registaration where reg_isdelete=0";
			ps = con.prepareStatement(selectQuery);
			rs = ps.executeQuery();
			while (rs.next()) {
				RegisterDTO regObj = new RegisterDTO();
				regObj.setReg_id(rs.getInt("reg_id"));
				regObj.setReg_fname(rs.getString("reg_fname"));
				regObj.setReg_lname(rs.getString("reg_lname"));
				regObj.setReg_mbno(rs.getLong("reg_mbno"));
				regObj.setReg_emailid(rs.getString("reg_emailid"));
				regObj.setReg_address(rs.getString("reg_address"));
				regObj.setReg_gender(rs.getString("reg_gender"));
				regObj.setReg_dob(rs.getDate("reg_dob"));
				regObj.setReg_branch(rs.getString("reg_branch"));
				regObj.setReg_specialization(rs.getString("reg_specialization"));
				regObj.setReg_Password(rs.getString("reg_Password"));

				registerList.add(regObj);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return registerList;
	}

	public static int updateRegisterDetails(RegisterDTO regObj) {
		int status = 0;
		try {
			con = getDBConnection();
			String updateQuery = "update tbl_kbcnmu_registaration set reg_fname=?, reg_lname=?, reg_mbno=?, reg_emailid=?, reg_address=?, reg_gender=?, reg_dob=?, reg_branch=?, reg_specialization=?,reg_Password=? a where reg_id=?";
			ps = con.prepareStatement(updateQuery);
			ps.setString(1, regObj.getReg_fname());
			ps.setString(2, regObj.getReg_lname());
			ps.setLong(3, regObj.getReg_mbno());
			ps.setString(4, regObj.getReg_emailid());
			ps.setString(5, regObj.getReg_address());
			ps.setString(6, regObj.getReg_gender());
			ps.setDate(7, regObj.getReg_dob());
			ps.setString(8, regObj.getReg_branch());
			ps.setString(9, regObj.getReg_specialization());
			ps.setString(10, regObj.getReg_Password());

			ps.setInt(11, regObj.getReg_id());

			status = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static int deleteRegisterDetails(int reg_id) {
		int status = 0;
		try {
			con = getDBConnection();
			String deleteQuery = "update tbl_kbcnmu_registaration set reg_isdelete=1 where reg_id=?";
			ps = con.prepareStatement(deleteQuery);
			ps.setInt(1, reg_id);
			status = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
}
