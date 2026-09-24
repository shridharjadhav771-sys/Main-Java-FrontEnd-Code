package School.Mst.Mst_Courses;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import School.Utility.StringUtility;

@WebServlet("/course")
public class CoursesServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String actionType = StringUtility.removeNull(req.getParameter("action"));
	    String courseId = req.getParameter("course_id");

	    CoursesDAO dao = new CoursesDAO();

	    if ("list".equalsIgnoreCase(actionType)) {
	        List<CoursesDTO> courses = dao.getAllCourses();
	        resp.setContentType("application/json");
	        Gson gson = new Gson();
	        resp.getWriter().write(gson.toJson(courses));
	    } else if (courseId != null && !courseId.isEmpty()) {
	        // Single course fetch
	        CoursesDTO course = dao.getCourseById(Integer.parseInt(courseId));
	        resp.setContentType("application/json");
	        Gson gson = new Gson();
	        resp.getWriter().write(gson.toJson(course));
	    } else {
	        // Default load JSP
	        List<CoursesDTO> courses = dao.getAllCourses();
	        req.setAttribute("courses", courses);
	        req.getRequestDispatcher("Courses.jsp").forward(req, resp);
	    }
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = req.getParameter("action");
		String courseId = req.getParameter("course_id");
		CoursesDTO dto = new CoursesDTO();
		
		if(!"delete".equals(action)) {
			String course_name = req.getParameter("course_name");
			int isDeleted = 0;
			String isDeletedParam = req.getParameter("isDeleted");
			if (isDeletedParam != null && !isDeletedParam.isEmpty()) {
				isDeleted = Integer.parseInt(isDeletedParam);
			}
			String course_duration = req.getParameter("course_duration");
			
			
			dto.setCourse_name(course_name);
			dto.setIs_deleted(isDeleted);
			dto.setCourse_duration(course_duration);
		}
		
		boolean status = false;
		
		CoursesDAO dao = new CoursesDAO();
		if("update".equals(action) && courseId != null && !courseId.isEmpty()) {
			dto.setCourse_id(Integer.parseInt(courseId));
			status = dao.updateCourse(dto);
		}else if ("delete".equals(action) && courseId != null && !courseId.isEmpty()) {
			status = dao.deleteCourse(Integer.parseInt(courseId));
		}else {
			status = dao.insertCourse(dto);
		}
		
		resp.setContentType("text/plain");
		if(status){
		    resp.getWriter().write("success");
		} else {
		    resp.getWriter().write("failure");
		}
	}
}
