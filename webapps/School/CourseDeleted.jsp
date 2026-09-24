<%@ page import="java.util.List" %>
<%@ page import="School.Mst.Mst_Courses.CoursesDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Courses List</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Courses List</h2>
        <table class="table table-bordered table-hover text-center">
            <thead class="table-dark">
                <tr>
                    <th>Course ID</th>
                    <th>Course Name</th>
                    <th>Course Duration</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <%
    List<CoursesDTO> deletedList = (List<CoursesDTO>) request.getAttribute("deletedList");
%>
<tbody>
<%
    if (deletedList != null && !deletedList.isEmpty()) {
        for (CoursesDTO c : deletedList) {
%>
            <tr>
                <td><%= c.getCourse_id() %></td>
                <td><%= c.getCourse_name() %></td>
                <td><%= c.getCourse_duration() %></td>
                <td>
                    <a href="restoreCourse?course_id=<%=c.getCourse_id()%>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Restore</a>
                </td>
            </tr>
<%
        }
    } else {
%>
        <tr>
            <td colspan="4" class="text-center">No courses found.</td>
        </tr>
<%
    }
%>
</tbody>

        </table>
    </div>

    <!-- Bootstrap JS CDN (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
