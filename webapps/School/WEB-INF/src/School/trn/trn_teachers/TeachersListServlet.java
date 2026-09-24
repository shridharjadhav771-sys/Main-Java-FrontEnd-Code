package School.trn.trn_teachers;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

@WebServlet("/teachersList")
public class TeachersListServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String query = req.getParameter("query") == null ? "" : req.getParameter("query");
		String deptIdParam = req.getParameter("dept_id");
		String desigIdParam = req.getParameter("desig_id");
		String sortColumn = req.getParameter("sort_column");
		sortColumn = (sortColumn == null || sortColumn.isEmpty()) ? "teacher_id" : sortColumn;

		int rowsPerPage = req.getParameter("rows") == null?10 : Integer.parseInt(req.getParameter("rows"));
		int currentPage = req.getParameter("cpage") == null? 1 : Integer.parseInt(req.getParameter("cpage"));
		
		Integer deptId = (deptIdParam != null && !deptIdParam.isEmpty())? Integer.parseInt(deptIdParam) : null;
		Integer desigId = (desigIdParam != null && !desigIdParam.isEmpty()) ? Integer.parseInt(desigIdParam) : null;

		DesignationDAO desigDao = new DesignationDAO();
		List<DesignationDTO> designations = desigDao.getAllDesignations();

		DepartmentsDAO deptDao = new DepartmentsDAO();
		List<DepartmentsDTO> departments = deptDao.getAllDepartments();

		TeachersDAO dao = new TeachersDAO();
		List<TeachersDTO> teachers = dao.getSearchedTeachers(query, deptId, desigId, rowsPerPage, currentPage, sortColumn);
		int totalTeachers = dao.getSearchedTeachersCount(query, deptId, desigId);
		int totalPages = (int) Math.ceil((double) totalTeachers / rowsPerPage);
		
		 Map<String, Object> responseMap = new HashMap<>();
		 
		 responseMap.put("teachers", teachers);
		 responseMap.put("departments", departments);
		 responseMap.put("designations",designations);
		 responseMap.put("totalTeachers", totalTeachers);
		 responseMap.put("totalPages", totalPages);
		 responseMap.put("rowsPerPage", rowsPerPage);
		 responseMap.put("currentPage", currentPage);
		 responseMap.put("deptId", deptId);
		 responseMap.put("desigId", desigId);
	     responseMap.put("query", query);
	     responseMap.put("sortColumn", sortColumn);

	     resp.setContentType("application/json");
	     resp.getWriter().write(new Gson().toJson(responseMap));

		 
//
//		req.setAttribute("designations", designations);
//		req.setAttribute("departments", departments);
//		req.setAttribute("teachers", teachers);
//		req.setAttribute("currentPage", currentPage);
//		req.setAttribute("rowsPerPage", rowsPerPage );
//		req.setAttribute("totalPages", totalPages);
//		req.setAttribute("sortColumn", sortColumn);
//		req.getRequestDispatcher("Teachers.jsp").forward(req, resp); 
	}
}
