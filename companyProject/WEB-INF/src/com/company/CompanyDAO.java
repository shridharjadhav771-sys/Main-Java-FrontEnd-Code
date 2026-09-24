package com.company;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CompanyDAO {
	static PreparedStatement ps = null;
	static ResultSet rs = null;

	public static Connection getDBConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/company", "root", "123456");
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

	public static int RegistrationForm(CompanyDTO companyDTO) {
		int status = 0;

		try {
			Connection con = getDBConnection();
			String sql = "INSERT INTO company_info (std_fname, std_lname, std_email, std_add) VALUES (?, ?, ?, ?)";

			ps = con.prepareStatement(sql);
			ps.setString(1, companyDTO.getStudentFirstName());
			ps.setString(2, companyDTO.getStudentLastName());
			ps.setString(3, companyDTO.getStudentEmailId());
			ps.setString(4, companyDTO.getStudentAddress());

			status = ps.executeUpdate();

		} catch (Exception e) {
			
			e.printStackTrace();
		}

		return status;

	}
}
