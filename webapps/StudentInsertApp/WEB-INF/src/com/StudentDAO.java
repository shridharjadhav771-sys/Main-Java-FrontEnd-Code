package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.StudentDTO;

public class StudentDAO {

	public void insertStudent(StudentDTO s) {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_db", "root", "123456");

			String sql = "INSERT INTO student(name,email,course) VALUES(?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, s.getName());
			ps.setString(2, s.getEmail());
			ps.setString(3, s.getCourse());

			ps.executeUpdate();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
