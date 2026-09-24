package School.Utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
    private static final String URL = "jdbc:mysql://localhost:3306/miniproject";
    private static final String USER = "root";
    private static final String PASS = "123456";

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
