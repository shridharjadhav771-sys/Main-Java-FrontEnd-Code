package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UpdateDAO {

	static PreparedStatement ps = null;

	public static Connection getDBConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/car", "root", "123456");
			if (con != null) {
				System.out.println("Connection Successful...");
			} else {
				System.out.println("Connection failed...");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public static int updateCarRecord(DisplayRecordsDto displaydto) {
		int status=0;
		try {
Connection con =  getDBConnection();			
		String sql = "UPDATE car.carspecification SET CarName =?, CarCC =? ,CarPrice = ?, CarColour =?, CarType =?,CarCompany =? WHERE CarID= ?";
		ps=con.prepareStatement(sql);
	
		
		ps.setString(1,displaydto.getCarName());
		ps.setInt(2,displaydto.getCarCC());
		ps.setInt(3,displaydto.getCarPrice());
		ps.setString(4,displaydto.getCarColour());
		ps.setString(5,displaydto.getCarType());
		ps.setString(6,displaydto.getCarCompany());
		ps.setInt(7,displaydto.getCarID());
		
		status=ps.executeUpdate();
		
		
		
		}catch (Exception e) {
			e.printStackTrace();		
		}
return status;
}

}