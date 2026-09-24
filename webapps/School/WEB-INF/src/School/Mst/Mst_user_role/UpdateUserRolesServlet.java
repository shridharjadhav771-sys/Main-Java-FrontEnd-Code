package School.Mst.Mst_user_role;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/updateUserRole")
public class UpdateUserRolesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int role_id = Integer.parseInt(req.getParameter("role_id"));
        UserRolesDAO dao = new UserRolesDAO();
        UserRolesDTO dto = dao.getUserRoleById(role_id);
        req.setAttribute("role", dto);
        req.getRequestDispatcher("UserRoleUpdate.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int role_id = Integer.parseInt(req.getParameter("role_id"));
        String role_name = req.getParameter("role_name");
        

        UserRolesDTO dto = new UserRolesDTO();
        dto.setRole_id(role_id);
        dto.setRole_name(role_name);

        UserRolesDAO dao = new UserRolesDAO();
        boolean status = dao.updateUserRole(dto); 

        resp.sendRedirect("userRoles");
    }
}
