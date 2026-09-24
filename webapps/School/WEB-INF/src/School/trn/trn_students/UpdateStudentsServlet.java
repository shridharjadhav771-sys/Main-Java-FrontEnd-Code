package School.trn.trn_students;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/updateStudent")
public class UpdateStudentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int student_id = Integer.parseInt(req.getParameter("student_id"));
        StudentsDAO dao = new StudentsDAO();
        StudentsDTO dto = dao.getStudentById(student_id);
        req.setAttribute("student", dto);
        req.getRequestDispatcher("StudentsUpdate.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int student_id = Integer.parseInt(req.getParameter("student_id"));
        String name = req.getParameter("name");
        int class_id = Integer.parseInt(req.getParameter("class_id"));
        int course_id = Integer.parseInt(req.getParameter("course_id"));
        Date dob = Date.valueOf(req.getParameter("dob"));
        String gender = req.getParameter("gender");
        String contact = req.getParameter("contact");
        
        System.out.println("doPost Called");
        System.out.println("Received: " + name + ", " + class_id + ", " + course_id + ", " + dob + ", " + gender + ", " + contact);


        StudentsDTO dto = new StudentsDTO();
        dto.setStudent_id(student_id);
        dto.setStudent_name(name);
        dto.setClass_id(class_id);
        dto.setCourse_id(course_id);
        dto.setDob(dob);
        dto.setGender(gender);
        dto.setContact(contact);

        StudentsDAO dao = new StudentsDAO();
        boolean status = dao.updateStudent(dto);
        resp.sendRedirect("studentList");
    }
}
