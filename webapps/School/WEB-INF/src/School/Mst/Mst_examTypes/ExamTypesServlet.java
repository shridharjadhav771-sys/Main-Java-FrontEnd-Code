package School.Mst.Mst_examTypes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.google.gson.Gson;

import School.Utility.StringUtility;

import java.io.IOException;
import java.util.List;

@WebServlet("/examTypes")
public class ExamTypesServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionType = StringUtility.removeNull(req.getParameter("action"));
		String exam_type_id = req.getParameter("exam_type_id");
		ExamTypesDAO dao = new ExamTypesDAO();
		
		if(actionType.equalsIgnoreCase("list")) {
			List<ExamTypesDTO> examList = dao.getAllExamTypes();
			resp.setContentType("application/json");
			Gson gson = new Gson();
			resp.getWriter().write(gson.toJson(examList));
		}else if(exam_type_id != null && exam_type_id.isEmpty()) {
			ExamTypesDTO exam = dao.getExamTypesById(Integer.parseInt(exam_type_id));
			resp.setContentType("application/json");
			Gson gson = new Gson();
			resp.getWriter().write(gson.toJson(exam));
		}else {
			List<ExamTypesDTO> examList = dao.getAllExamTypes();
			req.setAttribute("examTypes", examList);
			req.getRequestDispatcher("ExamTypes.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		String exam_type_id = req.getParameter("exam_type_id");
		ExamTypesDTO dto = new ExamTypesDTO();
		
		if(!"delete".equals(action)) {
			String examName = req.getParameter("exam_name");
			int isDeleted = 0;
			
			dto.setExam_name(examName);
			dto.setIs_deleted(isDeleted);
		}
		
		boolean status = false;
		ExamTypesDAO dao = new ExamTypesDAO();
		
		if("update".equals(action) && exam_type_id != null && !exam_type_id.isEmpty()) {
			dto.setExam_type_id(Integer.parseInt(exam_type_id));
			status = dao.updateExamType(dto);
		}else if("delete".equals(action) && exam_type_id != null && !exam_type_id.isEmpty()) {
			status = dao.deleteExamType(Integer.parseInt(exam_type_id));
		}else {
			status = dao.insertExamType(dto);
		}
		
		resp.setContentType("text/plain");
		if(status){
		    resp.getWriter().write("success");
		} else {
		    resp.getWriter().write("failure");
		}
	}
}
