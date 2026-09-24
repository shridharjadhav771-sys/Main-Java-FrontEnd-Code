package com.common;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnections {
	public static Connection conn;
	public static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/globecreater";
	public static final String DB_USER = "root";
	public static final String DB_PASSWORD = "123456";

	private DBConnections() {
	}

	//Instance method for get connection 
	public static Connection getInstance() {
		try {
			if (conn == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); 
			}
			return conn;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
