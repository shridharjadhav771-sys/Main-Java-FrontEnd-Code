package School.Mst.Mst_examTypes;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateExamType")
public class UpdateExamTypesServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int examId = Integer.parseInt(req.getParameter("exam_type_id"));
		ExamTypesDAO dao = new ExamTypesDAO();
		ExamTypesDTO exam = dao.getExamTypesById(examId);
		req.setAttribute("exam", exam);
		req.getRequestDispatcher("ExamTypesUpdate.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int examId = Integer.parseInt(req.getParameter("exam_type_id"));
		String examName = req.getParameter("exam_name");
		int isDeleted = Integer.parseInt(req.getParameter("is_deleted"));

		ExamTypesDTO dto = new ExamTypesDTO();
		dto.setExam_type_id(examId);
		dto.setExam_name(examName);
		dto.setIs_deleted(isDeleted);

		ExamTypesDAO dao = new ExamTypesDAO();
		boolean status = dao.updateExamType(dto);
		resp.sendRedirect("examTypes");
	}
}

