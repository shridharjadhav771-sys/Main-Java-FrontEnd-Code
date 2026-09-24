package School.trn.trn_teachers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateTeacher")
public class UpdateTeachersServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    try {
	        int teacher_id = Integer.parseInt(req.getParameter("teacher_id"));
	        String teacher_name = req.getParameter("name");
	        String email = req.getParameter("email");
	        int dept_id = Integer.parseInt(req.getParameter("dept_id"));
	        int designation_id = Integer.parseInt(req.getParameter("designation_id"));
	        String contact = req.getParameter("contact");

	        TeachersDTO dto = new TeachersDTO();
	        dto.setTeacher_id(teacher_id);
	        dto.setName(teacher_name);
	        dto.setEmail(email); 
	        dto.setDept_id(dept_id);
	        dto.setDesignation_id(designation_id);
	        dto.setContact(contact);
	        dto.setIs_deleted(0);

	        TeachersDAO dao = new TeachersDAO();
	        boolean status = dao.updateTeacher(dto);

	        resp.sendRedirect("teachersList");

	    } catch (Exception e) {
	        e.printStackTrace();
	        resp.sendRedirect("error.jsp");
	    }
	}

}
