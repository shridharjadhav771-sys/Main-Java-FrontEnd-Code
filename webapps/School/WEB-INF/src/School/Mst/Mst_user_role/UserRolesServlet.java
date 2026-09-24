package School.Mst.Mst_user_role;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.google.gson.Gson;

import School.Utility.StringUtility;

@WebServlet("/userRoles")
public class UserRolesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String actionType = StringUtility.removeNull(req.getParameter("action"));
    	String role_id = req.getParameter("role_id");
    	UserRolesDAO dao = new UserRolesDAO();
    	
        
        if(actionType.equalsIgnoreCase("list")) {
        	List<UserRolesDTO> roles = dao.getAllUserRoles();
        	resp.setContentType("application/json");
			Gson gson = new Gson();
			resp.getWriter().write(gson.toJson(roles));
        }else if(role_id != null && !role_id.isEmpty()) {
        	UserRolesDTO role = dao.getUserRoleById(Integer.parseInt(role_id));
        	resp.setContentType("application/json");
			Gson gson = new Gson();
			resp.getWriter().write(gson.toJson(role));
        }else {
        	List<UserRolesDTO> roles = dao.getAllUserRoles();
        	req.setAttribute("roles", roles);
            req.getRequestDispatcher("userRoles.jsp").forward(req, resp);
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String action = req.getParameter("action");
    	String role_id = req.getParameter("role_id");
    	UserRolesDTO dto = new UserRolesDTO();
    	
    	if(!"delete".equals(action)) {
    		String role_name = req.getParameter("role_name");
            int isDeleted = 0;
           
            dto.setRole_name(role_name);
            dto.setIs_deleted(isDeleted);
    	}
    	boolean status = false;
        UserRolesDAO dao = new UserRolesDAO();
        
        if("update".equals(action) && role_id != null && !role_id.isEmpty()) {
        	dto.setRole_id(Integer.parseInt(role_id));
        	status = dao.updateUserRole(dto);
        }else if("delete".equals(action) && role_id != null && !role_id.isEmpty()) {
        	status = dao.deleteUserRole(Integer.parseInt(role_id));
        }else {
        	status = dao.insertUserRole(dto);
        }
        
        resp.setContentType("text/plain");
		if(status){
		    resp.getWriter().write("success");
		} else {
		    resp.getWriter().write("failure");
		}
    }
}
