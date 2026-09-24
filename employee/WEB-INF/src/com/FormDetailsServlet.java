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

@WebServlet("/details")
public class FormDetailsServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Data fetched inside Post method");
		
        String firstName =req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String address = req.getParameter("address");
		String contact = req.getParameter("contact");

		System.out.println("FirstName: " + firstName);
		System.out.println("LastName: " + lastName);
		System.out.println("Username: " + username);
		System.out.println("Password" + password);
		System.out.println("Address: " + address);
		System.out.println("Contact: " + contact);

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/registerform", "root", "123456");

			if (con != null) {
				System.out.println("Insert Data Operation done successfully");

				Statement stmt = con.createStatement();

				String sql = "INSERT INTO registerform.employeeregisterform (firstname,lastname,username,password,address,contactNo) VALUES ('"+firstName+"','"+lastName+"','"+username+"','"+ password+"','"+address+"','"+contact+"')";
				
				stmt.execute(sql);
				System.out.println(sql);

			} else {
				System.out.println("Failed to Insert Data Operation.....");
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
