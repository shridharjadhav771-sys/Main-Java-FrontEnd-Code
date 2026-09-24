package School.Utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {

	public boolean isValidUser(String username, String password) {
		String query = "select 1 from users where username=? and password=?";
		try (Connection con = DBConfig.getConnection();
	            PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return false;
	}

}
