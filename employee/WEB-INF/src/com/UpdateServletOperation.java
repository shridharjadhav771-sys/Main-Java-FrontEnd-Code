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

@WebServlet("/Specification")
public class UpdateServletOperation extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Data Fetched Inside Post Method");

		int CarID = Integer.parseInt(req.getParameter("CarID"));
		String CarName = req.getParameter("CarName");
		int CarCC = Integer.parseInt(req.getParameter("CarCC"));
		int CarPrice = Integer.parseInt(req.getParameter("CarPrice"));
		String CarColour = req.getParameter("CarColour");
		String CarType = req.getParameter("CarType");
		String CarCompany = req.getParameter("CarCompany");

		try {

			/*Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/car", "root", "123456");

			if (con2 != null) {
				System.out.println("Update DataBase Operation Connection Done Successufully");

				Statement stmt = con2.createStatement();*/
				DisplayRecordsDto displaydto = new DisplayRecordsDto();
				displaydto.setCarID(CarID);
				displaydto.setCarName(CarName);
				displaydto.setCarCC(CarCC);
				displaydto.setCarPrice(CarPrice);
				displaydto.setCarColour(CarColour);
				displaydto.setCarType(CarType);
				displaydto.setCarCompany(CarCompany);
				
				int status=UpdateDAO.updateCarRecord(displaydto);
				
				if(status>0) {
					System.out.println("Update Successfully");
					resp.sendRedirect("ViewStudent");
				}else {
					System.out.println("not updated");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			}
		}

				// String sql = "UPDATE car.carspecification SET CarName = 'Bugatti', CarCC =
				// 5500, CarPrice = 17858486, CarColour = 'red', CarType = 'Diesel',CarCompany
				// ='Ferrari' WHERE (CarID= 31)";
//				String sql = "UPDATE car.carspecification SET CarName =?, CarCC =? ,CarPrice = ?, CarColour =?, CarType =?,CarCompany =? WHERE (CarID= ?)";
//
//				stmt.executeUpdate(sql);
//
//			} else {
//				System.out.println("DataBase Connection is not Done");
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//	}
//
//}
