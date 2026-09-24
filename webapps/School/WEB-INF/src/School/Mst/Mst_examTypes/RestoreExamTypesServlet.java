package School.Mst.Mst_examTypes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/restoreExamType")
public class RestoreExamTypesServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("exam_type_id"));

		ExamTypesDAO dao = new ExamTypesDAO();
		boolean status = dao.restoreExamType(id);
		if(status) {
        	System.out.println("Exam Type restored successfully");
        }else {
        	System.out.println("Exam Type restore failed");
        }
		resp.sendRedirect("examTypes");
	}
}
