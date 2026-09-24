package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StudentDAO {

	static Connection con = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;

	// 1️⃣ Database Connection Method
	public static Connection getDBConnection() {
		try {
			// Load MySQL JDBC driver
			Class.forName("com.mysql.cj.jdbc.Driver");

			// Connect to the database (make sure DB name, username, password are correct)
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/student_registration", "root", "123456");

			if (con != null) {
				System.out.println("Database Connection Successful");
			} else {
				System.out.println("Database Connection Failed");
			}

		} catch (Exception e) {
			System.out.println("Database Connection Failed");
			e.printStackTrace();
		}

		return con;
	}

	// 2️⃣ Insert Student Data
	public static int insertStudent(StudentDTO student) {
		int status = 0;

		try {
			// Get DB connection
			con = getDBConnection();

			if (con == null) {
				System.out.println("Cannot insert student: DB connection is null");
				return 0;
			}

			String sql = "INSERT INTO student_registration " + "(name, phonenumber, address, email) "
					+ "VALUES (?, ?, ?, ?)";

			ps = con.prepareStatement(sql);
			ps.setString(1, student.getName());
			ps.setInt(2, student.getPhonenumber());
			ps.setString(3, student.getAddress());
			ps.setString(4, student.getEmail());

			status = ps.executeUpdate();

		} catch (Exception e) {
			System.out.println("Error inserting student");
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return status;
	}
}
