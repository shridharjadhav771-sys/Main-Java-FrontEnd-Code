package School.Mst.Mst_Classes;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateClass")
public class UpdateClassesServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int class_id = Integer.parseInt(req.getParameter("class_id"));
		
		ClassesDAO dao = new ClassesDAO();
        ClassesDTO class1 = dao.getClassById(class_id);
		req.setAttribute("class1", class1);
		req.getRequestDispatcher("ClassUpdate.jsp").forward(req, resp);
	}
	
	@Override 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int class_id = Integer.parseInt(req.getParameter("class_id"));
		
		String className = req.getParameter("className");
		int isDeleted = 0;
		String isDeletedParam = req.getParameter("isDeleted");
		if (isDeletedParam != null && !isDeletedParam.isEmpty()) {
			isDeleted = Integer.parseInt(isDeletedParam);
		}

		ClassesDTO dto = new ClassesDTO();
		dto.setClassId(class_id);
		dto.setClassName(className);
		dto.setIsDeleted(isDeleted);
		
		ClassesDAO dao = new ClassesDAO();
		boolean status = dao.updateClass(dto);
		resp.sendRedirect("class");
	}
}

