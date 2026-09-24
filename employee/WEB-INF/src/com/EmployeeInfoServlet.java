package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/information")
public class EmployeeInfoServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		 doPost(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Inside the post method");
		
		String studentId = req.getParameter("studentId");
		String firstname = req.getParameter("firstname");
		String lastname = req.getParameter("lastname");
		String emailId = req.getParameter("emailId");
		String phoneNumber = req.getParameter("phoneNumber");

		System.out.println("StudentId: " + studentId);
		System.out.println("Firstname: " + firstname);
		System.out.println("Lastname: " + lastname);
		System.out.println("EmailId: " + emailId);
		System.out.println("PhoneNumber: " + phoneNumber);

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/studentinfo", "root", "123456");

			if (con1 != null) {
				System.out.println("Insert DataBase Operation Connetion Done Succesfully");

				Statement stmt = con1.createStatement();

				String sql = "INSERT INTO studentinfo.studentinformation (firstname, lastname, emailId, phoneNumber) VALUES ('"+firstname +"', '"+lastname +"', '"+emailId +"','"+phoneNumber +"')";
				 

				System.out.println(sql);
				stmt.execute(sql);

			} else {
				System.out.println("DataBase Connection not Done");
			}
			con1.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}

}

