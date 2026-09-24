package School.Utility;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dashboardCounts")
public class DashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json");

        DashboardDAO dao = new DashboardDAO();

        int students = dao.getTotalStudents();
        int teachers = dao.getTotalTeachers();
        int courses = dao.getTotalCourses();
        int departments = dao.getTotalDepartments();

        String json = String.format("{\"students\":%d,\"teachers\":%d,\"courses\":%d,\"departments\":%d}", 
                                    students, teachers, courses, departments);

        resp.getWriter().write(json);
    }
}
