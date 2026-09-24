<%@ page import="School.Mst.Mst_subjects.SubjectsDTO" %>
<%
    SubjectsDTO subject = (SubjectsDTO) request.getAttribute("subject");
    if (subject == null) {
        out.println("<h3 class='text-danger text-center'>No subject data found.</h3>");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Subject</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-lg">
                <div class="card-header bg-primary text-white text-center">
                    <h4>Update Subject</h4>
                </div>
                <div class="card-body">
                    <form action="updateSubject" method="post">
                        <input type="hidden" name="subject_id" value="<%= subject.getSubject_id() %>">

                        <div class="mb-3">
                            <label for="subject_name" class="form-label">Subject Name</label>
                            <input type="text" class="form-control" id="subject_name" name="subject_name"
                                   value="<%= subject.getSubject_name() %>" required>
                        </div>

                        <!-- Optional hidden field if you're tracking is_deleted -->
                        <input type="hidden" name="is_deleted" value="<%= subject.getIs_deleted() %>">

                        <div class="text-center">
                            <button type="submit" class="btn btn-success">Update</button>
                            <a href="subjects" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
