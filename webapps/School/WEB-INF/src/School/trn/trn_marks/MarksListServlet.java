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

@WebServlet("/marksList")
public class MarksListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String query = req.getParameter("query")== null ? "":req.getParameter("query");
    	String subjectIdParam = req.getParameter("subject_id");
    	String examTypeIdParam = req.getParameter("exam_type_id");
    	
    	int rowsPerPage = req.getParameter("rows") == null ? 10 : Integer.parseInt(req.getParameter("rows"));
        int currentPage = req.getParameter("cpage") == null ? 1 : Integer.parseInt(req.getParameter("cpage"));
        
    	
    	Integer subjectId = (subjectIdParam != null && !subjectIdParam.isEmpty())? Integer.parseInt(subjectIdParam):null;
    	Integer examTypeId = (examTypeIdParam != null && !examTypeIdParam.isEmpty())? Integer.parseInt(examTypeIdParam):null;
    	
    	SubjectsDAO subDao = new SubjectsDAO();
    	List<SubjectsDTO> subjects = subDao.getAllSubjects();
    	
    	ExamTypesDAO examDao = new ExamTypesDAO();
    	List<ExamTypesDTO> exams = examDao.getAllExamTypes();
    	
    	
        List<MarksDTO> list = new MarksDAO().getSearchedMarks(query,subjectId,examTypeId,currentPage, rowsPerPage);
        req.setAttribute("exams", exams);
    	req.setAttribute("subjects", subjects);
        req.setAttribute("marksList", list);
        req.getRequestDispatcher("Marks.jsp").forward(req, resp);
    }
}
