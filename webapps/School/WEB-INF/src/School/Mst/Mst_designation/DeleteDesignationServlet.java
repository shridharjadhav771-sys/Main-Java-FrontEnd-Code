package School.Mst.Mst_designation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteDesignation")
public class DeleteDesignationServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int designation_id = Integer.parseInt(req.getParameter("designation_id"));
		DesignationDAO dao = new DesignationDAO();
		boolean status = dao.deleteDesignationById(designation_id);
		if(status) {
        	System.out.println("Designation deleted successfully");
        }else {
        	System.out.println("Designation deletion failed");
        }
        resp.sendRedirect("designation");
	}
	
	
}
