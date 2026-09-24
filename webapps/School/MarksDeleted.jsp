<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="School.trn.trn_marks.MarksDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deleted Marks</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Deleted Marks</h2>

    <%
        // Expecting a servlet to set "deletedMarks" attribute
        List<MarksDTO> deletedMarks = (List<MarksDTO>) request.getAttribute("deletedMarks");
        if (deletedMarks == null || deletedMarks.isEmpty()) {
    %>
        <div class="alert alert-warning">No deleted marks found.</div>
    <%
        } else {
    %>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Student</th>
                <th>Subject</th>
                <th>Exam</th>
                <th>Marks</th>
                <th>Restore</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (MarksDTO m : deletedMarks) {
            %>
            <tr>
                <td><%= m.getMark_id() %></td>
                <td><%= m.getName() != null ? m.getName() : "—" %></td>
                <td><%= m.getSubject_name() != null ? m.getSubject_name() : "—" %></td>
                <td><%= m.getExam_name() != null ? m.getExam_name() : "—" %></td>
                <td><%= m.getMarks() %></td>
                <td>
                    <a href="restoreMarks?mark_id=<%= m.getMark_id() %>"
                       class="btn btn-sm btn-success"
                       onclick="return confirm('Restore this mark?');">
                       Restore
                    </a>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <%
        }
    %>

    <div class="mt-4">
        <a href="marksList" class="btn btn-secondary">Back to All Marks</a>
    </div>
</div>
</body>
</html>
