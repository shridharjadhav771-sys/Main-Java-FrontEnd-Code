package School.Mst.Mst_departments;

import java.io.IOException;
import java.net.http.HttpClient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateDept")
public class UpdateDepartmentsServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int dept_id = Integer.parseInt(req.getParameter("dept_id"));
		DepartmentsDAO dao = new DepartmentsDAO();
		DepartmentsDTO dept = dao.getDeptById(dept_id);
		req.setAttribute("dept", dept);
		req.getRequestDispatcher("DeptUpdate.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int dept_id = Integer.parseInt(req.getParameter("dept_id"));
		String dept_name = req.getParameter("dept_name");
		int isDeleted = 0;
		String isDeletedParam = req.getParameter("isDeleted");
		if (isDeletedParam != null && !isDeletedParam.isEmpty()) {
			isDeleted = Integer.parseInt(isDeletedParam);
		}
		
		DepartmentsDTO dto = new DepartmentsDTO();
		dto.setDept_id(dept_id);
		dto.setDept_name(dept_name);
		dto.setIs_deleted(isDeleted);
		
		DepartmentsDAO dao = new DepartmentsDAO();
		boolean status = dao.updateDept(dto);
		resp.sendRedirect("DeptIndex.jsp");
	}

}
