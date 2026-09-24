package ajaxProject;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ajaxProject.RegisterDAO;

public class DeleteStudentServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int reg_id = Integer.parseInt(req.getParameter("id"));

		try {
			int status = RegisterDAO.deleteRegisterDetails(reg_id);
			if (status > 0) {
				System.out.println("Delete Successfully");
				resp.sendRedirect("ViewStudent");
			} else {
				System.out.println("not Deleted");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
