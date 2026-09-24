package School.Mst.Mst_fee_types;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/updateFeeType")
public class UpdateFeeTypesServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(req.getParameter("fee_type_id"));

		FeeTypesDAO dao = new FeeTypesDAO();
		FeeTypesDTO feeType = dao.getFeeTypesById(id);
		req.setAttribute("feeType", feeType);
		req.getRequestDispatcher("FeeTypesUpdate.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int feeTypeId = Integer.parseInt(req.getParameter("fee_type_id"));
		String feeName = req.getParameter("fee_name");
		int isDeleted = Integer.parseInt(req.getParameter("is_deleted"));

		FeeTypesDTO dto = new FeeTypesDTO();
		dto.setFee_type_id(feeTypeId);
		dto.setFee_name(feeName);
		dto.setIs_deleted(isDeleted);

		FeeTypesDAO dao = new FeeTypesDAO();
		boolean status = dao.updateFeeType(dto);

		resp.sendRedirect("feeTypes");
	}
}
