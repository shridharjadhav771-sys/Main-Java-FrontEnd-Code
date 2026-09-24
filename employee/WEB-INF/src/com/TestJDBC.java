package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet()
public class TestJDBC extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String address = req.getParameter("address");
		String contact = req.getParameter("contact");

		System.out.println("firstName :" + firstName);
		System.out.println("lastName:" + lastName);
		System.out.println("username: " + username);
		System.out.println("password :" + password);
		System.out.println("address :" + address);
		System.out.println("contact :" + contact);

		try

		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/registerform", "root", "123456");

			if (con != null) {
				System.out.println("Insert Data Operation done successfully");

				Statement stmt = con.createStatement();

				String sql = "INSERT INTO registerform.employeeregisterform(firstName,lastName,username,password,address,contact) VALUES ('"
						+ firstName + "', '" + lastName + "', '" + username + "', '" + password + "', '" + address
						+ "', '" + contact + "')";
				
				System.out.println(sql);
				stmt.execute(sql);

			} else {
				System.out.println("Failed to Insert Data Operation.....");
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
