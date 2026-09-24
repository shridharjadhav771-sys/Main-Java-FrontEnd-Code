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

@WebServlet("/data")
public class RegisterFormServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("Data Fetched Inside the post method");

		String firstname = req.getParameter("firstname");
		String lastname = req.getParameter("lastname");
		String emailId = req.getParameter("emailId");
		String mobileNumber = req.getParameter("mobileNumber");
		String address = req.getParameter("address");
		String stream = req.getParameter("stream");
		String passoutYear = req.getParameter("passoutYear");
		String percentage = req.getParameter("percentage");

		System.out.println("firstname :" + firstname);
		System.out.println("lastname:" + lastname);
		System.out.println("emailId: " + emailId);
		System.out.println("mobileNumber :" + mobileNumber);
		System.out.println("address :" + address);
		System.out.println("stream :" + stream);
		System.out.println("passoutYear :" + passoutYear);
		System.out.println("percentage:" + percentage);

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/registerform", "root", "123456");

			if (con != null) {
				System.out.println("Insert Data Operation done successfully ");

				Statement stmt = con.createStatement();

				String sql = "INSERT INTO registerform.registerinformation (fisrtName,lastName,emailId,mobileNumber,address,stream,passoutYear,percentage) VALUES ('"
						+ firstname + "', '" + lastname + "', '" + emailId + "', '" + mobileNumber + "', '" + address
						+ "', '" + stream + "', '" + passoutYear + "', '" + percentage + "')";
				System.out.println(sql);
				stmt.execute(sql);

			} else {
				System.out.println("Insert Data Operation is failed");
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
