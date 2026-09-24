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

@WebServlet("/allRecords")
public class DisplayRecordServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Data Fetched Successfully");

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection ObjScan = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/car", "root",
					"123456");

			if (ObjScan != null) {
				System.out.println(" Select DataBase Connection is Done");
				Statement stmt = ObjScan.createStatement();
				String sql = "SELECT * FROM car.carspecification";
				ArrayList<DisplayRecordsDto> list = new ArrayList<DisplayRecordsDto>();
				ResultSet rsObj = stmt.executeQuery(sql);
				while (rsObj.next()) {
					DisplayRecordsDto dto = new DisplayRecordsDto();
					dto.setCarID( rsObj.getInt("CarID"));
					dto.setCarCC(rsObj.getInt("CarCC"));
					dto.setCarColour(rsObj.getString("CarColour"));
					dto.setCarCompany(rsObj.getString("CarCompany"));
					dto.setCarName( rsObj.getString("CarName"));
					dto.setCarPrice(rsObj.getInt("CarPrice"));
					list.add(dto);
					// System.out.println("Id : " + rsObj.getInt("Id") + "\tname :" +
					// rsObj.getString("name") + "\tcity :"
					// + rsObj.getString("city") + "\tage :" + rsObj.getInt("age") + "\tcontact :"
					// + rsObj.getInt("contact") + "\tstream: " + rsObj.getString("stream"));
					// System.out.println(sql);

				}
				req.getSession().setAttribute("List", list);
				resp.sendRedirect("displayRecords.jsp");
				ObjScan.close();

			} else {
				System.out.println("DataBase Connection is not Done");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
