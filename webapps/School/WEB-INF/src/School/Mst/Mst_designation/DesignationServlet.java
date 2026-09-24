package School.Mst.Mst_designation;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import School.Utility.StringUtility;

@WebServlet("/designation")
public class DesignationServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String actionType = StringUtility.removeNull(req.getParameter("action"));
		String designation_id = req.getParameter("designation_id");
		DesignationDAO dao = new DesignationDAO();
		
		
		
		if(actionType.equalsIgnoreCase("list")) {
			List<DesignationDTO> designations = dao.getAllDesignations();
			resp.setContentType("application/json");
			Gson gson = new Gson();
			resp.getWriter().write(gson.toJson(designations));
		}else if(designation_id != null && !designation_id.isEmpty()) {
			DesignationDTO desig = dao.getDesignationById(Integer.parseInt(designation_id));
			resp.setContentType("application/json");
			Gson gson = new Gson();
			resp.getWriter().write(gson.toJson(desig));
		}else {
			List<DesignationDTO> designations = dao.getAllDesignations();
			req.setAttribute("designations", designations); 
			req.getRequestDispatcher("Designations.jsp").forward(req, resp);
		}
	}
	 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = req.getParameter("action");
		String designation_id = req.getParameter("designation_id");
		
		DesignationDTO dto = new DesignationDTO();

		if(!"delete".equals(action)) {
			String designation_name = req.getParameter("designation_name");
			int isDeleted = 0;
			String isDeletedParam = req.getParameter("isDeleted");
			if (isDeletedParam != null && !isDeletedParam.isEmpty()) {
				isDeleted = Integer.parseInt(isDeletedParam);
			}

			dto.setDesignation_name(designation_name);
			dto.setIs_deleted(isDeleted);
		}
		
		
		DesignationDAO dao = new DesignationDAO();
		boolean status =  false;
		
		
		if("update".equals(action) && designation_id != null && !designation_id.isEmpty()) {
			dto.setDesignation_id(Integer.parseInt(designation_id));
			status = dao.updateDesignation(dto);
		}else if("delete".equals(action) && designation_id != null && !designation_id.isEmpty()) {
			status = dao.deleteDesignationById(Integer.parseInt(designation_id));
		}else {
			status = dao.insertDesignation(dto);
		}
		resp.setContentType("text/plain");
		if(status){
		    resp.getWriter().write("success");
		} else {
		    resp.getWriter().write("failure");
		}
	}
}


