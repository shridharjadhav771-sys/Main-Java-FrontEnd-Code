package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Student")
public class TableBootstrapServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Data Fetched Inside Post Method");
		String Id = req.getParameter("Id");
		String Name = req.getParameter("Name");
		String City = req.getParameter("City");
		String Age = req.getParameter("Age");
		String Contact = req.getParameter("Contact");
		String Stream = req.getParameter("Stream");

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection ObjScan = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/registerform", "root",
					"123456");

			if (ObjScan != null) {
				System.out.println(" Select DataBase Connection is Done");
				Statement stmt = ObjScan.createStatement();
				String sql = "SELECT * FROM registerform.studentinformation";

				ResultSet rsObj = stmt.executeQuery(sql);
				while (rsObj.next()) {

					System.out.println("Id : " + rsObj.getInt("Id") + "\tname :" + rsObj.getString("name") + "\tcity :"
							+ rsObj.getString("city") + "\tage :" + rsObj.getInt("age") + "\tcontact :"
							+ rsObj.getInt("contact") + "\tstream: " + rsObj.getString("stream"));
					//System.out.println(sql);

				}
				ObjScan.close();

			} else {
				System.out.println("DataBase Connection is not Done");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
