package School.Mst.Mst_fee_types;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.google.gson.Gson;

import School.Utility.StringUtility;

@WebServlet("/feeTypes")
public class FeeTypesServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String actionType = StringUtility.removeNull(req.getParameter("action"));
        String feeTypeId = req.getParameter("fee_type_id");

        FeeTypesDAO dao = new FeeTypesDAO();

        if (actionType.equalsIgnoreCase("list")) {
            // return all fee types in JSON format
            List<FeeTypesDTO> feeList = dao.getAllFeeTypes();
            resp.setContentType("application/json");
            Gson gson = new Gson();
            resp.getWriter().write(gson.toJson(feeList));

        } else if (feeTypeId != null && !feeTypeId.isEmpty()) {
            // return single fee type by ID in JSON
            FeeTypesDTO feeType = dao.getFeeTypesById(Integer.parseInt(feeTypeId));
            resp.setContentType("application/json");
            Gson gson = new Gson();
            resp.getWriter().write(gson.toJson(feeType));

        } else {
            // forward to JSP page
            List<FeeTypesDTO> feeList = dao.getAllFeeTypes();
            req.setAttribute("feeTypes", feeList);
            req.getRequestDispatcher("FeeTypes.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String feeTypeId = req.getParameter("fee_type_id");

        FeeTypesDTO dto = new FeeTypesDTO();

        if (!"delete".equals(action)) {
            String feeName = req.getParameter("fee_name");
            dto.setFee_name(feeName);
        }

        boolean status = false;
        FeeTypesDAO dao = new FeeTypesDAO();

        if ("update".equals(action) && feeTypeId != null && !feeTypeId.isEmpty()) {
            dto.setFee_type_id(Integer.parseInt(feeTypeId));
            status = dao.updateFeeType(dto);

        } else if ("delete".equals(action) && feeTypeId != null && !feeTypeId.isEmpty()) {
            status = dao.deleteFeeType(Integer.parseInt(feeTypeId));

        } else {
            status = dao.insertFeeType(dto);
        }

        resp.setContentType("text/plain");
        if (status) {
            resp.getWriter().write("success");
        } else {
            resp.getWriter().write("failure");
        }
    }
}
