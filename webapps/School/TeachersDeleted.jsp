<%@ page import="java.util.List" %>
<%@ page import="School.trn.trn_teachers.TeachersDTO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Deleted Teachers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Deleted Teachers</h2>

    <%
        List<TeachersDTO> deletedTeachers = (List<TeachersDTO>) request.getAttribute("deletedTeachers");
        if (deletedTeachers == null || deletedTeachers.isEmpty()) {
    %>
        <div class="alert alert-info">No deleted teachers found.</div>
    <%
        } else {
    %>
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Contact</th>
            <th>Department</th>
            <th>Designation</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (TeachersDTO t : deletedTeachers) {
        %>
        <tr>
            <td><%= t.getTeacher_id() %></td>
            <td><%= t.getName() %></td>
            <td><%= t.getContact() %></td>
            <td><%= t.getDept_name() %></td>
            <td><%= t.getDesignation_name() %></td>
            <td>
                <a href="restoreTeacher?teacher_id=<%= t.getTeacher_id() %>" class="btn btn-sm btn-success"
                   onclick="return confirm('Are you sure you want to restore this teacher?');">Restore</a>
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
        <a href="teachersList" class="btn btn-secondary">Back to Teachers List</a>
    </div>
</div>
</body>
</html>
