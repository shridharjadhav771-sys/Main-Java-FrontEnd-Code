package School.trn.trn_teachers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import School.Mst.Mst_departments.DepartmentsDAO;
import School.Mst.Mst_departments.DepartmentsDTO;
import School.Mst.Mst_designation.DesignationDAO;
import School.Mst.Mst_designation.DesignationDTO;

@WebServlet("/teachers")
public class TeachersServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DepartmentsDAO deptDAO = new DepartmentsDAO();
		List<DepartmentsDTO> departments = deptDAO.getAllDepartments();

		DesignationDAO desigDAO = new DesignationDAO();
		List<DesignationDTO> designations = desigDAO.getAllDesignations();

		req.setAttribute("departments", departments);
		req.setAttribute("designations", designations);

		String teacher_id = req.getParameter("teacher_id");

		if(teacher_id != null && !teacher_id.isEmpty()) {
			int id = Integer.parseInt(teacher_id);
			TeachersDAO teachDAO = new TeachersDAO();
			TeachersDTO teacher = teachDAO.getTeacherById(id);
			
			if(teacher != null) {
				resp.setContentType("application/json");
				resp.getWriter().write(new Gson().toJson(teacher));
			}else {
				resp.setContentType("application/plain");
				resp.getWriter().write("error"); 
			}
		}else {
			req.getRequestDispatcher("TeachersIndex.jsp").forward(req, resp);
		}
	}

	// ... (imports and annotations remain unchanged)
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		String teacherId = req.getParameter("teacher_id");
		TeachersDTO dto = new TeachersDTO();
		
		
		if (!"delete".equals(action)) {
		String teacher_name = req.getParameter("name");
	    String email = req.getParameter("email");
	    int dept_id = Integer.parseInt(req.getParameter("dept_id"));
	    int designation_id = Integer.parseInt(req.getParameter("designation_id"));
	    String contact = req.getParameter("contact");

	    
	    dto.setName(teacher_name);
	    dto.setEmail(email); 
	    dto.setDept_id(dept_id);
	    dto.setDesignation_id(designation_id);
	    dto.setContact(contact);
	    dto.setIs_deleted(0);
		}
		
	    TeachersDAO dao = new TeachersDAO();
	    boolean status = dao.insertTeacher(dto);
	    
	    if("update".equals(action) && teacherId != null && !teacherId.isEmpty()) {
	    	dto.setTeacher_id(Integer.parseInt(teacherId));
	    	status = dao.updateTeacher(dto);
	    }else if("delete".equals(action) && teacherId != null && !teacherId.isEmpty()) {
	    	status = dao.deleteTeacherById(Integer.parseInt(teacherId));
	    }else {
	    	status = dao.insertTeacher(dto);
	    }
	    //resp.sendRedirect("teachers");
	    
	    resp.setContentType("application/plain");
	    if(status) {
	    	resp.getWriter().write("success");
	    }else {
	    	resp.getWriter().write("failure");
	    }
	}

}
