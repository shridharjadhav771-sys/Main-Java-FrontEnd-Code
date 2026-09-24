package com.student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class StudentDAO {

	static PreparedStatement ps = null;
	static ResultSet rs = null;

	public static Connection getDBConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/student", "root", "123456");
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

	public static int RegistrationForm(StudentDTO studentDTO) {

		int status = 0;
		try {
			Connection con = getDBConnection();
			String sql = "insert into std_resgistrationform (std_fname,std_lname,std_email,std_add)value(?,?,?,?)";

			ps = con.prepareStatement(sql);
			ps.setString(1, studentDTO.getStudentFirstName());
			ps.setString(2, studentDTO.getStudentLastName());
			ps.setString(3, studentDTO.getStudentEmailId());
			ps.setString(4, studentDTO.getStudentAddress());

			status = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;

	}

	public static ArrayList<StudentDTO> displayStudentDetails(String searchField) {
		ArrayList<StudentDTO> list = new ArrayList<StudentDTO>();
		try {
			Connection con = getDBConnection();
			String str = "";
			if( searchField != null  && !searchField.isEmpty()) {
				str += " WHERE std_fname like '%"+searchField+"%' OR std_lname like '%"+searchField+"%' OR std_id like '%"+searchField+"' OR std_email like '%"+searchField+"%' OR std_add like '%"+searchField+"%'";
			}
			String selectQuery = "SELECT * FROM std_resgistrationform" + str;

			ps = con.prepareStatement(selectQuery);
			rs = ps.executeQuery();
			while (rs.next()) {
				StudentDTO stu = new StudentDTO();
				stu.setStdId(rs.getInt("std_id"));
				stu.setStudentFirstName(rs.getString("std_fname"));
				stu.setStudentLastName(rs.getString("std_lname"));
				stu.setStudentEmailId(rs.getString("std_email"));
				stu.setStudentAddress(rs.getString("std_add"));
				list.add(stu);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static ArrayList<StudentDTO> getRecordById(int id) {
		ArrayList<StudentDTO> list = new ArrayList<StudentDTO>();
		try {
			Connection con = getDBConnection();
			String selectQuery = "SELECT * FROM std_resgistrationform where std_id = " + id;
			ps = con.prepareStatement(selectQuery);
			rs = ps.executeQuery();
			if (rs.next()) {
				StudentDTO stu = new StudentDTO();
				stu.setStdId(rs.getInt("std_id"));
				stu.setStudentFirstName(rs.getString("std_fname"));
				stu.setStudentLastName(rs.getString("std_lname"));
				stu.setStudentEmailId(rs.getString("std_email"));
				stu.setStudentAddress(rs.getString("std_add"));
				list.add(stu);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static int UpdateRegistrationForm(StudentDTO studentDTO) {

		int status = 0;
		try {
			Connection con = getDBConnection();
	        
	        String sql = "UPDATE std_resgistrationform SET std_fname=?, std_lname=?, std_email=?, std_add=? WHERE std_id=?";
	        
	        ps = con.prepareStatement(sql);
	        ps.setString(1, studentDTO.getStudentFirstName());
	        ps.setString(2, studentDTO.getStudentLastName());
	        ps.setString(3, studentDTO.getStudentEmailId());
	        ps.setString(4, studentDTO.getStudentAddress());
	        ps.setInt(5, studentDTO.getStdId());
	        
	        status = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;

	}

	public static int DeleteServlet(int std_id) {

		int status = 0;
		try {

			Connection con = getDBConnection();
			String sql = "DELETE FROM std_resgistrationform WHERE std_id = ?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, std_id);
			status = ps.executeUpdate(); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;

	}

	public ArrayList<StudentDTO> searchstudent(String searchField) {
		ArrayList<StudentDTO> studList =new ArrayList<StudentDTO>();

		try {

			String sql ="SELECT * FROM std_resgistrationform WHERE std_fname LIKE ?";

			Connection con = getDBConnection();

			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + searchField + "%"); 
			
			ResultSet rs = pstmt.executeQuery();

			

			while(rs.next()) {

				StudentDTO student= new StudentDTO();
				student.setStdId(rs.getInt("std_id"));
				student.setStudentFirstName(rs.getString("std_fname"));
				student.setStudentLastName(rs.getString("std_lname"));
				student.setStudentEmailId(rs.getString("std_email"));
				student.setStudentAddress(rs.getString("std_add"));
			studList.add(student);

		   }



		} catch (Exception e) {

			e.printStackTrace();

		}

		return studList;

		}
}