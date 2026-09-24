<%@ page import="java.util.List" %>
<%@ page import="School.Mst.Mst_subjects.SubjectsDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Deleted Subjects</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Deleted Subjects</h2>

    <div class="mb-3 text-end">
        <a href="subjects" class="btn btn-primary">Back to Active Subjects</a>
    </div>

    <table class="table table-bordered table-hover text-center">
        <thead class="table-danger">
            <tr>
                <th>Subject ID</th>
                <th>Subject Name</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<SubjectsDTO> deletedSubjects = (List<SubjectsDTO>) request.getAttribute("deletedSubjects");
            if (deletedSubjects != null && !deletedSubjects.isEmpty()) {
                for (SubjectsDTO s : deletedSubjects) {
        %>
            <tr>
                <td><%= s.getSubject_id() %></td>
                <td><%= s.getSubject_name() %></td>
                <td>
                    <a href="restoreSubject?subject_id=<%= s.getSubject_id() %>" class="btn btn-success btn-sm"
                       onclick="return confirm('Are you sure you want to restore this subject?')">Restore</a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="3" class="text-center">No deleted subjects found.</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
