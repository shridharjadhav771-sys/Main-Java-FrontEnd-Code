package ajaxProject;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewStudent")
public class ViewStudentsServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			ArrayList<RegisterDTO> regList = new ArrayList<RegisterDTO>();

			regList = RegisterDAO.displayRegisterDetails();

			if (regList != null) {
				req.getSession().setAttribute("registerList", regList);
				resp.sendRedirect("view1.jsp");
			} else {
				System.out.println("List is null");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
