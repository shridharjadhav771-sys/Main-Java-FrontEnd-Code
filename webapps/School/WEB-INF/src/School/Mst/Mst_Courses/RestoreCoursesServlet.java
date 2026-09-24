package School.Mst.Mst_Courses;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/restoreCourse")
public class RestoreCoursesServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int course_id = Integer.parseInt(req.getParameter("course_id"));
		CoursesDAO dao = new  CoursesDAO();
		boolean status = dao.restoreCourse(course_id);
		if(status) {
        	System.out.println("Course deleted successfully");
        }else {
        	System.out.println("Course deletion failed");
        }
        resp.sendRedirect("course");
	}
	
}
