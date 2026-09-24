package School.trn.trn_teachers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/teacherinfo")
public class TeacherInfoService extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			String email = req.getParameter("emailVal");
			System.out.println("Email: " + email);
			
			TeachersDAO teachersDAO = new TeachersDAO();
			
			if(teachersDAO.checkEmail(email)) {
				resp.setContentType("text/plain");
				resp.getWriter().write("exist");
			}else {
				resp.setContentType("text/plain");
				resp.getWriter().write("notexist");
			}
			
			
		
	}
	
}
