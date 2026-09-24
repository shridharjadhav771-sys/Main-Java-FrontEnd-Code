package School.Mst.Mst_Courses;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateCourse")
public class UpdateCoursesServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int course_id = Integer.parseInt(req.getParameter("course_id"));
		CoursesDAO dao = new  CoursesDAO();
		CoursesDTO course = dao.getCourseById(course_id);
		req.setAttribute("course", course);
		req.getRequestDispatcher("CourseUpdate.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int course_id = Integer.parseInt(req.getParameter("course_id"));
		String course_name = req.getParameter("course_name");
		int isDeleted = 0;
		String isDeletedParam = req.getParameter("isDeleted");
		if (isDeletedParam != null && !isDeletedParam.isEmpty()) {
			isDeleted = Integer.parseInt(isDeletedParam);
		}
		String course_duration = req.getParameter("course_duration");
		
		CoursesDTO dto = new CoursesDTO();
		dto.setCourse_name(course_name);
		dto.setIs_deleted(isDeleted);
		dto.setCourse_duration(course_duration);
		
		CoursesDAO dao = new CoursesDAO();
		boolean status = dao.updateCourse(dto);
		resp.sendRedirect("course");
	}
}
