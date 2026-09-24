package School.trn.trn_teachers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/teacherContact")
public class TeacherContactServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String contact = req.getParameter("contactVal");
		System.out.println("Contact: "+contact);
		
		TeachersDAO teachersDAO = new TeachersDAO();
		
		if(teachersDAO.checkContact(contact)) {
			resp.setContentType("application/plain");
			resp.getWriter().write("exist");
		}else {
			resp.setContentType("application/plain");
			resp.getWriter().write("Does Not Exist");
		}
	}
}
