package School.Mst.Mst_fee_types;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/restoreFeeType")
public class RestoreFeeTypesServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("fee_type_id"));

		FeeTypesDAO dao = new FeeTypesDAO();
		boolean status = dao.restoreFeeType(id);
		if(status) {
        	System.out.println("Fee Type deleted successfully");
        }else {
        	System.out.println("Fee Type deletion failed");
        }
		resp.sendRedirect("feeTypes");
	}
}
