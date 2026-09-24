package jquery.com;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/jquery_information", "root", "123456");
			return con;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
