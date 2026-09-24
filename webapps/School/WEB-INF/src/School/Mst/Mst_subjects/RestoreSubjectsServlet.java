package School.Mst.Mst_subjects;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/restoreSubject")
public class RestoreSubjectsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int subjectId = Integer.parseInt(req.getParameter("subject_id"));
        SubjectsDAO dao = new SubjectsDAO();
        boolean status = dao.restoreSubject(subjectId);
        if(status) {
        	System.out.println("Subject restored successfully!");
        }else {
        	System.out.println("Subject restore failed!");
        }
        resp.sendRedirect("deletedSubjects");
    }
}
