<%@ page import="java.util.List" %>
<%@ page import="School.Mst.Mst_Classes.ClassesDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Classes List</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Classes List</h2>
        <table class="table table-bordered table-hover text-center">
            <thead class="table-dark">
                <tr>
                    <th>Class ID</th>
                    <th>Class Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            
            <%
            	List<ClassesDTO> deletedList = (List<ClassesDTO>) request.getAttribute("deletedList");
            	if(deletedList != null && !deletedList.isEmpty()){
            		for(ClassesDTO c : deletedList){
            	
            %>
                <!-- Sample Data Row -->
                
                <tr>
                    <td><%= c.getClassId() %></td>
                    <td><%= c.getClassName() %></td>
                    <td>
                    <a href="restoreClass?class_id=<%=c.getClassId()%>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Restore</a>
                </td>
                </tr>
                <%
                }
            } else {
        %>
            <tr>
                <td colspan="8" class="text-center">No classes found.</td>
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
