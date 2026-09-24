package School.Mst.Mst_designation;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deletedDesignation")
public class GetDeletedDesignationServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DesignationDAO dao = new DesignationDAO();
		List<DesignationDTO> deletedDesignations = dao.getDeletedDesignations();
		req.setAttribute("deletedDesignations", deletedDesignations);
		req.getRequestDispatcher("DesignationDeleted.jsp").forward(req, resp);
	}
	
}
