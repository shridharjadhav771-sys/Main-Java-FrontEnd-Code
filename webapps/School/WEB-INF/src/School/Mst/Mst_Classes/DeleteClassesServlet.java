package School.Mst.Mst_Classes;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteClass")
public class DeleteClassesServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int class_id = Integer.parseInt(req.getParameter("class_id"));
		
		ClassesDAO dao = new ClassesDAO();
        boolean status = dao.deleteClassById(class_id);
        if(status) {
        	System.out.println("Class deleted successfully");
        }else {
        	System.out.println("Class deletion failed");
        }
        resp.sendRedirect("class");
	}
}

