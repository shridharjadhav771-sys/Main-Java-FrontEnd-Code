package School.trn.trn_students;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/deletedStudents")
public class GetDeletedStudentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StudentsDAO dao = new StudentsDAO();
        List<StudentsDTO> deletedList = dao.getDeletedStudents();
        req.setAttribute("deletedStudents", deletedList);
        req.getRequestDispatcher("StudentsDeleted.jsp").forward(req, resp);
    }
}
