<%@ page import="java.util.List" %>
<%@ page import="School.trn.trn_students.StudentsDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deleted Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Deleted Students</h2>
    <%
        List<StudentsDTO> deletedStudents = (List<StudentsDTO>) request.getAttribute("deletedStudents");
        if (deletedStudents == null && deletedStudents.isEmpty()) {
    %>
        <div class="alert alert-warning">No deleted students found.</div>
    <%
        } else {
    %>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>DOB</th>
                <th>Gender</th>
                <th>Contact</th>
                <th>Class</th>
                <th>Course</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (StudentsDTO s : deletedStudents) {
        %>
            <tr>
                <td><%= s.getStudent_id() %></td>
                <td><%= s.getStudent_name() %></td>
                <td><%= s.getDob() %></td>
                <td><%= s.getGender() %></td>
                <td><%= s.getContact() %></td>
                <td><%= s.getClass_name() != null ? s.getClass_name() : "—" %></td>
                <td><%= s.getCourse_name() != null ? s.getCourse_name() : "—" %></td>
                <td>
                    <a href="restoreStudent?student_id=<%= s.getStudent_id() %>" 
                       class="btn btn-sm btn-success"
                       onclick="return confirm('Restore this student?');">
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
    <div class="mt-3">
        <a href="studentList" class="btn btn-secondary">Back to Student List</a>
    </div>
</div>
</body>
</html>
