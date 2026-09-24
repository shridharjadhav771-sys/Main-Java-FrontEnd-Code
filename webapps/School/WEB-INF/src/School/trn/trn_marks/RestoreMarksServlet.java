package School.trn.trn_marks;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/restoreMarks")
public class RestoreMarksServlet extends HttpServlet {
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("mark_id"));
        MarksDAO dao = new MarksDAO();
        boolean status = dao.restoreMarks(id);
        if(status) {
        	System.out.println("Marks restored Successfully!");
        }else {
        	System.out.println("Marks restore failed!");
        }
        resp.sendRedirect("deletedMarks");
    }
}