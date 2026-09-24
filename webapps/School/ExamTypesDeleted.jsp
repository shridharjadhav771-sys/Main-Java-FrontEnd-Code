<%@ page import="java.util.List" %>
<%@ page import="School.Mst.Mst_examTypes.ExamTypesDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deleted Exam Types</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Deleted Exam Types</h2>

    <div class="mb-3 text-end">
        <a href="examTypes" class="btn btn-primary">Back to Active</a>
    </div>

    <table class="table table-bordered table-hover text-center">
        <thead class="table-danger">
        <tr>
            <th>ID</th>
            <th>Exam Name</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<ExamTypesDTO> deletedList = (List<ExamTypesDTO>) request.getAttribute("deletedExamTypes");
            if (deletedList != null && !deletedList.isEmpty()) {
                for (ExamTypesDTO e : deletedList) {
        %>
        <tr>
            <td><%= e.getExam_type_id() %></td>
            <td><%= e.getExam_name() %></td>
            <td>
                <a href="restoreExamType?exam_type_id=<%= e.getExam_type_id() %>" class="btn btn-success btn-sm"
                   onclick="return confirm('Restore this exam type?')">Restore</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3" class="text-center">No deleted exam types found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
