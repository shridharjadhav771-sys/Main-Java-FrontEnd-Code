package School.trn.trn_teachers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/restoreTeacher")
public class RestoreTeachersServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int teacher_id = Integer.parseInt(req.getParameter("teacher_id"));
        TeachersDAO dao = new TeachersDAO();
        boolean status = dao.restoreTeacher(teacher_id);
        if(status) {
        	System.out.println("Student Restored Successfully!");
        }else {
        	System.out.println("Student Restore Successfully!");
        }
        resp.sendRedirect("teachersList");
	}
}
