package School.Mst.Mst_user_role;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/restoreUserRole")
public class RestoreUserRolesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int role_id = Integer.parseInt(req.getParameter("role_id"));
        UserRolesDAO dao = new UserRolesDAO();
        boolean status = dao.restoreUserRole(role_id);
        if(status) {
        	System.out.println("User role restored successfully!");
        }else {
        	System.out.println("User role restore failed!");
        }
        resp.sendRedirect("deletedUserRoles");
    }
}
