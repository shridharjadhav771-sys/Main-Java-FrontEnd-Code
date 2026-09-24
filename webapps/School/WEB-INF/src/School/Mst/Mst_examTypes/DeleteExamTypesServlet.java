package School.Mst.Mst_examTypes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/deleteExamType")
public class DeleteExamTypesServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("exam_type_id"));

		ExamTypesDAO dao = new ExamTypesDAO();
		boolean status = dao.deleteExamType(id);
		if(status) {
        	System.out.println("Exam Type deleted successfully");
        }else {
        	System.out.println("Exam Type deletion failed");
        }
		resp.sendRedirect("examTypes");
	}
}
