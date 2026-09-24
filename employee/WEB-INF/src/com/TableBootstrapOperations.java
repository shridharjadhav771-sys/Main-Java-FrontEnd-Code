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

@WebServlet("/")
public class TableBootstrapOperations extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Data Fetched Inside Post Method");
		String Srno = req.getParameter("Srno");
		String Name = req.getParameter("Name");
		String City = req.getParameter("City");
		String Age = req.getParameter("Age");
		String Contact = req.getParameter("Contact");
		String Stream = req.getParameter("Stream");

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con3 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/registerform", "root", "123456");

			if (con3 != null) {

				Statement stmt = con3.createStatement();

				String sql = "DELETE from studentinformation where Id=5";

				System.out.println("Delete DataBase Operation Connection is Done Successfully");
				stmt.execute(sql);

			} else {
				System.out.println("DB Connection is not Done");
			}
			con3.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
