package School.Mst.Mst_subjects;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/deletedSubjects")
public class GetDeletedSubjectsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SubjectsDAO dao = new SubjectsDAO();
        List<SubjectsDTO> deletedSubjects = dao.getDeletedSubjects();
        req.setAttribute("deletedSubjects", deletedSubjects);
        req.getRequestDispatcher("SubjectsDeleted.jsp").forward(req, resp); // You must create this JSP
    }
}
