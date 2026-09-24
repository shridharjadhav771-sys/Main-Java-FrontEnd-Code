package School.Mst.Mst_departments;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deletedDept")
public class GetDeletedDepartmentsServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DepartmentsDAO dao = new DepartmentsDAO();
		List<DepartmentsDTO> deptsList = dao.getDeletedDepts();
		req.setAttribute("deptsList", deptsList);
		req.getRequestDispatcher("DeptDeleted.jsp").forward(req, resp);
	}
}
