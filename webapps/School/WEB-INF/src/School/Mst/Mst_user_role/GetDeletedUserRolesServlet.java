package School.Mst.Mst_user_role;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/deletedUserRoles")
public class GetDeletedUserRolesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserRolesDAO dao = new UserRolesDAO();
        List<UserRolesDTO> deletedRoles = dao.getDeletedUserRoles();
        req.setAttribute("deletedRoles", deletedRoles);
        req.getRequestDispatcher("UserRolesDeleted.jsp").forward(req, resp);
    }
}
