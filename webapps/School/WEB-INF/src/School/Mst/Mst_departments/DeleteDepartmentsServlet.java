package School.Mst.Mst_departments;

import java.io.IOException;
import java.net.http.HttpClient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteDept")
public class DeleteDepartmentsServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int dept_id = Integer.parseInt(req.getParameter("dept_id"));
		DepartmentsDAO dao = new DepartmentsDAO();
		boolean status = dao.deleteDept(dept_id);
		if(status) {
        	System.out.println("Course deleted successfully");
        }else {
        	System.out.println("Course deletion failed");
        }
        resp.sendRedirect("department");
	}
}
