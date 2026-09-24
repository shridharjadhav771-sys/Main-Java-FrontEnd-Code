package School.trn.trn_marks;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/deletedMarks")
public class GetDeletedMarksServlet extends HttpServlet {
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<MarksDTO> list = new MarksDAO().getDeletedMarks();
        req.setAttribute("deletedMarks", list);
        req.getRequestDispatcher("MarksDeleted.jsp").forward(req, resp);
    }
}
