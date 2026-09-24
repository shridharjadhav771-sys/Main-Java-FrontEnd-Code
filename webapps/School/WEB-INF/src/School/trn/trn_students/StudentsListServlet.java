package School.trn.trn_students;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import School.Mst.Mst_Classes.ClassesDAO;
import School.Mst.Mst_Classes.ClassesDTO;
import School.Mst.Mst_Courses.CoursesDAO;
import School.Mst.Mst_Courses.CoursesDTO;

@WebServlet("/studentList")
public class StudentsListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String  query= req.getParameter("query") == null ? "" : req.getParameter("query");
        String classIdParam = req.getParameter("class_id");
        String courseIdParam = req.getParameter("course_id");
        int rowsPerPage = req.getParameter("rows") == null ? 10 : Integer.parseInt(req.getParameter("rows"));
        int currentPage = req.getParameter("cpage") == null ? 1 : Integer.parseInt(req.getParameter("cpage"));
        
        String sortColumn = req.getParameter("sort_column");
        
        sortColumn = (sortColumn == null || sortColumn.isEmpty())? "student_id" : sortColumn;
        
        Integer classId = (classIdParam != null && !classIdParam.isEmpty()) ? Integer.parseInt(classIdParam) : null;
        Integer courseId = (courseIdParam != null && !courseIdParam.isEmpty()) ? Integer.parseInt(courseIdParam) : null;

        // Get class and course lists for dropdowns
        ClassesDAO classDao = new ClassesDAO();
        List<ClassesDTO> classes = classDao.getAllClasses();

        CoursesDAO courseDao = new CoursesDAO();
        List<CoursesDTO> courses = courseDao.getAllCourses();

        // Get student list
        StudentsDAO dao = new StudentsDAO();
        List<StudentsDTO> students = dao.getSearchedStudents(query, classId, courseId, currentPage, rowsPerPage, sortColumn);
        int totalStudents = dao.getSearchedStudentsCount(query, classId, courseId);
        
        int totalPages = (int) Math.ceil((double) totalStudents / rowsPerPage);
        
        resp.setContentType("application/json");
		resp.getWriter().write(new Gson().toJson(students));
        
		/*
		 * req.setAttribute("courses", courses); req.setAttribute("classes", classes);
		 * req.setAttribute("students", students); req.setAttribute("currentPage",
		 * currentPage); req.setAttribute("totalPages", totalPages);
		 * req.setAttribute("rowsPerPage", rowsPerPage); req.setAttribute("sortColumn",
		 * sortColumn); req.getRequestDispatcher("Students.jsp").forward(req, resp);
		 */
    }
}
