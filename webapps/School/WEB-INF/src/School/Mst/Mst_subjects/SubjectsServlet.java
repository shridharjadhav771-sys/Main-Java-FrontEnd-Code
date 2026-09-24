package School.Mst.Mst_subjects;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import School.Utility.StringUtility;

@WebServlet("/subjects")
public class SubjectsServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String actionType = StringUtility.removeNull(req.getParameter("action"));
		String subject_id = req.getParameter("subject_id");
		
		SubjectsDAO dao = new SubjectsDAO();
		
		if(actionType.equalsIgnoreCase("list")){
			List<SubjectsDTO> subjects = dao.getAllSubjects();
			resp.setContentType("application/json");
			Gson gson = new Gson();
			resp.getWriter().write(gson.toJson(subjects));
		}else if(subject_id != null && !subject_id.isEmpty()) {
			SubjectsDTO subject = dao.getSubjectById(Integer.parseInt(subject_id));
			resp.setContentType("application/json");
			Gson gson = new Gson();
			resp.getWriter().write(gson.toJson(subject));
		}else {
			List<SubjectsDTO> subjects = dao.getAllSubjects();
			req.setAttribute("subjects", subjects);
			req.getRequestDispatcher("Subjects.jsp").forward(req, resp);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = req.getParameter("action");
		String subject_id = req.getParameter("subject_id");
		SubjectsDTO dto = new SubjectsDTO();
		
		if(!"delete".equalsIgnoreCase(action)) {
			String subject_name = req.getParameter("subject_name");
			int isDeleted = 0;
			
			dto.setSubject_name(subject_name);
			dto.setIs_deleted(isDeleted);
		}
		boolean status = false;
		
		SubjectsDAO dao = new SubjectsDAO();
		if("update".equalsIgnoreCase(action) && subject_id != null && !subject_id.isEmpty()) {
			dto.setSubject_id(Integer.parseInt(subject_id));
			status = dao.updateSubject(dto);
		}else if("delete".equalsIgnoreCase(action) && subject_id != null && !subject_id.isEmpty()) {
			status = dao.deleteSubject(Integer.parseInt(subject_id));
		}else {
			status = dao.insertSubject(dto);
		}
		
		resp.setContentType("text/plain");
		if(status){
		    resp.getWriter().write("success");
		} else {
		    resp.getWriter().write("failure");
		}
	}
}
