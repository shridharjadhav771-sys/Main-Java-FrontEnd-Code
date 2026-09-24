package jquery.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/ContactDetails")
public class modalServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		if (action.equals("insert")) {

			System.out.println("Inside insert action");
			String name = req.getParameter("name");
			String contact = req.getParameter("contact");
			String address = req.getParameter("address");
			System.out.println("name: " + name);
			System.out.println("contact: " + contact);
			System.out.println("address: " + address);

			try {
				Connection con = DBConnection.getConnection();

				if (con != null) {
					System.out.println("Insert Data Operation Done Successfully");

					PreparedStatement pstnt = con
							.prepareStatement("INSERT INTO jquerydetails (name,contact,address) VALUES (?,?,?)");
					pstnt.setString(1, name);
					pstnt.setString(2, contact);
					pstnt.setString(3, address);
					pstnt.executeUpdate();

				} else {
					System.out.println("Insert Data Operation failed........please check the code");

				}
				con.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

			resp.setContentType("application/plain");
			resp.getWriter().write("Success");
		} else if (action.equals("dispaly")) {
			System.out.println("Inside dispaly action");
			try {
				List<ContactInfoDTO> contactList = new ArrayList<ContactInfoDTO>();

				Connection con = DBConnection.getConnection();
				String sql = "select * from jquerydetails";
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					ContactInfoDTO contactInfoObj = new ContactInfoDTO();
					contactInfoObj.setName(rs.getString("name"));
					contactInfoObj.setContact(rs.getString("contact"));
					contactInfoObj.setAddress(rs.getString("address"));
					contactList.add(contactInfoObj);
				}

				Gson gson = new Gson();
				resp.setContentType("application/json");
				resp.getWriter().write(gson.toJson(contactList));

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (action.equals("update")) {
			System.out.println("Inside update action");
			String name = req.getParameter("name");
			String contact = req.getParameter("contact");
			String address = req.getParameter("address");

			try {
				Connection con = DBConnection.getConnection();

				if (con != null) {
					System.out.println("Update Data Operation Done Successfully");

					PreparedStatement pstnt = con.prepareStatement(
							"UPDATE jquerydetails SET contact = ?, address = ? WHERE name = ? WHERE id_no=?");
					pstnt.setString(1, contact);
					pstnt.setString(2, address);
					pstnt.setString(3, name);
					int rowsUpdated = pstnt.executeUpdate();

					if (rowsUpdated > 0) {
						resp.getWriter().write("Record updated successfully");
					} else {
						resp.getWriter().write("Record not found to update");
					}

				} else {
					System.out.println("Update Data Operation failed........please check the code");
				}
				con.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (action.equals("delete")) {
			System.out.println("Inside delete action");
			String name = req.getParameter("name");

			try {
				Connection con = DBConnection.getConnection();

				if (con != null) {
					System.out.println("Delete Data Operation Done Successfully");

					PreparedStatement pstnt = con.prepareStatement("DELETE FROM jquerydetails WHERE name = ?");
					pstnt.setString(1, name);
					int rowsDeleted = pstnt.executeUpdate();

					if (rowsDeleted > 0) {
						resp.getWriter().write("Record deleted successfully");
					} else {
						resp.getWriter().write("Record not found to delete");
					}

				} else {
					System.out.println("Delete Data Operation failed........please check the code");
				}
				con.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
