package School.trn.trn_students;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/deleteStudent")
public class DeleteStudentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int student_id = Integer.parseInt(req.getParameter("student_id"));
        StudentsDAO dao = new StudentsDAO();
        boolean status = dao.deleteStudent(student_id);
        if(status) {
        	System.out.println("Student deleted successfully!");
        }else {
        	System.out.println("Student deletion failed!");
        }
        resp.sendRedirect("studentList");
    }
}
