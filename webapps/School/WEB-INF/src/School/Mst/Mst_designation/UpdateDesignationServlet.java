package School.Mst.Mst_designation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateDesignation")
public class UpdateDesignationServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int designation_id = Integer.parseInt(req.getParameter("designation_id"));
		DesignationDAO dao = new DesignationDAO();
		DesignationDTO designation = dao.getDesignationById(designation_id);
		req.setAttribute("designation", designation);
		req.getRequestDispatcher("DesignationUpdate.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int designation_id = Integer.parseInt(req.getParameter("designation_id"));
		String designation_name = req.getParameter("designation_name");
		int isDeleted = 0;
		String isDeletedParam = req.getParameter("isDeleted");
		if (isDeletedParam != null && !isDeletedParam.isEmpty()) {
			isDeleted = Integer.parseInt(isDeletedParam);
		}
		
		DesignationDTO dto = new DesignationDTO();
		
		dto.setDesignation_name(designation_name);
		dto.setIs_deleted(isDeleted);
		DesignationDAO dao = new DesignationDAO();
		boolean status = dao.updateDesignation(dto);
		resp.sendRedirect("DesignationIndex.jsp");
	}
}
