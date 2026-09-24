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

@WebServlet("/info")
public class LoginFormServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Data Fetched in get method.....");

		String email_Id = req.getParameter("email_Id");
		String password = req.getParameter("password");
		String address = req.getParameter("address");
		String address2 = req.getParameter("address2");
		String city = req.getParameter("city");
		String state = req.getParameter("state");
		String zip = req.getParameter("zip");

		System.out.println("email_Id: " + email_Id);
		System.out.println("password: " + password);
		System.out.println("address: " + address);
		System.out.println("address2: " + address2);
		System.out.println("city: " + city);
		System.out.println("state: " + state);
		System.out.println("zip:" + zip);

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/registerform", "root", "123456");

			if (con != null) {
				System.out.println("Insert Data Operation Done Successfully");

				Statement stmt = con.createStatement();

				String sql = "INSERT INTO registerform.signform (email_Id,password,address,address_permanent,city,state,zip) VALUES ('"
						+ email_Id + "','" + password + "','" + address + "','" + address2 + "','" + city + "','" + state
						+ "','" + zip + "')";

				System.out.println(sql);
				stmt.execute(sql);

			} else {
				System.out.println("Insert Data Operation failed........please check the code");

			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
