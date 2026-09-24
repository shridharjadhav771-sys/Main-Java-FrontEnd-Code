package School.trn.trn_students;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/restoreStudent")
public class RestoreStudentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int student_id = Integer.parseInt(req.getParameter("student_id"));
        StudentsDAO dao = new StudentsDAO();
        boolean status = dao.restoreStudent(student_id);
        if(status) {
        	System.out.println("Student restored successfully!");
        }else {
        	System.out.println("Student restoration failed!");
        }
        resp.sendRedirect("deletedStudents");
    }
}
