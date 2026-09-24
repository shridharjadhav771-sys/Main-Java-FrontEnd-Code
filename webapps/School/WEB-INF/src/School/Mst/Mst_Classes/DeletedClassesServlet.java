package School.Mst.Mst_Classes;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deletedClasses")
public class DeletedClassesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ClassesDAO dao = new ClassesDAO();
        List<ClassesDTO> deletedList = dao.getDeletedClasses();
        req.setAttribute("deletedList", deletedList);
        req.getRequestDispatcher("ClassDeleted.jsp").forward(req, resp);
    }
}
