package School.Mst.Mst_Classes;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import School.Utility.StringUtility;

@WebServlet("/class")
public class ClassesServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String actionType = StringUtility.removeNull(req.getParameter("action"));
		String class_id = req.getParameter("class_id");
		
		ClassesDAO dao = new ClassesDAO();
		
		if(actionType.equalsIgnoreCase("list")) {
			List<ClassesDTO> classes = dao.getAllClasses();
			resp.setContentType("application/json");
			Gson gson = new Gson();
			resp.getWriter().write(gson.toJson(classes));
		}else if(class_id != null && !class_id.isEmpty()) {
			ClassesDTO clasS = dao.getClassById(Integer.parseInt(class_id));
			resp.setContentType("application/json");
	        Gson gson = new Gson();
	        resp.getWriter().write(gson.toJson(clasS));
		}else {
			List<ClassesDTO> classes = dao.getAllClasses();
			req.setAttribute("classes", classes);
			req.getRequestDispatcher("classes.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = req.getParameter("action");
		String classId = req.getParameter("class_id");
		ClassesDTO dto = new ClassesDTO();
		
		if(!"delete".equals(action)) {
			String className = req.getParameter("className");
			int isDeleted = 0;
			String isDeletedParam = req.getParameter("isDeleted");
			if (isDeletedParam != null && !isDeletedParam.isEmpty()) {
				isDeleted = Integer.parseInt(isDeletedParam);
			}
			
			dto.setClassName(className);
			dto.setIsDeleted(isDeleted);
			
		}
		
		boolean status = false;
		
		ClassesDAO dao = new ClassesDAO();
		if("update".equals(action) && classId != null && !classId.isEmpty()) {
			dto.setClassId(Integer.parseInt(classId));
			status = dao.updateClass(dto);
		}else if("delete".equals(action) && classId != null && !classId.isEmpty()) {
			status = dao.deleteClassById(Integer.parseInt(classId));
		}else {
			status = dao.insertClass(dto);
		}
		
		resp.setContentType("text/plain");
		if(status){
		    resp.getWriter().write("success");
		} else {
		    resp.getWriter().write("failure");
		}
	}
}

