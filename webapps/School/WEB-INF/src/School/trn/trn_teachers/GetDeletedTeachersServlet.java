package School.trn.trn_teachers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deletedTeachers")
public class GetDeletedTeachersServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		TeachersDAO dao = new TeachersDAO();
		List<TeachersDTO> deletedTeachers = dao.getDeletedTeachers();
		req.setAttribute("deletedTeachers", deletedTeachers);
		req.getRequestDispatcher("TeachersDeleted.jsp").forward(req, resp);
	}
}
