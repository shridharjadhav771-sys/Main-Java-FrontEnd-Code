<%@ page import="java.util.List" %>
<%@ page import="School.trn.trn_marks.MarksDTO" %>
<%@ page import="School.trn.trn_students.StudentsDTO" %>
<%@ page import="School.Mst.Mst_subjects.SubjectsDTO" %>
<%@ page import="School.Mst.Mst_examTypes.ExamTypesDTO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Marks</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Update Marks</h2>

    <%
        MarksDTO mark = (MarksDTO) request.getAttribute("mark");
        List<StudentsDTO> students = (List<StudentsDTO>) request.getAttribute("students");
        List<SubjectsDTO> subjects = (List<SubjectsDTO>) request.getAttribute("subjects");
        List<ExamTypesDTO> examTypes = (List<ExamTypesDTO>) request.getAttribute("examTypes");

        if (mark != null) {
    %>

    <form action="updateMarks" method="post">
        <!-- Hidden field to keep mark ID -->
        <input type="hidden" name="mark_id" value="<%= mark.getMark_id() %>">

        <div class="row mb-3">
            <div class="col-md-4">
                <label class="form-label">Student</label>
                <select name="student_id" class="form-select" required>
                    <option value="">-- Select Student --</option>
                    <%
                        if (students != null && !students.isEmpty()) {
                            for (StudentsDTO stu : students) {
                                String selected = (stu.getStudent_id() == mark.getStudent_id()) ? "selected" : "";
                    %>
                    <option value="<%= stu.getStudent_id() %>" <%= selected %>><%= stu.getStudent_name() %></option>
                    <%
                            }
                        } else {
                    %>
                    <option value="" disabled>No students available</option>
                    <%
                        }
                    %>
                </select>
            </div>

            <div class="col-md-4">
                <label class="form-label">Subject</label>
                <select name="subject_id" class="form-select" required>
                    <option value="">-- Select Subject --</option>
                    <%
                        if (subjects != null && !subjects.isEmpty()) {
                            for (SubjectsDTO subj : subjects) {
                                String selected = (subj.getSubject_id() == mark.getSubject_id()) ? "selected" : "";
                    %>
                    <option value="<%= subj.getSubject_id() %>" <%= selected %>><%= subj.getSubject_name() %></option>
                    <%
                            }
                        } else {
                    %>
                    <option value="" disabled>No subjects available</option>
                    <%
                        }
                    %>
                </select>
            </div>

            <div class="col-md-4">
                <label class="form-label">Exam Type</label>
                <select name="exam_type_id" class="form-select" required>
                    <option value="">-- Select Exam --</option>
                    <%
                        if (examTypes != null && !examTypes.isEmpty()) {
                            for (ExamTypesDTO ex : examTypes) {
                                String selected = (ex.getExam_type_id() == mark.getExam_type_id()) ? "selected" : "";
                    %>
                    <option value="<%= ex.getExam_type_id() %>" <%= selected %>><%= ex.getExam_name() %></option>
                    <%
                            }
                        } else {
                    %>
                    <option value="" disabled>No exam types available</option>
                    <%
                        }
                    %>
                </select>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-4">
                <label class="form-label">Marks</label>
                <input  type="number"
                       name="marks"
                       step="0.01"
                       min="0"
                       class="form-control"
                       value="<%= mark.getMarks() %>"
                       required />
            </div>
        </div>

        <div class="d-grid gap-2">
            <button type="submit" class="btn btn-primary">Update Marks</button>
        </div>
    </form>

    <div class="mt-3">
        <a href="marksList" class="btn btn-secondary">Back to Marks List</a>
    </div>

    <%
        } else {
    %>
        <div class="alert alert-danger">Marks data not found!</div>
    <%
        }
    %>
</div>
</body>
</html>