package School.Mst.Mst_examTypes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/deletedExamTypes")
public class GetDeletedExamTypesServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ExamTypesDAO dao = new ExamTypesDAO();
		List<ExamTypesDTO> deletedList = dao.getDeletedExamTypes();

		req.setAttribute("deletedExamTypes", deletedList);
		req.getRequestDispatcher("ExamTypesDeleted.jsp").forward(req, resp);
	}
}
