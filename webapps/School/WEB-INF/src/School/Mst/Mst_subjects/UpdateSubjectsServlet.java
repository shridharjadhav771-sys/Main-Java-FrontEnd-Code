package School.Mst.Mst_subjects;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/updateSubject")
public class UpdateSubjectsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int subjectId = Integer.parseInt(req.getParameter("subject_id"));
        SubjectsDAO dao = new SubjectsDAO();
        SubjectsDTO subject = dao.getSubjectById(subjectId);
        req.setAttribute("subject", subject);
        req.getRequestDispatcher("SubjectsUpdate.jsp").forward(req, resp); 
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int subjectId = Integer.parseInt(req.getParameter("subject_id"));
        String subjectName = req.getParameter("subject_name");
        int isDeleted = Integer.parseInt(req.getParameter("is_deleted"));

        SubjectsDTO dto = new SubjectsDTO();
        dto.setSubject_id(subjectId);
        dto.setSubject_name(subjectName);
        dto.setIs_deleted(isDeleted);

        SubjectsDAO dao = new SubjectsDAO();
        boolean updated = dao.updateSubject(dto);
        
        resp.sendRedirect("subjects");
        
    }
}
