package School.trn.trn_students;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import School.Mst.Mst_Classes.ClassesDAO;
import School.Mst.Mst_Classes.ClassesDTO;
import School.Mst.Mst_Courses.CoursesDAO;
import School.Mst.Mst_Courses.CoursesDTO;

@WebServlet("/students")
public class StudentsServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		ClassesDAO classDao = new ClassesDAO();
		List<ClassesDTO> classes = classDao.getAllClasses();

		CoursesDAO courseDao = new CoursesDAO();
		List<CoursesDTO> courses = courseDao.getAllCourses();

		req.setAttribute("courses", courses);
		req.setAttribute("classes", classes);

		String studentId = req.getParameter("student_id");

		if (studentId != null && !studentId.isEmpty()) {
			int id = Integer.parseInt(studentId);
			StudentsDTO student = new StudentsDAO().getStudentById(id);
			if (student != null) {
				resp.setContentType("application/json");
				resp.getWriter().write(new Gson().toJson(student));
			} else {
				resp.setContentType("application/plain");
				resp.getWriter().write("error");
			}
		} else {
			req.getRequestDispatcher("StudentsIndex.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = req.getParameter("action");
		String studentId = req.getParameter("student_id");
		StudentsDTO dto = new StudentsDTO();
		if (!"delete".equals(action)) {
			String student_name = req.getParameter("name");
			int class_id = Integer.parseInt(req.getParameter("class_id"));
			int course_id = Integer.parseInt(req.getParameter("course_id"));
			String dobStr = req.getParameter("dob");
			String gender = req.getParameter("gender");
			String contact = req.getParameter("contact");

			
			dto.setStudent_name(student_name);
			dto.setClass_id(class_id);
			dto.setCourse_id(course_id);
			dto.setDob(Date.valueOf(dobStr)); // yyyy-MM-dd format required
			dto.setGender(gender);
			dto.setContact(contact);
			dto.setIs_deleted(0);
		}

		StudentsDAO dao = new StudentsDAO();
		boolean status;

		if ("update".equals(action) && studentId != null && !studentId.isEmpty()) {
			dto.setStudent_id(Integer.parseInt(studentId));
			status = dao.updateStudent(dto); // Call update method
		} else if ("delete".equals(action) && studentId != null && !studentId.isEmpty()) {
			status = dao.deleteStudent(Integer.parseInt(studentId));
		} else {
			status = dao.insertStudent(dto); // Call insert method
		}

		// resp.sendRedirect("students");
		resp.setContentType("application/plain");
		if (status)
			resp.getWriter().write("success");
		else
			resp.getWriter().write("failure");

	}
}
