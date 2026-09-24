<%@ page import="School.Mst.Mst_examTypes.ExamTypesDTO" %>
<%@ page import="School.Mst.Mst_examTypes.ExamTypesDAO" %>
<%
    int id = Integer.parseInt(request.getParameter("exam_type_id"));
    ExamTypesDAO dao = new ExamTypesDAO();
    ExamTypesDTO exam = dao.getExamTypesById(id);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Exam Type</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-warning text-dark text-center">
            <h4>Update Exam Type</h4>
        </div>
        <div class="card-body">
            <form action="updateExamType" method="post">
                <input type="hidden" name="exam_type_id" value="<%= exam.getExam_type_id() %>">
                <input type="hidden" name="is_deleted" value="<%= exam.getIs_deleted() %>">

                <div class="form-group mb-3">
                    <label for="exam_name">Exam Name</label>
                    <input type="text" class="form-control" id="exam_name" name="exam_name"
                           value="<%= exam.getExam_name() %>" required>
                </div>

                <button type="submit" class="btn btn-success w-100">Update</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
