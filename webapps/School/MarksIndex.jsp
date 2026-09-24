<%@ page import="java.util.List" %>
<%@ page import="School.trn.trn_students.StudentsDTO" %>
<%@ page import="School.Mst.Mst_subjects.SubjectsDTO" %>
<%@ page import="School.Mst.Mst_examTypes.ExamTypesDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student Marks</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="nav.jsp" %>
<div class="container mt-5">

    <h2 class="mb-4">Add Marks</h2>

    <form action="marks" method="post" class="row g-3">

        <div class="col-md-4">
            <label class="form-label">Student</label>
            <select name="student_id" class="form-select" required>
                <option value="">-- Select Student --</option>
                <%
                    List<StudentsDTO> students = (List<StudentsDTO>) request.getAttribute("students");
                    if (students != null && !students.isEmpty()) {
                        for (StudentsDTO stu : students) {
                %>
                <option value="<%= stu.getStudent_id() %>"><%= stu.getStudent_name() %></option>
                <%
                        }
                    }
                %>
            </select>
        </div>

        <div class="col-md-4">
            <label class="form-label">Subject</label>
            <select name="subject_id" class="form-select" required>
                <option value="">-- Select Subject --</option>
                <%
                    List<SubjectsDTO> subjects = (List<SubjectsDTO>) request.getAttribute("subjects");
                    if (subjects != null && !subjects.isEmpty()) {
                        for (SubjectsDTO subj : subjects) {
                %>
                <option value="<%= subj.getSubject_id() %>"><%= subj.getSubject_name() %></option>
                <%
                        }
                    }
                %>
            </select>
        </div>

        <div class="col-md-4">
            <label class="form-label">Exam Type</label>
            <select name="exam_type_id" class="form-select" required>
                <option value="">-- Select Exam --</option>
                <%
                    List<ExamTypesDTO> exams = (List<ExamTypesDTO>) request.getAttribute("examTypes");
                    if (exams != null && !exams.isEmpty()) {
                        for (ExamTypesDTO ex : exams) {
                %>
                <option value="<%= ex.getExam_type_id() %>"><%= ex.getExam_name() %></option>
                <%
                        }
                    }
                %>
            </select>
        </div>

        <div class="col-md-4">
            <label class="form-label">Marks</label>
            <input type="number" name="marks" step="0.01" min="0" class="form-control" required />
        </div>

        <div class="col-12">
            <button type="submit" class="btn btn-success">Add Marks</button>
            <a href="marksList" class="btn btn-secondary">View All Marks</a>
        </div>

    </form>
</div>
</body>
</html>
