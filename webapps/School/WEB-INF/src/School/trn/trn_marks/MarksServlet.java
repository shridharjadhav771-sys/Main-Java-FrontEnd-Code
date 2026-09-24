package School.trn.trn_marks;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import School.Mst.Mst_examTypes.ExamTypesDAO;
import School.Mst.Mst_examTypes.ExamTypesDTO;
import School.Mst.Mst_subjects.SubjectsDAO;
import School.Mst.Mst_subjects.SubjectsDTO;
import School.trn.trn_students.StudentsDAO;
import School.trn.trn_students.StudentsDTO;

@WebServlet("/marks")
public class MarksServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve data from DAOs
        StudentsDAO studentDao = new StudentsDAO();
        List<StudentsDTO> students = studentDao.getSearchedStudents("", (Integer) null, (Integer) null, 0, 0);

        SubjectsDAO subjectDao = new SubjectsDAO(); 
        List<SubjectsDTO> subjects = subjectDao.getAllSubjects();

        ExamTypesDAO examTypeDao = new ExamTypesDAO();
        List<ExamTypesDTO> examTypes = examTypeDao.getAllExamTypes();
        
        // Logging for debugging
        System.out.println("Students: " + (students != null ? students.size() : "null"));
        System.out.println("Subjects: " + (subjects != null ? subjects.size() : "null"));
        System.out.println("ExamTypes: " + (examTypes != null ? examTypes.size() : "null"));
        
        // Set request attributes
        req.setAttribute("students", students);
        req.setAttribute("subjects", subjects);
        req.setAttribute("examTypes", examTypes);
        
        // Check if mark_id is provided for editing
        String markId = req.getParameter("mark_id");
        if (markId != null && !markId.isEmpty()) {
            int id = Integer.parseInt(markId);
            MarksDTO mark = new MarksDAO().getMarkById(id);
            req.setAttribute("mark", mark);
            req.getRequestDispatcher("MarksUpdate.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("MarksIndex.jsp").forward(req, resp);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Parse form data
        int student_id = Integer.parseInt(req.getParameter("student_id"));
        int subject_id = Integer.parseInt(req.getParameter("subject_id"));
        int exam_type_id = Integer.parseInt(req.getParameter("exam_type_id"));
        double marks = Double.parseDouble(req.getParameter("marks"));

        // Create DTO and insert data
        MarksDTO dto = new MarksDTO();
        dto.setStudent_id(student_id);
        dto.setSubject_id(subject_id);
        dto.setExam_type_id(exam_type_id);
        dto.setMarks(marks);
        dto.setIs_deleted(0);

        MarksDAO dao = new MarksDAO();
        boolean status = dao.insertMarks(dto);

        // Redirect to marks list
        resp.sendRedirect("marksList");
    }
}