package School.Mst.Mst_departments;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import School.Utility.StringUtility;

@WebServlet("/department")
public class DepartmentsServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String actionType =   StringUtility.removeNull(req.getParameter("action"));
		// TODO Auto-generated method stub
		String dept_id = req.getParameter("dept_id");
		
		DepartmentsDAO dao = new DepartmentsDAO();
		
		if ("list".equalsIgnoreCase(actionType)) {
			List<DepartmentsDTO> departments = dao.getAllDepartments();
			resp.setContentType("application/json");
			Gson gson = new Gson();
			resp.getWriter().write(gson.toJson(departments));
		} else if(dept_id != null && !dept_id.isEmpty()) {
			DepartmentsDTO dept = dao.getDeptById(Integer.parseInt(dept_id));
			resp.setContentType("application/json");
	        Gson gson = new Gson();
	        resp.getWriter().write(gson.toJson(dept));
		}else {
			List<DepartmentsDTO> departments = dao.getAllDepartments();
			req.setAttribute("departments", departments);
			req.getRequestDispatcher("departments.jsp").forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = req.getParameter("action");
		String dept_id = req.getParameter("dept_id");
		DepartmentsDTO dto = new DepartmentsDTO();

		if(!"delete".equals(action)) {
			String dept_name = req.getParameter("dept_name");
			int isDeleted = 0;
			String isDeletedParam = req.getParameter("isDeleted");
			if (isDeletedParam != null && !isDeletedParam.isEmpty()) {
				isDeleted = Integer.parseInt(isDeletedParam);
			}

			dto.setDept_name(dept_name);
			dto.setIs_deleted(isDeleted);

		}
		
		boolean status = false;
		
		DepartmentsDAO dao = new DepartmentsDAO();
		if("update".equals(action) && dept_id != null && !dept_id.isEmpty()) {
			dto.setDept_id(Integer.parseInt(dept_id));
			status = dao.updateDept(dto);
		}else if("delete".equals(action) && dept_id != null && !dept_id.isEmpty()) {
			status = dao.deleteDept(Integer.parseInt(dept_id));
		}else {
			status = dao.insertDept(dto);
		}
		
		resp.setContentType("text/plain");
		if(status){
		    resp.getWriter().write("success");
		} else {
		    resp.getWriter().write("failure");
		}
	}
}
