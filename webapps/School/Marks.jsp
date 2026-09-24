<%@ page import="java.util.List" %>
<%@ page import="School.trn.trn_marks.MarksDTO" %>
<%@ page import="School.Mst.Mst_examTypes.ExamTypesDTO" %>
<%@ page import="School.Mst.Mst_subjects.SubjectsDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Marks</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
<%@ include file="nav.jsp" %>

	<%
	int rows = request.getParameter("rows")==null?10:Integer.parseInt(request.getParameter("rows"));
	%>  
    <h2 class="mb-4">All Student Marks</h2>


	<form action="marksList" method="get" class="row gx-3 gy-2 align-items-center mb-4">

    <!-- Search Box -->
    <div class="col-auto">
        <input type="text" name="query" class="form-control" placeholder="Enter search term">
    </div>

    <!-- Class Dropdown -->
    <div class="col-auto">
        <select class="form-select" name="exam_type_id">
            <option value="">-- Select ExamType --</option>
            <%
                List<ExamTypesDTO> examTypesList = (List<ExamTypesDTO>) request.getAttribute("exams");
                if (examTypesList != null && !examTypesList.isEmpty()) {
                    for (ExamTypesDTO eTypes : examTypesList) {
                    	
            %>
                <option value="<%= eTypes.getExam_type_id() %>"><%= eTypes.getExam_name() %></option>
            <%
                    }
                }
            %>
        </select>
    </div>

    <!-- Course Dropdown -->
    <div class="col-auto">
        <select class="form-select" name="subject_id">
            <option value="">-- Select Subjects --</option>
            <%
                List<SubjectsDTO> subjectList = (List<SubjectsDTO>) request.getAttribute("subjects");
                if (subjectList != null && !subjectList.isEmpty()) {
                    for (SubjectsDTO sub : subjectList) {
            %>
                <option value="<%= sub.getSubject_id() %>"><%= sub.getSubject_name() %></option>
            <%
                    }
                }
            %>
        </select>
    </div>
	
	<div class="col-auto">
       <input type="number" value="<%=rows %>" name="rows" class="form-control">
    </div>
    <!-- Submit Button -->
    <div class="col-auto">
        <button type="submit" class="btn btn-primary">Search</button>
    </div>
</form>
	

    <%
        List<MarksDTO> marksList = (List<MarksDTO>) request.getAttribute("marksList");
        if (marksList != null && !marksList.isEmpty()) {
    %>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Student</th>
            <th>Subject</th>
            <th>Exam</th>
            <th>Marks</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (MarksDTO m : marksList) {
        %>
        <tr>
            <td><%= m.getMark_id() %></td>
            <td><%= m.getName() != null ? m.getName() : "—" %></td>
            <td><%= m.getSubject_name() != null ? m.getSubject_name() : "—" %></td>
            <td><%= m.getExam_name() != null ? m.getExam_name() : "—" %></td>
            <td><%= m.getMarks() %></td>
            <td>
                <a href="updateMarks?mark_id=<%= m.getMark_id() %>" class="btn btn-warning btn-sm">Update</a>
                <a href="deleteMarks?mark_id=<%= m.getMark_id() %>" class="btn btn-danger btn-sm"
                   onclick="return confirm('Are you sure you want to delete this mark?');">Delete</a>
            </td>
        </tr>
        <%
            }
        %>
         <tr><td colspan="8" style="text-align: center;"> <a href="#" onclick="loadpage(1)">1</a> <a href="#" onclick="loadpage(2)">2</a> <a href="#" onclick="loadpage(3)">3</a> <a href="#"onclick="loadpage(4)">4</a>  </td></tr>
        </tbody>
    </table>

    <%
        } else {
    %>
    <div class="alert alert-info">No marks records found.</div>
    <%
        }
    %>

    <div class="mt-4">
        <a href="marks" class="btn btn-primary">Add New Marks</a>
        <a href="deletedMarks" class="btn btn-secondary">View Deleted Marks</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
function loadpage(pageno){
	document.studentform.cpage.value = pageno;
	document.studentform.submit();
}
</script>
</body>
</html>
