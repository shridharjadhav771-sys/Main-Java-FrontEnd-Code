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

@WebServlet("/submitForm")
public class PageFormServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Data Fetched in get method.....");

		String name = req.getParameter("name");
		String password = req.getParameter("password");

		System.out.println("name :" + name);
		System.out.println("password :" + password);

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/registerform", "root", "123456");

			if (con != null) {
				System.out.println("Insert Data Operation Done Successfully....");

				Statement stmt = con.createStatement();

				String sql = "INSERT INTO registerform.candidateloginform (name/Email,password) VALUES ('" + name
						+ "','" + password + "')";

				System.out.println(sql);
				stmt.execute(sql);

			} else {
				System.out.println("Failed to Data Insert.....please check your code");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
