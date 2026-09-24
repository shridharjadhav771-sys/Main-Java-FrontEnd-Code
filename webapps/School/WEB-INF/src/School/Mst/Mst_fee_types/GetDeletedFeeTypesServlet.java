package School.Mst.Mst_fee_types;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/deletedFeeTypes")
public class GetDeletedFeeTypesServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FeeTypesDAO dao = new FeeTypesDAO();
		List<FeeTypesDTO> deletedList = dao.getDeletedFeeTypes();

		req.setAttribute("deletedFeeTypes", deletedList);
		req.getRequestDispatcher("FeeTypesDeleted.jsp").forward(req, resp);
	}
}
