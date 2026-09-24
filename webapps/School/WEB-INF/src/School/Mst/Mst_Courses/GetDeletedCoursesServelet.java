package School.Mst.Mst_Courses;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/deletedCourse")
public class GetDeletedCoursesServelet extends HttpServlet{
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CoursesDAO dao = new CoursesDAO();
        List<CoursesDTO> deletedList = dao.getDeletedCourses();
        req.setAttribute("deletedList", deletedList);
        req.getRequestDispatcher("CourseDeleted.jsp").forward(req, resp);
    }
}
